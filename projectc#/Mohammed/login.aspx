<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="projectc_.Mohammed.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Library Login</title>

      <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

  <style>
      /* ✅ Full-Page Background */
      body, html {
          min-height: 100vh;
          margin: 0;
          padding: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          background: url('https://images.unsplash.com/photo-1512820790803-83ca734da794') no-repeat center center fixed;
          background-size: cover;
          background-position: center;
          font-family: 'Merriweather', serif;
          color: white;
          position: relative;
      }

      /* ✅ Overlay */
      .overlay {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background: rgba(0, 0, 0, 0.6);
          z-index: 0;
      }

      /* ✅ Login Form */
      .login-container {
          background: rgba(255, 255, 255, 0.15);
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

      .login-container h2 {
          font-family: 'Georgia', serif;
          color: #f1c40f;
          margin-bottom: 20px;
      }

      .form-control {
          background: rgba(255, 255, 255, 0.2);
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
background-color: white;


      }

      /* ✅ Popup */
      #errorPopup {
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

    <!-- ✅ Overlay -->
    <div class="overlay"></div>

    <form id="form1" runat="server">
        <div class="login-container">
            <h2>📚 Library Login 📖</h2>
            <p class="mb-4">Enter your details to access the library.</p>

            <asp:ScriptManager runat="server"></asp:ScriptManager>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="mb-4">
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="✉ Email Address"></asp:TextBox>
                    </div>

                    <div class="mb-4">
                        <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" placeholder="🔑 Password"></asp:TextBox>
                    </div>

                    <div class="d-flex justify-content-center">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-custom" OnClick="btnLogin_Click" />
                    </div>
                    <br />
                     <%-- <div class="d-flex justify-content-center">
      <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-custom" Onclick="btnRegister_Click" />
  </div>--%>

                    <a  runat="server" posturl="register.aspxB" href="register.aspx">Register</a>

                    <asp:Label ID="lblmsg" runat="server" CssClass="message mt-3"></asp:Label >

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </form>

 
<!-- ✅ Success Popup -->
<div id="successPopup" style="display: none;">
    <h3>✅ Login Successful!</h3>
    <p>Redirecting to your dashboard...</p>
</div>

<!-- ✅ Error Popup -->
<div id="errorPopup" style="display: none;">
    <h3>❌ Login Failed</h3>
    <p>Incorrect email or password. Redirecting to sign up...</p>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
