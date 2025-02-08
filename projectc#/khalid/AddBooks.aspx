<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBooks.aspx.cs" Inherits="projectc_.khalid.AddBooks" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Library Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
        }

        .head {
            text-align: center;
            font-size: 35px;
            font-weight: bold;
        }

        .container {
            max-width: 900px;
            margin-top: 50px;
        }

        .card {
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 15px;
        }

        .page-title {
            font-weight: bold;
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-control {
            height: 40px;
            margin-bottom: 10px;
            border-radius: 8px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .btn-warning {
            background-color: #f39c12;
            border-color: #e67e22;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
            color: white;
            width: 100%;
        }

        .btn-warning:hover {
            background-color: #e67e22;
            border-color: #f39c12;
        }

        /* Apply Spacing for the Last Three Buttons */
        .spaced-buttons {
            display: flex;
            justify-content: space-evenly;
            margin-top: 30px;
        }

        .spaced-buttons .btn {
            width: 30%; /* Make sure the buttons are equally spaced */
        }

        .row {
            margin-bottom: 15px;
        }

        .form-control-file {
            background-color: #ffffff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .center-button {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .center-button .btn-warning {
            width: 20%;
        }
        #backButton {
    margin-bottom: 20px;
    background: #0d6efd;
    
}
#backButton:hover {
    background: #fff;
    color: #0d6efd;
    border-color: #0d6efd;
}
    </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container mt-5">
            <h2 class="page-title">Library Management System</h2>
            
            <asp:LinkButton ID="backButton" runat="server" CssClass="btn btn-secondary" OnClick="backButton_Click">
                <i class="fa-solid fa-arrow-left fa-2x"></i> 
            </asp:LinkButton>

            <div class="card p-3 mb-4">
                <h2 class="mb-4 head">Add Book</h2>

                <div class="row">
                    <div class="col-md-3">
                        <asp:TextBox ID="BookID" runat="server" CssClass="form-control" placeholder="Book ID"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="Title" runat="server" CssClass="form-control" placeholder="Book Title"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="Author" runat="server" CssClass="form-control" placeholder="Author"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="cat" runat="server" CssClass="form-control" placeholder="Category"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label for="FileUpload" class="form-label">Upload Book Cover:</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control-file" />
                    </div>
                </div>

                <!-- Center the "Add Book" Button -->
                <div class="center-button">
                    <asp:Button ID="btnAddBook" runat="server" Text="Add Book" CssClass="btn btn-warning" OnClick="btnAddBook_Click" />
                </div>
            </div>

            <!-- Buttons Section with Large Spaces Between (same as second code) -->
            <div class="spaced-buttons">
                <asp:Button ID="btnEditBook" runat="server" Text="Go To Edit Book" CssClass="btn btn-primary" OnClick="btnEditBook_Click" />
                <asp:Button ID="btnDeleteBook" runat="server" Text="Go To Delete Book" CssClass="btn btn-danger" OnClick="btnDeleteBook_Click" />
                <asp:Button ID="btnRequestBorrow" runat="server" Text="Go To Request Borrow" CssClass="btn btn-success" OnClick="btnRequestBorrow_Click" />
            </div>
        </div>
    </form>
</body>
</html>
