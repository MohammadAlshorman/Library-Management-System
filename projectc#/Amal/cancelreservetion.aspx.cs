using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class cancelreservetion : System.Web.UI.Page
    {
        // Correctly initialize filePath in an instance method or property
        private string filePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialize filePath using Page.Server in an instance method
            filePath = Page.Server.MapPath("reserveroom.txt");

            // Ensure the file exists
            if (!File.Exists(filePath))
            {
                File.WriteAllText(filePath, "1,anas@gmail.com,2025-02-14,11:34,Approved\n");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string roomId = txtRoomId.Text.Trim();

            if (string.IsNullOrEmpty(roomId))
            {
                lblMessage.Text = "Please enter a Room ID.";
                lblMessage.Visible = true;
                return;
            }

            // Read all lines from the file
            var lines = File.ReadAllLines(filePath).ToList();

            bool reservationFound = false;

            // Loop through each line to find the reservation
            for (int i = 0; i < lines.Count; i++)
            {
                string[] columns = lines[i].Split(',');

                if (columns[0] == roomId && columns[4] == "Approved")
                {
                    // Change "Approved" to "Rejected"
                    columns[4] = "Rejected";
                    lines[i] = string.Join(",", columns);
                    reservationFound = true;
                    break;
                }
            }

            if (reservationFound)
            {
                // Write the updated lines back to the file
                File.WriteAllLines(filePath, lines);
                lblMessage.Text = "Reservation has been canceled successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Reservation not found or already canceled.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

            lblMessage.Visible = true;
        }
    }
}