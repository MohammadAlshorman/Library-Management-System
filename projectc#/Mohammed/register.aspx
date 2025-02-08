<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="projectc_.Mohammed.register" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Sign Up</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* ✅ Full-Page Background Fix */
        body, html {
            min-height: 100vh; /* Ensures full coverage */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('https://img.freepik.com/free-photo/wooden-table-with-blurred-background_1134-14.jpg?semt=ais_hybrid') no-repeat center center fixed;
            background-size: cover;
            background-position: center center;
            background-color: #2c3e50; /* Fallback color */
            filter: brightness(1.1); /* ✅ Increase image brightness */
            font-family: 'Merriweather', serif;
            color: white;
            position: relative;
        }

        /* ✅ Lighter Overlay to Keep the Image Visible */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3); /* ✅ Lighter overlay for better clarity */
            z-index: 0;
        }

        /* ✅ Registration Form Styling */
        .register-container {
            background: rgba(255, 255, 255, 0.2); /* ✅ Glassmorphism effect */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 500px;
            backdrop-filter: blur(5px);
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .register-container h2 {
            font-family: 'Georgia', serif;
            color: #f1c40f; /* ✅ Gold Title */
            margin-bottom: 20px;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.3);
            border: none;
            color: white;
            font-size: 18px;
            height: 50px;
            text-align: center;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
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

        .message {
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
                font-size: 23px;
    background-color: red;
     color: white;
 
        }

        /* ✅ Popup Styling */
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
            width:500px;
            height:150px;
      
        }
    </style>

</head>
<body>

    <!-- ✅ Overlay to Improve Visibility -->
    <div class="overlay"></div>

    <form id="form1" runat="server">
        <div class="register-container">
            <h2>📚 Welcome to the Library 📖</h2>
            <p class="mb-4">Sign up to explore a world of knowledge.</p>

            <asp:ScriptManager runat="server"></asp:ScriptManager>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="mb-4">
                        <asp:TextBox ID="name" runat="server" CssClass="form-control" placeholder="👤 Full Name"></asp:TextBox>
                    </div>

                    <div class="mb-4">
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="✉ Email Address"></asp:TextBox>
                    </div>



                    <div class="mb-4">
                        <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" placeholder="🔑 Password"></asp:TextBox>
                    </div>

                    <div class="mb-4">
                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="🔒 Confirm Password"></asp:TextBox>
                    </div>

                    <div class="d-flex justify-content-center">
                        <asp:Button ID="reg" runat="server" Text="Register" CssClass="btn btn-custom" OnClick="reg_Click" /><br /><br /><br/ />
                    </div>

                                  <div class="d-flex justify-content-center">
                                      <asp:Button ID="LOGIN" Text="Login" runat="server" CssClass="btn btn-custom" OnClick="LOGIN_Click"  />
      </div>


                    <asp:Label ID="lblmsg" runat="server" CssClass="message mt-3"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </form>

    <!-- ✅ Popup -->
    <div id="successPopup">
        <h3>✅ Registration Successful!</h3>
        <p>Redirecting to login...</p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>


