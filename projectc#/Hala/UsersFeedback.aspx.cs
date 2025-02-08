using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Hala
{
    public partial class UsersFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Ensures it only runs on the first page load
            {
                // Load suggestions by default
                lnkSuggestion_Click(sender, e);
             
            }
        }

        protected void lnkSuggestion_Click(object sender, EventArgs e)
        {
            LoadFeedback("Suggestion", "💡 Suggestion Feedback");
            UpdateButtonState(lnkSuggestion, lnkComplaint, lnkInquiry);
        }

        protected void lnkComplaint_Click(object sender, EventArgs e)
        {
            LoadFeedback("Complaint", "⚙️ Complaint Feedback");
            UpdateButtonState(lnkComplaint, lnkSuggestion, lnkInquiry);
        }

        protected void lnkInquiry_Click(object sender, EventArgs e)
        {
            LoadFeedback("Inquiry", "💭 Inquiry Feedback");
            UpdateButtonState(lnkInquiry, lnkSuggestion, lnkComplaint);
        }

        private void LoadFeedback(string feedbackType, string headerText)
        {
            var filepath = Server.MapPath("~/App_Data/FeedbackData.txt"); // Ensure the file exists
            if (!File.Exists(filepath))
            {
                feed.InnerHtml = "<p>No feedback available.</p>";
                return;
            }

            string[] feedbacks = File.ReadAllLines(filepath);
            feed.InnerHtml = ""; // Clear previous content to prevent duplication
            feedbackHeader.InnerHtml = headerText;

            foreach (string feedback in feedbacks)
            {
                string[] Feed = feedback.Split('|');
                if (Feed.Length >= 4 && Feed[2] == feedbackType)
                {
                    feed.InnerHtml += $"<div class='feedback-card'><div class='feedback-user'>{Feed[1]}</div><div class='feedback-date'>{Feed[0]}</div><div class='feedback-message'>{Feed[3]}</div></div>";
                }
            }
        }

        private void UpdateButtonState(LinkButton activeButton, params LinkButton[] otherButtons)
        {
            // Disable the active button
            activeButton.Enabled = false;
            activeButton.CssClass = "nav-link disabled";

            // Enable other buttons
            foreach (var button in otherButtons)
            {
                button.Enabled = true;
                button.CssClass = "nav-link";
            }
        }

        protected void BackToDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}