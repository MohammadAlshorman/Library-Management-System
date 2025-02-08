using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.khalid
{
    public partial class AddBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Add Book functionality
        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("books.txt");
            string uploadFolderPath = Server.MapPath("~/khalid/Images/");

            // for images
            if (!Directory.Exists(uploadFolderPath))
            {
                Directory.CreateDirectory(uploadFolderPath);
            }

            if (!File.Exists(filePath))
            {
                File.CreateText(filePath).Close();
            }

            string[] books = File.ReadAllLines(filePath);
            bool bookExists = false;

            foreach (string book in books)
            {
                string[] value = book.Split('|');
                if (value.Length >= 5 && value[0] == BookID.Text)
                {
                    bookExists = true;
                    break;
                }
            }

            if (bookExists)
            {
                Response.Write("<script>alert('A Book with this ID already exists!');</script>");
            }
            else
            {
                string imageFileName = "default.jpg";

                if (FileUpload1.HasFile) // check if he upload image
                {
                    string fileExtension = Path.GetExtension(FileUpload1.FileName).ToLower();
                    if (fileExtension == ".jpg" || fileExtension == ".png" || fileExtension == ".jpeg")
                    {
                        imageFileName = FileUpload1.FileName;
                        string fullPath = Path.Combine(uploadFolderPath, imageFileName);
                        FileUpload1.SaveAs(fullPath);
                    }
                    else
                    {
                        Response.Write("<script>alert('Only JPG, JPEG, and PNG files are allowed!');</script>");
                        return;
                    }
                }

                using (StreamWriter sw = new StreamWriter(filePath, true))
                {
                    sw.WriteLine($"{BookID.Text}|{Title.Text}|{Author.Text}|{cat.Text}|{imageFileName}|available");
                }

                Response.Write("<script>alert('Book added successfully!');</script>");
            }
        }

        // Edit Book functionality
        protected void btnEditBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooks.aspx");
        }

        // Delete Book functionality
        protected void btnDeleteBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteBooks.aspx");

        }

        // Request Borrow Book functionality
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
