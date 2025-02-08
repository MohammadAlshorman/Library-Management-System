<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="creattestuser.aspx.cs" Inherits="projectc_.Amal.creattestuser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title></title>
    
                <style>
        /* Add some custom styling for the form container */
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-header {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .btn-primary {
            width: 48%;
            margin-top: 20px;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
        }

        /* Customizing form labels */
        .form-label {
            font-size: 1rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

         <!-- Room ID -->
           <div class="mb-3">
                <label for="roomid" class="form-label">Room ID</label>
                <asp:TextBox class="form-control" ID="ROOMIDUSER" runat="server" aria-describedby="roomidHelp"></asp:TextBox>
            </div>

            <!-- Student Name -->  
            <div class="mb-3">
                <label for="studentname" class="form-label">Student Name</label>
                <asp:TextBox class="form-control" ID="STUDENTNAME" runat="server" aria-describedby="studentnameHelp"></asp:TextBox>
            </div>

            <!-- Date --> 
            <div class="mb-3">
                <label for="date" class="form-label">Date</label>
                <asp:TextBox class="form-control" type="date" ID="DATEUSER" runat="server" aria-describedby="dateHelp"></asp:TextBox>
            </div>

            <!-- Start Time -->   
            <div class="mb-3">
                <label for="starttime" class="form-label">Start Time</label>
                <asp:TextBox class="form-control" type="time" ID="STARTTIMEUSER" runat="server" aria-describedby="starttimeHelp"></asp:TextBox>
            </div>

            <!-- Button Container -->   
            <div class="button-container">
                <asp:Button ID="USERDATA" runat="server" Text="SAVE" OnClick="USERDATA_Click" type="submit" class="btn btn-success"></asp:Button>
                
               

            </div>
        </div>
    </form>
</body>
</html>

