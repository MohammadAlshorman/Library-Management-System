using System;
using System.Web;
using System.Web.UI;

namespace projectc_.Amal
{
    public partial class userdash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure user is authenticated before accessing the dashboard
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeeRoom.aspx");
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            Response.Redirect("roomreservation.aspx");
        }
    }
}
