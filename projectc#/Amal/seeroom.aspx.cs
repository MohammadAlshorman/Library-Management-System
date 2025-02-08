using System;
using System.IO;
using System.Web;
using System.Web.UI;

namespace projectc_.Amal
{
    public partial class seeroom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRoomData();
            }
        }

        private void BindRoomData()
        {
            string roomFile = Server.MapPath("addroomfile.txt");
            string[] roomData = File.Exists(roomFile) ? File.ReadAllLines(roomFile) : new string[0];

            string reservationFile = Server.MapPath("reserveroom.txt");
            string[] reservationData = File.Exists(reservationFile) ? File.ReadAllLines(reservationFile) : new string[0];

            string tableContent = "";

            foreach (var line in roomData)
            {
                string[] roomLine = line.Split(',');
                string roomID = roomLine[0];
                string statusClass = "status-free";
                string statusText = "Free to Book";

                foreach (var resLine in reservationData)
                {
                    string[] resData = resLine.Split(',');
                    if (resData[0] == roomID && resData.Length > 4 && resData[4] == "Approved")
                    {
                        statusClass = "status-booked";
                        statusText = "Booked";
                        break;
                    }
                }

                tableContent += $"<tr>" +
                                $"<td>{roomLine[0]}</td>" +
                                $"<td>{roomLine[1]}</td>" +
                                $"<td>{roomLine[2]}</td>" +
                                $"<td>{roomLine[3]}</td>" +
                                $"<td><span class='{statusClass}'>{statusText}</span></td>" +
                                $"</tr>";
            }

            table1.InnerHtml = tableContent;
        }

        protected void goreserve_Click(object sender, EventArgs e)
        {
            Response.Redirect("roomreservation.aspx");
        }
    }
}
