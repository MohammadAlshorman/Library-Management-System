<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editnew.aspx.cs" Inherits="projectc_.editnew" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Room</title>
    
    <!-- تحميل مكتبة jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <script type="text/javascript">
        function confirmDelete() {
            return confirm("Are you sure you want to delete this room?");
        }
    </script>
</head>
<body class="container mt-4">
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Edit Room</h2>

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" HeaderText="Please fix the following errors:" />

            <!-- Select Room -->
            <div class="mb-3">
                <asp:Label ID="lblSelectRoom" runat="server" CssClass="form-label" Text="Select Room"></asp:Label>
                <asp:DropDownList ID="ddlRooms" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlRooms_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="reqRoomSelect" runat="server" ControlToValidate="ddlRooms"
                    InitialValue="" ErrorMessage="Please select a room." CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Room Name -->
            <div class="mb-3">
                <asp:Label ID="lblRoomName" runat="server" CssClass="form-label" Text="Room Name"></asp:Label>
                <asp:TextBox ID="txtRoomName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqRoomName" runat="server" ControlToValidate="txtRoomName"
                    ErrorMessage="Room Name is required." CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Capacity -->
            <div class="mb-3">
                <asp:Label ID="lblCapacity" runat="server" CssClass="form-label" Text="Capacity"></asp:Label>
                <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqCapacity" runat="server" ControlToValidate="txtCapacity"
                    ErrorMessage="Capacity is required." CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexCapacity" runat="server" ControlToValidate="txtCapacity"
                    ValidationExpression="^\d+$" ErrorMessage="Capacity must be a number." CssClass="error-message" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <!-- Description -->
            <div class="mb-3">
                <asp:Label ID="lblDescription" runat="server" CssClass="form-label" Text="Description"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqDescription" runat="server" ControlToValidate="txtDescription"
                    ErrorMessage="Description is required." CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Buttons -->
            <div class="mb-3 text-center">
                <asp:Button ID="btnUpdateRoom" runat="server" Text="Update Room" CssClass="btn btn-primary" OnClick="btnUpdateRoom_Click" />
                <asp:Button ID="btnDeleteRoom" runat="server" Text="Delete Room" CssClass="btn btn-danger ms-2" OnClientClick="return confirmDelete();" OnClick="btnDeleteRoom_Click" />
            </div>

            <!-- Success/Error Message -->
            <div class="mb-3 text-center">
                <asp:Label ID="lblmsg" runat="server" CssClass="fw-bold" ForeColor="Green" Visible="false"></asp:Label>
            </div>

            <!-- Back Button -->
            <div class="text-center">
                <asp:Button ID="back1" runat="server" OnClick="back1_Click" CssClass="btn btn-secondary" Text="Go Back" />
            </div>

        </div>
    </form>
</body>
</html>
