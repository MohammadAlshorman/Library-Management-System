using System;

using System.IO;
using System.Collections.Generic;

using System.Collections.Generic;
using System.IO;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using projectc_.Amal;

namespace projectc_.Hala
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Ensures it only runs on the first page load
            {
                // Load suggestions by default
                blockedUser_Click(sender, e);
                numOfBooks_Click(sender, e);
            }
        }


        protected void blockedUser_Click(object sender, EventArgs e)
        {
            var filepath = Server.MapPath("~/App_Data/BlockedUsers.txt"); // Ensure the file exists
            if (!File.Exists(filepath))
            {
                //feed.InnerHtml = "<p>No users are blocked</p>";
                return;
            }

            string[] blockedUsers = File.ReadAllLines(filepath);
            var count = 1;
            foreach (var user in blockedUsers)
            {
                string[] userb = user.Split('|');
                blockedUser.InnerHtml += $"<tr><td>{count}</td><td>{userb[0]}</td><td>{userb[1]}</td><td>{"Unreturned Books."}</td></tr>";

                count++;
            }
        }

        protected void btnAddTask_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Amal/page1.aspx");
        }

        protected void booksCard_Click1(object sender, EventArgs e)
        {
            Response.Redirect("WebForm2.aspx");
        }

        protected void Rooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Amal/page1.aspx");
        }

        protected void BorrowBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("Requests.aspx");
        }



        protected void numOfBooks_Click(object sender, EventArgs e)
        {
            var filepath = Server.MapPath("~/App_Data/Books.txt"); // Ensure the file exists
            string[] books2 = File.ReadAllLines(filepath);
            numOfBooks.InnerHtml += $"{books2.Length}";
        }

        protected void feedbackView_Click(object sender, EventArgs e)
        {
            Response.Redirect("UsersFeedback.aspx");
        }
    }
}