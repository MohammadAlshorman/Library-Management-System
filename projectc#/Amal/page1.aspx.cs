using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class page1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void but1_click(object sender, EventArgs e)
        {
            Response.Redirect("addroom.aspx");

        }



        protected void but2_click(object sender, EventArgs e)
        {
            Response.Redirect("aditroom.aspx");


        }


        protected void but3_click(object sender, EventArgs e)
        {
            Response.Redirect("editnew.aspx");

        }

        protected void but6_click(object sender, EventArgs e)
        {
            Response.Redirect("showallroom.aspx");
        }

        protected void but4_click(object sender, EventArgs e)
        {

        }



        protected void but5_click(object sender, EventArgs e)
        {
            Response.Redirect("showrequest.aspx");
        }





    }
}