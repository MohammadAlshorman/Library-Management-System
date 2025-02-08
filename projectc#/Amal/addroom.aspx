<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addroom.aspx.cs" Inherits="projectc_.Amal.addroom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Room</title>

    <!-- Bootstrap & jQuery -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN6nIeHz" crossorigin="anonymous"></script>

    <style>
        .container {
            max-width: 600px;
            margin-top: 40px;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-size: 1.2rem;
        }

        .form-control {
            font-size: 1rem;
            padding: 10px;
            border-radius: 5px;
        }

        .btn {
            width: 100%;
            font-size: 1.1rem;
            padding: 12px;
            border-radius: 5px;
            margin-top: 10px;
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
            <h2>Add New Room</h2>

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" 
                HeaderText="Please fix the following errors:" />

            <!-- Room ID Input -->
            <div class="mb-3">
                <label for="roomid" class="form-label">Room ID</label>
                <asp:TextBox ID="roomid" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqRoomID" runat="server" ControlToValidate="roomid"
                    ErrorMessage="Room ID is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Room Name Input -->
            <div class="mb-3">
                <label for="roomname" class="form-label">Room Name</label>
                <asp:TextBox ID="roomname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqRoomName" runat="server" ControlToValidate="roomname"
                    ErrorMessage="Room Name is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Room Capacity Input -->
            <div class="mb-3">
                <label for="roomcapacity" class="form-label">Room Capacity</label>
                <asp:TextBox ID="roomcapacity" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqRoomCapacity" runat="server" ControlToValidate="roomcapacity"
                    ErrorMessage="Room Capacity is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Room Location Input -->
            <div class="mb-3">
                <label for="roomlocation" class="form-label">Room Location</label>
                <asp:TextBox ID="roomlocation" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqRoomLocation" runat="server" ControlToValidate="roomlocation"
                    ErrorMessage="Room Location is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Buttons -->
            <asp:Button ID="butadd" runat="server" OnClick="butadd_Click" Text="Add Room" CssClass="btn btn-primary" />
<%--            <asp:Button ID="back2" runat="server" OnClick="back2_Click" Text="Go Back" CssClass="btn btn-danger" />--%>
            <asp:Button ID="btnGoHome" runat="server" OnClick="btnGoHome_Click" Text="Go to Home" CssClass="btn btn-danger" CausesValidation="false" />

        </div>
    </form>
</body>
</html>
