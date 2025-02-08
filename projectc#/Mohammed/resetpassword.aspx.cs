using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace projectc_.Mohammed
{
    public partial class resetpassword : System.Web.UI.Page
    {
        string filePath = HttpContext.Current.Server.MapPath("~/App_Data/UserData.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            // ✅ تأكد أن المستخدم مسجل الدخول
            if (Session["UserEmail"] != null)
            {
                txtEmail.Text = Session["UserEmail"].ToString(); // ✅ عرض البريد الإلكتروني للمستخدم
            }
            else
            {
                Response.Redirect("login.aspx"); // ❌ إعادة التوجيه إلى صفحة تسجيل الدخول إذا لم يكن هناك جلسة
            }
        }

        protected void btnSavePassword_Click(object sender, EventArgs e)
        {
            string userEmail = txtEmail.Text.Trim();
            string oldPassword = txtOldPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(oldPassword) || string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.Text = "⚠ All fields are required!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "❌ Passwords do not match!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                for (int i = 0; i < lines.Length; i++)
                {
                    string[] userData = lines[i].Split('|');
                    if (userData.Length >= 3 && userData[1] == userEmail)
                    {
                        if (userData[2] != oldPassword) // ❌ تحقق من صحة كلمة المرور القديمة
                        {
                            lblMessage.Text = "❌ Incorrect old password!";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            return;
                        }

                        // ✅ تحديث كلمة المرور في الملف
                        userData[2] = newPassword;
                        lines[i] = string.Join("|", userData);
                        File.WriteAllLines(filePath, lines);

                        // ✅ **إظهار `Popup` ثم إعادة التوجيه**
                        string script = @"
                            document.getElementById('successPopup').style.display = 'block';
                            setTimeout(function() {
                                window.location.href = 'login.aspx';
                            }, 2000);";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, true);

                        return;
                    }
                }
            }

            lblMessage.Text = "❌ Error updating password!";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
