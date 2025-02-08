<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancelreservetion.aspx.cs" Inherits="projectc_.Amal.cancelreservetion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cancel Reservation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <style>
        /* General Body Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        /* Center the form container */
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }

        /* Form Field Styles */
        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            padding: 12px;
            font-size: 1rem;
            border-radius: 8px;
            border: 1px solid #ccc;
            width: 100%;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .btn-custom {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            color: white;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

        /* Message Labels */
        .message {
            text-align: center;
            margin-top: 20px;
        }

        .message-success {
            color: green;
            font-size: 1.2rem;
        }

        .message-error {
            color: red;
            font-size: 1.2rem;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 30px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Cancel Reservation</h2>

            <!-- Room ID Input Field -->
            <div class="form-group">
                <asp:Label ID="lblRoomId" runat="server" Text="Room ID:" AssociatedControlID="txtRoomId" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtRoomId" runat="server" class="form-control" required="true"></asp:TextBox>
            </div>

            <!-- Cancel Button -->
            <div class="form-group">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Reservation" OnClick="btnCancel_Click" CssClass="btn-custom" />
            </div>

            <!-- Message Label -->
            <div class="message">
                <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="message-success"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

