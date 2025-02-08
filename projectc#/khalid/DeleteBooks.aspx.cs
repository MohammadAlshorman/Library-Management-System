using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.khalid
{
    public partial class DeleteBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            string book = searchTxt.Text.Trim(); // Get the id to search for
            string filePath = Server.MapPath("books.txt");

            if (File.Exists(filePath))
            {
                string[] data = File.ReadAllLines(filePath);
                bool bookFound = false; // to follow the book

                foreach (string line in data)
                {
                    string[] parts = line.Split('|');
                    if (parts.Length >= 4 && parts[0].Trim() == book) // Check if id matches
                    {
                        // Populate the fields with book data
                        BookID.Text = parts[0].Trim();
                        Title.Text = parts[1].Trim();
                        Author.Text = parts[2].Trim();
                        Genre.Text = parts[3].Trim();

                        bookFound = true; // book found
                        break; // Exit the loop once the book is found
                    }
                }

                if (!bookFound)
                {
                    Response.Write("<script>alert('Book not found!');</script>");

                }
            }
            else
            {
                Response.Write("<script>alert('Books data file not found!');</script>");
            }
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("books.txt");

            if (File.Exists(filePath))
            {
                // Read all lines from the file
                string[] books = File.ReadAllLines(filePath);

                // Create a StreamWriter to overwrite the file
                using (StreamWriter writer = new StreamWriter(filePath))
                {
                    bool bookFound = false; // Flag to track if the book is found

                    foreach (string book in books)
                    {
                        string[] value = book.Split('|'); // Split each line into parts
                        if (value.Length >= 4 && value[0].Trim() == BookID.Text.Trim()) // Check if the ID matches
                        {
                            // Book found, skip writing this book to the file
                            bookFound = true;
                            continue; // Skip writing this book to the file
                        }

                        // Write the remaining books back to the file
                        writer.WriteLine(book);
                    }
                    if (bookFound)
                    {
                        // Show success message
                        Response.Write("<script>alert('Book deleted successfully!');</script>");

                        // Clear the fields after deletion
                        BookID.Text = string.Empty;
                        Title.Text = string.Empty;
                        Author.Text = string.Empty;
                        Genre.Text = string.Empty;
                    }
                    else
                    {
                        // Show error message if book not found
                        Response.Write("<script>alert('Book not found!');</script>");
                    }

                }
            }
            else
            {
                // File does not exist
                Response.Write("<script>alert('Books data file not found!');</script>");
            }
        }


        protected void btnEditBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooks.aspx");

        }

        protected void btnAddeBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBooks.aspx");

        }

        protected void btnRequestBorrow_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReqBorrow.aspx");

        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hala2/BookCards.aspx");
        }
    }
}