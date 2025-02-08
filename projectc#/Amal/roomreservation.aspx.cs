using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class roomreservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sendreserve_Click(object sender, EventArgs e)
        {
            // التحقق من أن جميع الحقول ممتلئة
            if (string.IsNullOrWhiteSpace(idroom.Text) ||
                string.IsNullOrWhiteSpace(nameroom.Text) ||
                string.IsNullOrWhiteSpace(dateroom.Text) ||
                string.IsNullOrWhiteSpace(timeroom.Text))
            {
                Response.Write("<script>alert('⚠️ All fields are required! Please fill in all details.');</script>");
                return;
            }

            string file1 = Server.MapPath("reserveroom.txt");

            string reservationData = $"{idroom.Text},{nameroom.Text},{dateroom.Text},{timeroom.Text},Pending";

            if (!File.Exists(file1))
            {
                using (StreamWriter rw = File.CreateText(file1))
                {
                    rw.WriteLine(reservationData);
                }
            }
            else
            {
                using (StreamWriter sr1 = new StreamWriter(file1, true))
                {
                    sr1.WriteLine(reservationData);
                }
            }

            // رسالة نجاح وتحويل المستخدم إلى صفحة الداشبورد
            Response.Write("<script>alert('✅ Reservation request sent successfully!');</script>");
            Response.Redirect("userdash.aspx");
        }
    }
}
