<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="projectc_.Mohammed.history" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>History - Borrowed Books & Reserved Rooms</title>

    <!-- ✅ Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        body, html {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #2C3E50, #4CA1AF);
            font-family: 'Poppins', sans-serif;
            color: white;
        }

        .history-container {
            background: rgba(255, 255, 255, 0.15);
            padding: 40px;
            border-radius: 20px;
            width: 100%;
            max-width: 900px;
            backdrop-filter: blur(12px);
            text-align: center;
        }

        .history-container h2 {
            color: #FFD700;
            margin-bottom: 20px;
        }

        .table {
            color: white;
            margin-top: 20px;
        }

        .btn-back {
            background: #f39c12;
            border: none;
            font-weight: bold;
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
        <div class="history-container">
            <h2>📜 User History - Borrowed Books & Reserved Rooms 📖</h2>
            <h4>Welcome, <asp:Label ID="lblUserName" runat="server"></asp:Label>! 🎉</h4>

            <p class="mb-4">Your borrowed books and reserved rooms history is shown below.</p>

            <!-- ✅ Borrowed Books Table -->
            <div class="table-responsive">
                <h4>📚 Borrowed Books</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Category</th>
                            <th>Borrow Date</th>
                            <th>Return Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptBooks" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("BookID") %></td>
                                    <td><%# Eval("BookTitle") %></td>
                                    <td><%# Eval("Author") %></td>
                                    <td><%# Eval("Category") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <!-- ✅ Reserved Rooms Table -->
            <div class="table-responsive">
                <h4>🏠 Reserved Rooms</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Room ID</th>
                            <th>Room Name</th>
                            <th>Time</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptRooms" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("RoomID") %></td>
                                    <td><%# Eval("RoomName") %></td>
                                    <td><%# Eval("Time") %></td>
                                    <td><%# Eval("Date") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <br />

            <!-- ✅ Back Button -->
            <asp:Button ID="btnBack" runat="server" Text="⬅ Back to Dashboard" CssClass="btn btn-back" OnClick="btnBack_Click" />

        </div>
    </form>

</body>
</html>
