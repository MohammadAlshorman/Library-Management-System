using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Hala
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void allBooksAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Khalid/AllBooks.aspx");
        }
        protected void addBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Khalid/AddBooks.aspx");
        }
        protected void editBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Khalid/UpdateBooks.aspx");
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Khalid/DeleteBooks.aspx");
        }

        protected void BorrowBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("BorrowBook.aspx");
        }
    }
}