using System;
using System.IO;
using System.Web;
using System.Web.UI;

namespace projectc_.Mohammed
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userEmail = email.Text.Trim();
            string userPassword = password.Text.Trim();
            string filePath = Server.MapPath("~/App_Data/UserData.txt");

            if (string.IsNullOrEmpty(userEmail) || string.IsNullOrEmpty(userPassword))
            {
                lblmsg.Text = "⚠ All fields are required!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // ✅ شرط تسجيل دخول الأدمن
            if (userEmail == "admin@admin.com" && userPassword == "admin")
            {
                Session["UserEmail"] = userEmail;
                Session["UserName"] = "Admin"; // ✅ يمكن تخصيص اسم الأدمن
                Response.Redirect("~/hala2/WebForm1.aspx");
                return;
            }

            if (!File.Exists(filePath))
            {
                lblmsg.Text = "⚠ No users registered yet!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            bool userExists = false;
            string userName = "";

            foreach (string line in File.ReadLines(filePath))
            {
                string[] userData = line.Split('|');
                if (userData.Length >= 3 && userData[1] == userEmail && userData[2] == userPassword)
                {
                    userExists = true;
                    userName = userData[0]; // ✅ جلب اسم المستخدم من الملف
                    break;
                }
            }

            if (userExists)
            {
                Session["UserEmail"] = userEmail;
                Session["UserName"] = userName;



                string loggedFilePath = Server.MapPath("~/App_Data/logged.txt");

                try
                {
                    File.AppendAllText(loggedFilePath, userEmail + Environment.NewLine);
                }
                catch (Exception ex)
                {
                    lblmsg.Text = "⚠ Error logging user: " + ex.Message;
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }




                string script = @"
                    document.getElementById('successPopup').style.display = 'block';
                    setTimeout(function() {
                        window.location.href = 'userdashboard.aspx';
                    }, 2000);";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, true);
            }
            else
            {
                lblmsg.Text = "❌ Invalid credentials!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}
