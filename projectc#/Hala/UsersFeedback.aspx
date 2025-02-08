<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersFeedback.aspx.cs" Inherits="projectc_.Hala.UsersFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <!-- Plugin css for this page -->
    <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css" />
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.png" />
    <%--    for feedback bootstrap--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    
    <title></title>
    <style>

        .back {
            width: 14vw;
            align-self: center;
            
        }
        [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
            cursor: pointer;
            background: #00000091 !important;
            border: white !important;
        }
        .nav-tabs .nav-link {
            border-top-right-radius: var(--bs-nav-tabs-border-radius);
            background: #333 !important;
            color: white !important;
        }
        .card-body {
            background: #fff8ec !important;
        }
        .feedback-card {
            background: #f39c129c !important;
            color: white !important;
        }

        .feedback-message {
            color: #fff !important;
        }


        .feedback-date {
/*           color: #fff !important;*/
        }

        .feedback-user {
       
/*            color: #fff !important;*/
        }

        .feedback-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .feedback-card {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #e9ecef;
            border-radius: 10px;
            background: #f8f9fa;
            transition: transform 0.2s ease-in-out;
        }

            .feedback-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

        .feedback-user {
            font-weight: bold;
            color: #333;
        }

        .feedback-date {
            font-size: 0.9em;
            color: #6c757d;
        }

        .feedback-message {
            margin-top: 10px;
            color: #495057;
        }

        .no-feedback {
            text-align: center;
            color: #6c757d;
            font-style: italic;
        }

        .nav-link.disabled {
            pointer-events: none; /* Prevents clicking */
            opacity: 0.6; /* Makes it look disabled */
            color: gray; /* Change text color */
        }



        .stat-card {
            transition: transform 0.3s ease-in-out;
        }

            .stat-card:hover {
                transform: translateY(-5px);
            }

            .stat-card i {
                transition: transform 0.3s ease-in-out;
            }

            .stat-card:hover i {
                transform: scale(1.1);
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">


        <%--feesback from users--%>
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                    <li class="nav-item">
                        <asp:LinkButton ID="lnkSuggestion" runat="server" CssClass="nav-link active" OnClick="lnkSuggestion_Click">Suggestion</asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="lnkComplaint" runat="server" CssClass="nav-link " OnClick="lnkComplaint_Click">Complaint</asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="lnkInquiry" runat="server" CssClass="nav-link " OnClick="lnkInquiry_Click">Inquiry</asp:LinkButton>
                    </li>
                </ul>
            </div>

            <div class="card-body">
                <div class="feedback-container">
                    <h2 id="feedbackHeader" runat="server" class="text-center mb-4"></h2>

                    <!-- Feedback List -->
                    <div id="Div1" runat="server" class="text-center mb-4"></div>
                    <div id="feed" runat="server"></div>
                </div>

                            <asp:Button  ID="BackToDashboard" runat="server" CssClass="margin btn btn-gradient-primary font-weight-bold feedback-button back" Text="Back to Dashboard" OnClick="BackToDashboard_Click" />

            </div>

        </div>


    </form>
    <script>
        // Example: Fetch feedback data from an API or server
        const feedbackList = document.getElementById('feedback-list');

        // Simulated feedback data (replace with real data from your backend)
        const feedbackData = [
            {
                user: "Alice Johnson",
                date: "October 8, 2023",
                message: "Very satisfied with the service. Keep up the good work!"
            },
            {
                user: "Bob Brown",
                date: "October 7, 2023",
                message: "The platform is easy to use, but I encountered a minor bug."
            }
        ];

        // Function to render feedback
        function renderFeedback(feedback) {
            if (feedback.length === 0) {
                feedbackList.innerHTML = '<div class="no-feedback">No feedback available at the moment.</div>';
                return;
            }

            feedbackList.innerHTML = feedback.map(item => `
             <div class="feedback-card">
                 <div class="feedback-user">${item.user}</div>
                 <div class="feedback-date">${item.date}</div>
                 <div class="feedback-message">${item.message}</div>
             </div>
         `).join('');
        }

        // Render feedback on page load
        renderFeedback(feedbackData);
    </script>
</body>

</html>
