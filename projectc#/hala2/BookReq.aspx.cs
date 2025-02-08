using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.hala2
{
    public partial class BookReq : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.Label lblMessage;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRequestedBooks();
            }
        }

        // Loads borrow requests from borrow.txt and displays them
        private void LoadRequestedBooks()
        {
            string borrowFilePath = Server.MapPath("borrow.txt");

            // Ensure borrow.txt exists
            if (File.Exists(borrowFilePath))
            {
                string[] borrowedBooks = File.ReadAllLines(borrowFilePath);
                List<Book> bookList = new List<Book>();

                foreach (string book in borrowedBooks)
                {
                    string[] parts = book.Split('|');

                    // Ensure the line has the expected number of fields
                    if (parts.Length >= 7)
                    {
                        Book bookItem = new Book
                        {
                            BookId = parts[1],
                            Title = parts[2],
                            Author = parts[3],
                            Category = parts[4],
                            ImagePath = parts[5],
                            Status = parts[6] // "pending" or "borrowed"
                        };
                        bookList.Add(bookItem);
                    }
                }

                // Bind the list to the GridView
                BooksGridView.DataSource = bookList;
                BooksGridView.DataBind();
            }
            else
            {
                // Error message if the borrow.txt file is not found
                lblMessage.Text = "No borrow requests found.";
                lblMessage.Visible = true;
            }
        }

        // Handles accept or cancel actions from the GridView
        protected void BooksGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AcceptRequest")
            {
                string bookId = e.CommandArgument.ToString();
                string borrowFilePath = Server.MapPath("borrow.txt");

                // Ensure borrow.txt exists
                if (!File.Exists(borrowFilePath))
                {
                    lblMessage.Text = "Error: borrow.txt not found.";
                    lblMessage.Visible = true;
                    return;
                }

                // Read all lines from borrow.txt
                string[] borrowedBooks = File.ReadAllLines(borrowFilePath);
                var updatedRequests = new List<string>();

                foreach (string book in borrowedBooks)
                {
                    string[] parts = book.Split('|');

                    // Ensure the line has the expected number of fields
                    if (parts.Length >= 7 && parts[1] == bookId)
                    {
                        // Update status to "borrowed"
                        parts[6] = "borrowed";
                        updatedRequests.Add(string.Join("|", parts));
                    }
                    else
                    {
                        updatedRequests.Add(book);
                    }
                }

                // Write the updated requests back to borrow.txt
                File.WriteAllLines(borrowFilePath, updatedRequests);

                // Redirect to AllBooks.aspx to reflect the changes
                Response.Redirect("AllBooks.aspx");
            }
            else if (e.CommandName == "CancelRequest")
            {
                // Logic to cancel the borrow request, remove from borrow.txt
                string bookId = e.CommandArgument.ToString();
                string borrowFilePath = Server.MapPath("borrow.txt");

                // Ensure borrow.txt exists
                if (!File.Exists(borrowFilePath))
                {
                    lblMessage.Text = "Error: borrow.txt not found.";
                    lblMessage.Visible = true;
                    return;
                }

                // Read borrow.txt and filter out the canceled request
                string[] borrowedBooks = File.ReadAllLines(borrowFilePath);
                var updatedRequests = borrowedBooks.Where(b => !b.StartsWith(bookId)).ToList();

                // Write the updated list back to borrow.txt
                File.WriteAllLines(borrowFilePath, updatedRequests);

                lblMessage.Text = "Borrow request canceled.";
                lblMessage.Visible = true;

                // Reload the borrow requests after cancellation
                LoadRequestedBooks();
            }
        }

        // Button to edit books (redirects to UpdateBooks page)
        protected void btnEditBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooks.aspx");
        }

        // Button to delete books (redirects to DeleteBooks page)
        protected void btnDeleteBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteBooks.aspx");
        }

        // Button to add new books (redirects to AddBooks page)
        protected void btnAddBorrow_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBooks.aspx");
        }
    }

    // Book class representing the book information
    public class Book
    {
        public string BookId { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Category { get; set; }
        public string ImagePath { get; set; }
        public string Status { get; set; } // Track book status: "pending" or "borrowed"
    }
}