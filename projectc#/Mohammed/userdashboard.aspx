<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userdashboard.aspx.cs" Inherits="projectc_.Mohammed.userdashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>User Dashboard</title>

    <!-- ✅ Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        /* ✅ Full-Page Background */
        body, html {
            height: 100vh;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #2C3E50, #4CA1AF);
            font-family: 'Poppins', sans-serif;
            color: white;
        }

        /* ✅ Dashboard Container */
        .dashboard-container {
            background: rgba(255, 255, 255, 0.15);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.6);
            width: 100%;
            max-width: 1000px;
            backdrop-filter: blur(12px);
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        .dashboard-container h2 {
            font-family: 'Georgia', serif;
            color: #FFD700; /* ✅ Gold for premium feel */
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(255, 255, 255, 0.3);
        }

        /* ✅ Card Styling */
        .card {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 15px;
            padding: 20px;
            transition: all 0.3s ease-in-out;
            color: white;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0px 10px 25px rgba(255, 255, 255, 0.3);
        }

        .card-title {
            font-size: 20px;
            font-weight: bold;
        }

        .icon {
            font-size: 40px;
            margin-bottom: 10px;
        }

        /* ✅ Buttons */
        .btn-custom {
            background: #f39c12;
            border: none;
            font-weight: bold;
            font-size: 18px;
            transition: 0.3s;
            width: 100%;
            height: 50px;
            color: white;
            border-radius: 25px;
        }

        .btn-custom:hover {
            background: #e67e22;
        }

        .logout-btn {
            background: #e74c3c;
        }

        .logout-btn:hover {
            background: #c0392b;
        }

        /* ✅ Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h2>📚 Library Dashboard 📖</h2>
            
           <%-- <h4>Welcome, <asp:Label ID="lblUserName" runat="server"></asp:Label>!</h4>--%>

            <h4>Welcome, <asp:Label ID="lblUserName" runat="server"></asp:Label>! 🎉</h4>

            <p class="mb-4">Manage your profile and explore the library services.</p>

            <div class="row">
                <!-- ✅ Show All Books -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="icon">📚</div>
                        <h5 class="card-title">Show All Books</h5>
                        <asp:Button ID="btnShowBooks" runat="server" Text="View Books" CssClass="btn btn-custom" OnClick="btnShowBooks_Click" />
                    </div>
                </div>

                <!-- ✅ Show All Rooms -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="icon">🏠</div>
                        <h5 class="card-title">Show All Rooms</h5>
                        <asp:Button ID="btnShowRooms" runat="server" Text="View Rooms" CssClass="btn btn-custom" OnClick="btnShowRooms_Click" />
                    </div>
                </div>

                <!-- ✅ Edit Profile -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="icon">✏️</div>
                        <h5 class="card-title">Edit Profile</h5>
                        <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" CssClass="btn btn-custom" OnClick="btnEditProfile_Click" />
                    </div>
                </div>

                <!-- ✅ History -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="icon">📜</div>
                        <h5 class="card-title">History</h5>
                        <asp:Button ID="btnHistory" runat="server" Text="View History" CssClass="btn btn-custom" OnClick="btnHistory_Click" />
                    </div>
                </div>

                <!-- ✅ Feedback -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="icon">📝</div>
                        <h5 class="card-title">Feedback</h5>
                        <asp:Button ID="btnFeedback" runat="server" Text="Submit Feedback" CssClass="btn btn-custom" OnClick="btnFeedback_Click" />
                    </div>
                </div>

                <!-- ✅ Forget Password -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="icon">🔑</div>
                        <h5 class="card-title">Forget Password</h5>
                        <asp:Button ID="btnForgetPassword" runat="server" Text="Reset Password" CssClass="btn btn-custom" OnClick="btnForgetPassword_Click" />
                    </div>
                </div>

                <!-- ✅ Logout -->
                <div class="col-md-12">
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-custom logout-btn" OnClick="btnLogout_Click" />
                </div>
            </div>
        </div>
    </form>

</body>
</html>
