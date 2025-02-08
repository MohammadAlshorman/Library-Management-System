using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace projectc_.Mohammed
{
    public partial class editProfile : System.Web.UI.Page
    {
        string filePath = HttpContext.Current.Server.MapPath("~/App_Data/UserData.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            if (Session["UserEmail"] != null)
            {
                string userEmail = Session["UserEmail"].ToString();

                if (File.Exists(filePath))
                {
                    string[] lines = File.ReadAllLines(filePath);
                    foreach (string line in lines)
                    {
                        string[] userData = line.Split('|');
                        if (userData.Length >= 3 && userData[1] == userEmail)
                        {
                            txtName.Text = userData[0];
                            txtEmail.Text = userData[1];
                            return;
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string newName = txtName.Text.Trim();
            string newEmail = txtEmail.Text.Trim();

            if (Session["UserEmail"] == null)
            {
                lblmsg.Text = "⚠ Session expired! Please log in again.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string oldEmail = Session["UserEmail"].ToString();

            // ✅ **التحقق من ملء جميع الحقول المطلوبة**
            if (string.IsNullOrEmpty(newName) || string.IsNullOrEmpty(newEmail))
            {
                lblmsg.Text = "⚠ Full Name and Email are required!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // ✅ **تحديث بيانات المستخدم في الملف**
            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                for (int i = 0; i < lines.Length; i++)
                {
                    string[] userData = lines[i].Split('|');
                    if (userData.Length >= 3 && userData[1] == oldEmail)
                    {
                        userData[0] = newName;
                        userData[1] = newEmail;

                        lines[i] = string.Join("|", userData);
                        File.WriteAllLines(filePath, lines);

                        // ✅ **تحديث البريد الإلكتروني في الجلسة بعد التعديل**
                        Session["UserEmail"] = newEmail;
                        Session["UserName"] = newName;

                        // ✅ **إظهار `popup` ثم التوجيه إلى `userdashboard.aspx`**
                        string script = @"
                            document.getElementById('successPopup').style.display = 'block';
                            setTimeout(function() {
                                window.location.href = 'userdashboard.aspx';
                            }, 2000);";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, true);

                        return;
                    }
                }
            }

            lblmsg.Text = "⚠ User not found!";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}
