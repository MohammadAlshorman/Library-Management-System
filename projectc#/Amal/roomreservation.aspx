<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="roomreservation.aspx.cs" Inherits="projectc_.Amal.roomreservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reserve a Room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            font-family: 'Poppins', sans-serif;
            color: white;
            text-align: center;
            padding-top: 40px;
        }

        .card {
            max-width: 600px;
            margin: auto;
            background: rgba(255, 255, 255, 0.15);
            padding: 25px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            color: white;
        }

        h1 {
            color: #FFD700;
            text-shadow: 2px 2px 5px rgba(255, 255, 255, 0.3);
        }

        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.2);
            border-color: #FFD700;
            color: white;
        }

        .error-message {
            color: #ff4d4d;
            font-size: 14px;
            display: none;
            margin-top: 5px;
        }

        .btn-primary {
            background: #ff9800;
            border: none;
            font-size: 16px;
            padding: 12px;
            border-radius: 25px;
            width: 100%;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background: #e68900;
        }
    </style>

    <script>
        function validateForm() {
            var isValid = true;
            var fields = ["idroom", "nameroom", "dateroom", "timeroom"];
            
            fields.forEach(function (field) {
                var input = document.getElementById(field);
                var error = document.getElementById(field + "-error");

                if (input.value.trim() === "") {
                    error.style.display = "block";
                    isValid = false;
                } else {
                    error.style.display = "none";
                }
            });

            return isValid;
        }
    </script>
</head>
<body>
    <form id="form2" runat="server" onsubmit="return validateForm();">
        <div class="container">
            <div class="card">
                <h1>Reserve a Room</h1>

                <div class="mb-3">
                    <label class="form-label">Room ID</label>
                    <asp:TextBox runat="server" ID="idroom" CssClass="form-control" />
                    <span id="idroom-error" class="error-message">* This field is required</span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Your Name</label>
                    <asp:TextBox runat="server" ID="nameroom" CssClass="form-control" />
                    <span id="nameroom-error" class="error-message">* This field is required</span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Date</label>
                    <asp:TextBox runat="server" ID="dateroom" CssClass="form-control" TextMode="Date" />
                    <span id="dateroom-error" class="error-message">* This field is required</span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Start Time</label>
                    <asp:TextBox runat="server" ID="timeroom" CssClass="form-control" TextMode="Time" />
                    <span id="timeroom-error" class="error-message">* This field is required</span>
                </div>

                <asp:Button runat="server" ID="sendreserve" OnClick="sendreserve_Click" Text="Reserve" class="btn btn-primary" />
            </div>
        </div>
    </form>
</body>
</html>
