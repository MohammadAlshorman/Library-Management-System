using System;
using System.IO;
using System.Web;
using System.Web.UI;

namespace projectc_.Mohammed
{
    public partial class feedback : System.Web.UI.Page
    {
        string feedbackFilePath = HttpContext.Current.Server.MapPath("~/App_Data/FeedbackData.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            // ✅ **التأكد من أن المستخدم مسجل الدخول**
            if (Session["UserEmail"] == null)
            {
                // ❌ إذا لم يكن المستخدم مسجلًا، يتم إعادة توجيهه إلى صفحة تسجيل الدخول
                Response.Redirect("login.aspx");
            }
        }

        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            string feedbackType = ddlFeedbackType.SelectedValue;
            string feedbackText = txtFeedback.Text.Trim();
            string userEmail = Session["UserEmail"].ToString(); // ✅ المستخدم يجب أن يكون مسجل دخول

            // ✅ **التحقق من أن جميع الحقول ممتلئة**
            if (string.IsNullOrEmpty(feedbackType) || string.IsNullOrEmpty(feedbackText))
            {
                lblMessage.Text = "⚠ Please fill all fields before submitting!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                // ✅ **حفظ الملاحظات في `Feedback.txt`**
                using (StreamWriter sw = new StreamWriter(feedbackFilePath, true))
                {
                    sw.WriteLine($"{DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt", new System.Globalization.CultureInfo("ar-JO"))}|{userEmail}|{feedbackType}|{feedbackText}{Environment.NewLine}");
                }

                // ✅ **إظهار `Popup` ثم إعادة التوجيه بعد 2 ثانية**
                string script = @"
                    document.getElementById('successPopup').style.display = 'block';
                    setTimeout(function() {
                        window.location.href = 'userDashboard.aspx';
                    }, 2000);";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, true);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "❌ Error saving feedback: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
