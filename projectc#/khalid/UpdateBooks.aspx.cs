
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace projectc_.khalid
{
    public partial class UpdateBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            string book = searchTxt.Text.Trim(); // Get the ID to search for
            string filePath = Server.MapPath("books.txt");

            if (File.Exists(filePath))
            {
                string[] data = File.ReadAllLines(filePath);
                bool bookFound = false; // Flag to track if the book is found

                foreach (string line in data)
                {
                    string[] parts = line.Split('|'); // Ensure correct delimiter
                    if (parts.Length >= 5 && parts[0].Trim() == book) // Check if ID matches
                    {
                        // Populate the fields with book data
                        BookID.Text = parts[0].Trim();
                        Title.Text = parts[1].Trim();
                        Author.Text = parts[2].Trim();
                        Genre.Text = parts[3].Trim(); // Assuming 'cat' is Genre
                        ImageFileName.Text = parts[4].Trim(); // Add this for the image filename

                        bookFound = true; // Mark book as found
                        break; // Exit loop after finding the book
                    }
                }

                // Only show alert if book was NOT found
                if (!bookFound)
                {
                    Response.Write("<script>alert('Book not found!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Book data file not found!');</script>");
            }
        }




        protected void btnUpdateBook_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("books.txt");
            string book = searchTxt.Text.Trim(); // Get the book ID to search for

            if (File.Exists(filePath))
            {
                // Read all the lines from the file
                string[] books = File.ReadAllLines(filePath);
                bool bookFound = false;

                // Loop through each book record in the file
                for (int i = 0; i < books.Length; i++)
                {
                    string[] value = books[i].Trim().Split('|');

                    // Check if the book ID matches
                    if (value.Length >= 5 && value[0].Trim() == book)
                    {
                        // Update the book data
                        books[i] = $"{BookID.Text.Trim()}|{Title.Text.Trim()}|{Author.Text.Trim()}|{Genre.Text.Trim()}|{ImageFileName.Text.Trim()}";
                        bookFound = true;
                        break; // Exit the loop once the book is found and updated
                    }
                }

                // Check if the book was found and updated
                if (bookFound)
                {
                    try
                    {
                        // Write the updated book data back to the file
                        File.WriteAllLines(filePath, books);
                        Response.Write("<script>alert('Book Data Updated Successfully!');</script>");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error writing to file: " + ex.Message + "');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Book Not Found!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Book data file not found!');</script>");
            }
        }

        protected void btnRequestBorrow_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReqBorrow.aspx");
        }

        protected void btnDeleteBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteBooks.aspx");
        }

        protected void btnAddBorrow_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBooks.aspx");
        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hala2/BookCards.aspx");

        }
    }
}