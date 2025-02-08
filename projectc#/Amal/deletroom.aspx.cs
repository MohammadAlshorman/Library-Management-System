using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class deletroom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void butsearch_Click(object sender, EventArgs e)
        {
            string file = Server.MapPath("addroomfile.txt");
            if (File.Exists(file))
            {
                string[] r = File.ReadAllLines(file);
                foreach (string line in r)
                {
                    string[] data = line.Split(' ');
                    if (data[0] == search.Text)
                    {

                        result.Text = "sucssess";
                        result.Visible = true;
                        break;
                    }
                    else
                    {
                        result.Text = "faild";
                        result.Visible = true;

                    }
                }
            }
        }

        protected void deletbutton_Click(object sender, EventArgs e)
        {
            string file = Server.MapPath("addroomfile.txt");
            if (File.Exists(file))
            {
                string[] edi = File.ReadAllLines(file);
                for (int i = 0; i < edi.Length; i++)
                {
                    string[] room = edi[i].Split(' ');
                    if (room[0] == roomid.Text)
                    {
                        room[0] =" ";
                        room[1] =" ";
                        room[2] =" ";
                        room[3] =" ";
                        room[4] =" ";
                        


                        edi[i] = $"{room[0]} {room[1]} {room[2]} {room[3]} {room[4]}";
                        labeldelete.Text = " The deleted wsa successed";
                        labeldelete.Visible = true;
                        break;
                    }

                }

                File.WriteAllLines(file, edi);

            }
            Response.Redirect("page1.aspx");
        }
    }
}