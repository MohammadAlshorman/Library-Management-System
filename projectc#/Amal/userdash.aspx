<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userdash.aspx.cs" Inherits="projectc_.Amal.userdash" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        /* General Styling */
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            font-family: 'Poppins', sans-serif;
            color: #fff;
            text-align: center;
            padding-top: 40px;
        }

        /* Card Container */
        #card {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 20px;
            padding: 20px;
        }

        /* Card Styling */
        .card {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease-in-out;
            overflow: hidden;
            width: 350px;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(255, 255, 255, 0.3);
        }

        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 15px 15px 0 0;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #FFD700;
        }

        .card-text {
            font-size: 14px;
            color: #ddd;
            margin-bottom: 15px;
        }

        /* Buttons */
        .btn-primary {
            background: #ff9800;
            border: none;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 25px;
            width: 100%;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background: #e68900;
        }

        @media (max-width: 768px) {
            .card {
                width: 90%;
            }
        }

    </style>
    <title>User Dashboard</title>
</head>
<body>
    <form id="form2" runat="server">
        <h2 class="mb-4">Welcome to Your Dashboard 🎉</h2>
        <div id="card">
            <!-- See A Room -->
            <div class="card">
                <img class="card-img-top" src="u1.jpg" alt="Room Image">
                <div class="card-body">
                    <h5 class="card-title">See A Room Meeting</h5>
                    <p class="card-text">Check the available rooms for your meetings.</p>
                    <asp:Button class="btn btn-primary" Text="See Room" runat="server" OnClick="Unnamed_Click"/>
                </div>
            </div>

            <!-- Reserve A Room -->
            <div class="card">
                <img class="card-img-top" src="u2.jpg" alt="Reserve Room">
                <div class="card-body">
                    <h5 class="card-title">Reserve A Room Meeting</h5>
                    <p class="card-text">Reserve a meeting room easily with just one click.</p>
                    <asp:Button class="btn btn-primary" Text="Reserve Room" runat="server" OnClick="Unnamed_Click1"/>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
