using System;
using System.IO;
using System.Web.UI;

namespace projectc_.Amal
{
    public partial class addroom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // منع أخطاء التحقق
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void butadd_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("addroomfile.txt"); // تحديد مسار الملف

            // التحقق من أن جميع الحقول ممتلئة
            if (string.IsNullOrWhiteSpace(roomid.Text) ||
                string.IsNullOrWhiteSpace(roomname.Text) ||
                string.IsNullOrWhiteSpace(roomcapacity.Text) ||
                string.IsNullOrWhiteSpace(roomlocation.Text))
            {
                return;
            }

            // إنشاء الملف إذا لم يكن موجودًا ثم إضافة بيانات الغرفة
            using (StreamWriter writer = new StreamWriter(filePath, true))
            {
                writer.WriteLine($"{roomid.Text},{roomname.Text},{roomcapacity.Text},{roomlocation.Text},PENDING");
            }

            // إعادة توجيه المستخدم بعد الإضافة
            Response.Redirect("~/hala2/RoomCards.aspx");
        }

        //protected void back2_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~hala2/WebForm1.aspx"); // استبدل باسم الصفحة السابقة
        //}

        protected void btnGoHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hala2/RoomCards.aspx"); // استبدل باسم الصفحة الرئيسية
        }
    }
}
