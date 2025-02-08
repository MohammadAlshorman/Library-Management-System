<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetpassword.aspx.cs" Inherits="projectc_.Mohammed.resetpassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Reset Password</title>

    <!-- ✅ Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
            background: linear-gradient(to right, #2C3E50, #4CA1AF);
            font-family: 'Poppins', sans-serif;
            color: white;
        }

        .reset-container {
            background: rgba(255, 255, 255, 0.15);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 500px;
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
            background: linear-gradient(135deg, #f39c12, #e67e22);
            border: none;
            font-weight: bold;
            font-size: 20px;
            transition: 0.3s;
            width: 100%;
            height: 50px;
            color: white;
            border-radius: 10px;
        }

        .btn-custom:hover {
            background: linear-gradient(135deg, #e67e22, #f39c12);
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
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            z-index: 9999;
            width: 400px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="reset-container">
            <h2>🔑 Reset Your Password</h2>
            <p>Reset your password for the registered email.</p>

            <asp:ScriptManager runat="server"></asp:ScriptManager>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <!-- ✅ Email Display (Read-Only) -->
                    <div class="mb-4">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>

                    <!-- ✅ Old Password Input -->
                    <div class="mb-4">
                        <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="🔑 Old Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOldPassword" runat="server" ControlToValidate="txtOldPassword"
                            ErrorMessage="⚠ Old Password is required!" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <!-- ✅ New Password Fields -->
                    <div class="mb-4">
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="🔑 New Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword"
                            ErrorMessage="⚠ New Password is required!" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="mb-4">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="🔒 Confirm Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
                            ErrorMessage="⚠ Please confirm your password!" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <!-- ✅ Save Password Button -->
                    <div class="d-flex justify-content-center">
                        <asp:Button ID="btnSavePassword" runat="server" Text="Save Password" CssClass="btn btn-custom" OnClick="btnSavePassword_Click" />
                    </div>

                    <asp:Label ID="lblMessage" runat="server" CssClass="message mt-3"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </form>

    <!-- ✅ Success Popup -->
    <div id="successPopup">
        <h3>✅ Password Updated Successfully!</h3>
        <p>Redirecting to login...</p>
    </div>

</body>
</html>
