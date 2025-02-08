using System;
using System.IO;
using System.Web;
using System.Web.UI;

namespace projectc_.Amal
{
    public partial class showallroom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // ✅ منع تحميل البيانات أكثر من مرة
            {
                LoadRoomData();
            }
        }

        private void LoadRoomData()
        {
            string file = Server.MapPath("addroomfile.txt");
            if (File.Exists(file))
            {
                string[] da = File.ReadAllLines(file);
                tableBody.InnerHtml = ""; // ✅ تنظيف الجدول قبل تحميل البيانات

                foreach (string d in da)
                {
                    string[] dataSplit = d.Split(',');

                    if (dataSplit.Length >= 4) // ✅ التأكد من صحة البيانات
                    {
                        tableBody.InnerHtml += $"<tr><td>{dataSplit[0]}</td><td>{dataSplit[1]}</td><td>{dataSplit[2]}</td><td>{dataSplit[3]}</td></tr>";
                    }
                }
            }
        }

        protected void back2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hala2/RoomCards.aspx");
        }
    }
}
