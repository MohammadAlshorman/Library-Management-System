<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seeroom.aspx.cs" Inherits="projectc_.Amal.seeroom" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            font-family: 'Poppins', sans-serif;
            color: white;
            text-align: center;
            padding-top: 40px;
        }

        .table-container {
            max-width: 1000px;
            margin: auto;
            background: rgba(255, 255, 255, 0.15);
            padding: 25px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }

        h2 {
            color: #FFD700;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(255, 255, 255, 0.3);
        }

        .table {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            color: white;
        }

        thead {
            background-color: #007bff;
            color: white;
        }

        tbody tr {
            transition: all 0.3s ease-in-out;
        }

        tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .status-free {
            background-color: #28a745;
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
        }

        .status-booked {
            background-color: #dc3545;
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
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
</head>
<body>

    <form id="form2" runat="server">
        <div class="container">
            <div class="table-container">
                <h2 class="text-center">Room Availability</h2>
                <table class="table table-striped table-bordered text-center">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Room Name</th>
                            <th scope="col">Location</th>
                            <th scope="col">Capacity</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody id="table1" runat="server">
                    </tbody>
                </table>
                <asp:Button ID="goreserve" runat="server" Text="Reserve a Room" OnClick="goreserve_Click" class="btn btn-primary mt-3" />
            </div>
        </div>
    </form>

</body>
</html>
