<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aditroom.aspx.cs" Inherits="projectc_.Amal.aditroom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>Edit Room</title>

    <style>
        /* Container with margin and centered content */
        .container {
            max-width: 600px;
            margin-top: 50px;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Form elements styling */
        .form-label {
            font-size: 1.2rem;
        }

        .form-control {
            font-size: 1rem;
            padding: 10px;
            border-radius: 5px;
        }

        .btn-primary {
            width: 100%;
            font-size: 1.1rem;
            padding: 12px;
            border-radius: 5px;
        }

        .mb-3 {
            margin-bottom: 1.5rem;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Edit Room</h2>

            <!-- Search Section First -->
            <div class="mb-3">
                <label for="search" class="form-label">Search Room ID</label>
                <asp:TextBox class="form-control" Style="width: 100%;" ID="search" runat="server" type="search" placeholder="Search" aria-label="Search"></asp:TextBox>
                <br />
                <asp:Button ID="butsearch" runat="server" OnClick="butsearch_Click" class="btn btn-primary" Text="Search" type="submit"></asp:Button>
                <asp:Label ID="result" Visible="false" runat="server" Text=""></asp:Label>
            </div>

            <!-- Room ID Input -->
            <div class="mb-3">
                <label for="roomid" class="form-label">Room ID</label>
                <asp:TextBox class="form-control" Style="width: 100%;" ID="roomid" runat="server"></asp:TextBox>
            </div>

            <!-- Roomname Input -->
            <div class="mb-3">
                <label for="roomname" class="form-label">Room Name</label>
                <asp:TextBox class="form-control" Style="width: 100%;" type="roomname" ID="roomname" runat="server"></asp:TextBox>
            </div>

            <!-- Room Capacity Input -->
            <div class="mb-3">
                <label for="roomcapacity" class="form-label">Room Capacity</label>
                <asp:TextBox class="form-control" Style="width: 100%;" ID="roomcapacity" runat="server"></asp:TextBox>
            </div>

            <!-- Room Location Input -->
            <div class="mb-3">
                <label for="roomlocation" class="form-label">Room Location</label>
                <asp:TextBox class="form-control" Style="width: 100%;" ID="roomlocation" runat="server"></asp:TextBox>
            </div>



            <!-- Edit Button -->
            <div class="mb-3">
                <asp:Button ID="editbutton" runat="server" OnClick="editbutton_Click" Text="Edit Room" class="btn btn-primary"></asp:Button>
            </div>
        </div>
    </form>
</body>
</html>
