<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="projectc_.Mohammed.RoomDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Room Details</title>

    <!-- ✅ Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
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

        .details-container {
            background: rgba(255, 255, 255, 0.15);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.6);
            width: 100%;
            max-width: 600px;
            backdrop-filter: blur(12px);
            text-align: center;
        }

        .details-container h2 {
            font-family: 'Georgia', serif;
            color: #FFD700;
            margin-bottom: 20px;
        }

        .btn-back {
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

        .btn-back:hover {
            background: #e67e22;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="details-container">
            <h2>🏨 Room Details</h2>
            <h4>Room <asp:Label ID="lblRoomNumber" runat="server"></asp:Label></h4>

            <p><strong>Reservation Date:</strong> <asp:Label ID="lblReservationDate" runat="server"></asp:Label></p>
            <p><strong>Room Type:</strong> <asp:Label ID="lblRoomType" runat="server"></asp:Label></p>

            <asp:Button ID="btnBack" runat="server" Text="⬅ Back to History" CssClass="btn btn-back" OnClick="btnBack_Click" />
        </div>
    </form>

</body>
</html>
