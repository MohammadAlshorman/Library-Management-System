<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editProfile.aspx.cs" Inherits="projectc_.Mohammed.editProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Edit Profile</title>

    <!-- ✅ Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- ✅ Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        body, html {
            min-height: 100vh;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(to right, #2C3E50, #4CA1AF);
            font-family: 'Poppins', sans-serif;
            color: white;
        }

        .profile-container {
            background: rgba(255, 255, 255, 0.15);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 550px;
            backdrop-filter: blur(8px);
            text-align: center;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.3);
            border: none;
            color: white;
            font-size: 18px;
            height: 50px;
            text-align: center;
            border-radius: 10px;
        }

        .btn-custom {
            background: #f39c12;
            border: none;
            font-weight: bold;
            font-size: 20px;
            transition: 0.3s;
            width: 100%;
            height: 50px;
            color: white;
        }

        .btn-custom:hover {
            background: #e67e22;
        }

        /* ✅ Popup */
        #successPopup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            color: black;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
            z-index: 9999;
            width: 500px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="profile-container">
            <h2>📚 Edit Your Profile 📖</h2>

            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="mb-4">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="👤 Full Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                            ErrorMessage="⚠ Full Name is required!" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="mb-4">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>

                    <div class="d-flex justify-content-center">
                        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-custom" OnClick="btnSave_Click" />
                    </div>

                    <asp:Label ID="lblmsg" runat="server" CssClass="message mt-3"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>

    <!-- ✅ Success Popup -->
    <div id="successPopup">
        <h3>✅ Profile Updated Successfully!</h3>
        <p>Redirecting to your dashboard...</p>
    </div>

</body>
</html>
