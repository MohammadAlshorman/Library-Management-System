using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class creattestuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void USERDATA_Click(object sender, EventArgs e)
        {
            string file = Server.MapPath("userdata.txt");
            if (!File.Exists(file))
            {
                using(StreamWriter us = File.CreateText(file))
                {
                    us.WriteLine($"{ROOMIDUSER.Text} {STUDENTNAME.Text} {DATEUSER.Text} {STARTTIMEUSER.Text}");
                }
            }
            else
            {
                using(StreamWriter us2=new StreamWriter(file, true))
                {
                    us2.WriteLine($"{ROOMIDUSER.Text} {STUDENTNAME.Text} {DATEUSER.Text} {STARTTIMEUSER.Text}");

                }
            }
        }
    }
}