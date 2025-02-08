using System;
using System.Web;
using System.Web.UI;
using projectc_.khalid;

namespace projectc_.Mohammed
{
    public partial class userdashboard : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    // ✅ التأكد مما إذا كان المستخدم مسجلاً الدخول
        //    if (Session["UserEmail"] != null)
        //    {
        //        lblUserName.Text = Session["UserEmail"].ToString();
        //    }
        //    else
        //    {
        //        // ❌ إعادة التوجيه إلى صفحة تسجيل الدخول إذا لم يكن هناك جلسة نشطة
        //        Response.Redirect("login.aspx");
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null) // ✅ التحقق من وجود اسم المستخدم في الجلسة
            {
                lblUserName.Text = Session["UserName"].ToString(); // ✅ عرض الاسم بدل الإيميل
            }
            else
            {
                Response.Redirect("login.aspx"); // ❌ إعادة التوجيه في حال عدم تسجيل الدخول
            }
        }


        protected void btnShowBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/khalid/AllBooks.aspx"); // ✅ صفحة عرض جميع الكتب
        }

        protected void btnShowRooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Amal/userdash.aspx"); // ✅ صفحة عرض جميع الغرف
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("editProfile.aspx"); // ✅ الانتقال إلى تعديل الملف الشخصي
        }

        protected void btnHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("history.aspx"); // ✅ صفحة عرض تاريخ المستخدم
        }

        protected void btnFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("feedback.aspx"); // ✅ صفحة إرسال الملاحظات
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // ✅ حذف الجلسة وإعادة التوجيه إلى تسجيل الدخول
            Session.Clear();
            Session.Abandon();
            Response.Redirect("login.aspx");
        }

        protected void btnForgetPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("resetpassword.aspx"); // ✅ الانتقال إلى صفحة استعادة كلمة المرور
        }

    }
}
