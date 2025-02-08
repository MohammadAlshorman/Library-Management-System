using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace projectc_.Mohammed
{
    public partial class BookDetails : System.Web.UI.Page
    {
        string filePath = HttpContext.Current.Server.MapPath("~/App_Data/UserHistory.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookDetails();
            }
        }

        private void LoadBookDetails()
        {
            if (Request.QueryString["title"] != null)
            {
                string bookTitle = Request.QueryString["title"];

                if (File.Exists(filePath))
                {
                    string[] lines = File.ReadAllLines(filePath);
                    foreach (string line in lines)
                    {
                        string[] data = line.Split('|');
                        if (data.Length >= 6 && data[1] == "Book" && data[2] == bookTitle)
                        {
                            lblBookTitle.Text = data[2];
                            lblBorrowDate.Text = data[3];
                            lblAuthor.Text = data[4];
                            lblGenre.Text = data[5];
                            return;
                        }
                    }
                }

                lblBookTitle.Text = "Book not found!";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("history.aspx");
        }
    }
}
