using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Xml.Linq;

namespace projectc_.Mohammed
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        //protected void reg_Click(object sender, EventArgs e)
        //{
        //    string username = name.Text.Trim();
        //    string useremail = email.Text.Trim();
        //    string userpassword = password.Text.Trim();
        //    string confirmpass = ConfirmPassword.Text.Trim();
        //    string folderPath = Server.MapPath("~/App_Data/");
        //    string filePath = folderPath + "UserData.txt";

        //    // ✅ تأكد أن مجلد `App_Data` موجود
        //    if (!Directory.Exists(folderPath))
        //    {
        //        Directory.CreateDirectory(folderPath);
        //    }

        //    // ✅ التحقق من الحقول المطلوبة
        //    if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(useremail) ||
        //        string.IsNullOrEmpty(userpassword) || string.IsNullOrEmpty(confirmpass))
        //    {
        //        lblmsg.Text = "⚠ All fields are required!";
        //        lblmsg.ForeColor = System.Drawing.Color.White;
        //        lblmsg.Visible = true;
        //        return;
        //    }

        //    // ✅ التحقق من صحة البريد الإلكتروني
        //    if (!Regex.IsMatch(useremail, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
        //    {
        //        lblmsg.Text = "⚠ Please enter a valid email!";
        //        lblmsg.ForeColor = System.Drawing.Color.White;
        //        lblmsg.Visible = true;
        //        return;
        //    }

        //    // ✅ تأكيد تطابق كلمة المرور
        //    if (userpassword != confirmpass)
        //    {
        //        lblmsg.Text = "⚠ Passwords do not match!";
        //        lblmsg.ForeColor = System.Drawing.Color.White;
        //        lblmsg.Visible = true;
        //        return;
        //    }

        //    // ✅ كتابة بيانات المستخدم في `UserData.txt`
        //    try
        //    {
        //        using (StreamWriter sw = new StreamWriter(filePath, true))
        //        {
        //            sw.WriteLine($"{username}|{useremail}|{userpassword}");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lblmsg.Text = "⚠ Error saving data: " + ex.Message;
        //        lblmsg.ForeColor = System.Drawing.Color.White;
        //        lblmsg.Visible = true;
        //        return;
        //    }

        //    // ✅ إظهار `Popup` ثم الانتظار لمدة 2 ثانية قبل إعادة التوجيه
        //    string script = @"
        //        setTimeout(function() {
        //            window.location.href = 'login.aspx';
        //        }, 2000);
        //        document.getElementById('successPopup').style.display = 'block';";

        //    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, true);
        //}



        protected void LOGIN_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click1(object sender, EventArgs e)
        {

        }

        protected void reg_Click(object sender, EventArgs e)
        {
            string username = name.Text.Trim();
            string useremail = email.Text.Trim();
            string userpassword = password.Text.Trim();
            string confirmpass = ConfirmPassword.Text.Trim();
            string folderPath = Server.MapPath("~/App_Data/");
            string filePath = folderPath + "UserData.txt";

            // ✅ تأكد أن مجلد `App_Data` موجود
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            // ✅ التحقق من الحقول المطلوبة
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(useremail) ||
                string.IsNullOrEmpty(userpassword) || string.IsNullOrEmpty(confirmpass))
            {
                lblmsg.Text = "⚠ All fields are required!";
                lblmsg.ForeColor = System.Drawing.Color.White;
                lblmsg.Visible = true;
                return;
            }

            // ✅ التحقق من صحة البريد الإلكتروني
            if (!Regex.IsMatch(useremail, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblmsg.Text = "⚠ Please enter a valid email!";
                lblmsg.ForeColor = System.Drawing.Color.White;
                lblmsg.Visible = true;
                return;
            }

            // ✅ تأكيد تطابق كلمة المرور
            if (userpassword != confirmpass)
            {
                lblmsg.Text = "⚠ Passwords do not match!";
                lblmsg.ForeColor = System.Drawing.Color.White;
                lblmsg.Visible = true;
                return;
            }

            // ✅ كتابة بيانات المستخدم في `UserData.txt`
            try
            {
                using (StreamWriter sw = new StreamWriter(filePath, true))
                {
                    sw.WriteLine($"{username}|{useremail}|{userpassword}");
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = "⚠ Error saving data: " + ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.White;
                lblmsg.Visible = true;
                return;
            }

            // ✅ إظهار `Popup` ثم الانتظار لمدة 2 ثانية قبل إعادة التوجيه
            string script = @"
                setTimeout(function() {
                    window.location.href = 'login.aspx';
                }, 2000);
                document.getElementById('successPopup').style.display = 'block';";

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, true);
        }
    }
}
