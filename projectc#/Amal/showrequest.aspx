<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showrequest.aspx.cs" Inherits="projectc_.Amal.showrequest" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        /* Styling for the body and container */
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            margin-left: auto;
            margin-right: auto;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

            .table th, .table td {
                padding: 15px;
                text-align: center;
                border: 1px solid #ddd;
            }

            .table th {
                background-color: #007bff;
                color: white;
            }

        .table-striped tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        /* Custom buttons */
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            width: 150px;
            padding: 10px;
            font-size: 16px;
            text-transform: uppercase;
        }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            width: 150px;
            padding: 10px;
            font-size: 16px;
            text-transform: uppercase;
        }

            .btn-danger:hover {
                background-color: #c82333;
                border-color: #c82333;
            }

        /* Input and form styling */
        .form-control {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* Responsive design for smaller screens */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            .table th, .table td {
                padding: 10px;
            }

            .btn {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
    <title>Show Request</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
                        <div class="text-center">
    <button onclick="exportToPDF()" class="btn btn-success">Export to PDF</button>
    <button onclick="exportToExcel()" class="btn btn-success">Export to Excel</button>
</div>
            <br />
            <h2>Room Reservation Requests</h2>

            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Room ID</th>
                        <th>Student Name</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody id="reservationTable" runat="server"></tbody>
            </table>

            <div class="form-group">
                <asp:TextBox ID="txtRoomID" runat="server" CssClass="form-control" placeholder="Enter Room ID"></asp:TextBox>
            </div>

            <div class="text-center">
                <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-primary" OnClick="btnApprove_Click" />
                <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-danger" OnClick="btnReject_Click" />
            </div>
            <br /><br />
    

            <asp:Button ID="back3" runat="server" OnClick="back3_Click" Text="Go back"  CssClass="btn btn-primary" />
        </div>
    </form>

    <script>
    function exportToPDF() {
        const { jsPDF } = window.jspdf;
        let doc = new jsPDF();

        doc.text("Room Reservation Requests", 14, 10);

        let table = document.getElementById("reservationTable");
        let headers = [];
        let data = [];

        // استخراج رؤوس الأعمدة
        document.querySelectorAll("thead th").forEach(th => headers.push(th.innerText.trim()));

        // استخراج البيانات بدون تعديل الجدول
        let rows = table.querySelectorAll("tr");
        rows.forEach(tr => {
            let rowData = [];
            tr.querySelectorAll("td").forEach(td => rowData.push(td.innerText.trim()));
            if (rowData.length === headers.length) {
                data.push(rowData);
            }
        });

        if (data.length === 0) {
            alert("No data available to export!");
            return;
        }

        doc.autoTable({
            head: [headers],
            body: data,
            startY: 20
        });

        doc.save("RoomRequests.pdf");
    }

    function exportToExcel() {
        let table = document.getElementById("reservationTable");
        let headers = [];
        let data = [];

        // استخراج رؤوس الأعمدة
        document.querySelectorAll("thead th").forEach(th => headers.push(th.innerText.trim()));

        // استخراج البيانات بدون تعديل الجدول
        let rows = table.querySelectorAll("tr");
        rows.forEach(tr => {
            let rowData = [];
            tr.querySelectorAll("td").forEach(td => rowData.push(td.innerText.trim()));
            if (rowData.length === headers.length) {
                data.push(rowData);
            }
        });

        if (data.length === 0) {
            alert("No data available to export!");
            return;
        }

        let wb = XLSX.utils.book_new();
        let ws = XLSX.utils.aoa_to_sheet([headers, ...data]);

        XLSX.utils.book_append_sheet(wb, ws, "Requests");
        XLSX.writeFile(wb, "RoomRequests.xlsx");
    }
    </script>

</body>
</html>
