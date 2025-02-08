<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="projectc_.Mohammed.BookDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Book Details</title>

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
            animation: fadeIn 0.8s ease-in-out;
        }

        .details-container h2 {
            font-family: 'Georgia', serif;
            color: #FFD700;
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(255, 255, 255, 0.3);
        }

        .details-text {
            font-size: 18px;
            margin-bottom: 10px;
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
            <h2>📖 Book Details</h2>
            
            <h4><asp:Label ID="lblBookTitle" runat="server"></asp:Label></h4>

            <p class="details-text"><strong>Borrow Date:</strong> <asp:Label ID="lblBorrowDate" runat="server"></asp:Label></p>
            <p class="details-text"><strong>Author:</strong> <asp:Label ID="lblAuthor" runat="server"></asp:Label></p>
            <p class="details-text"><strong>Genre:</strong> <asp:Label ID="lblGenre" runat="server"></asp:Label></p>

            <asp:Button ID="btnBack" runat="server" Text="⬅ Back to History" CssClass="btn btn-back" OnClick="btnBack_Click" />
        </div>
    </form>

</body>
</html>
