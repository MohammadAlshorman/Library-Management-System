using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace projectc_.Mohammed
{
    public partial class RoomDetails : System.Web.UI.Page
    {
        string filePath = HttpContext.Current.Server.MapPath("~/App_Data/UserHistory.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRoomDetails();
            }
        }

        private void LoadRoomDetails()
        {
            if (Request.QueryString["room"] != null)
            {
                string roomNumber = Request.QueryString["room"];

                if (File.Exists(filePath))
                {
                    string[] lines = File.ReadAllLines(filePath);
                    foreach (string line in lines)
                    {
                        string[] data = line.Split('|');
                        if (data.Length >= 5 && data[1] == "Room" && data[2] == roomNumber)
                        {
                            lblRoomNumber.Text = data[2];
                            lblReservationDate.Text = data[3];
                            lblRoomType.Text = data[4];
                            return;
                        }
                    }
                }

                lblRoomNumber.Text = "Room not found!";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("history.aspx");
        }
    }
}
