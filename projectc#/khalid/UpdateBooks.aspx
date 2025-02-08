<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateBooks.aspx.cs" Inherits="projectc_.khalid.UpdateBooks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Update Book - Library Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 900px;
            margin-top: 50px;
        }

        .card {
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h2 {
            font-weight: bold;
            color: #343a40;
        }

        .form-control {
            height: 40px;
            margin-bottom: 10px;
        }

        .btn {
            height: 40px;
            width: 100%;
            border-radius: 10px; /* Adding smooth border (rounded corners) */
        }

        .alert {
            display: none;
        }

        .mt-3 {
            text-align: center;
        }

        #btnUpdateBook {
            color: #ffffff;
            width: 20%;
        }

        h4 {
            text-align: center;
            font-weight: bold;
        }

        /* Adjust Button Styles */
        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

            .btn-group .btn {
                width: 32%;
                margin-right: 100px; /* Adding space between buttons */
            }

                /* Remove right margin from the last button */
                .btn-group .btn:last-child {
                    margin-right: 0;
                }

        /* Style the inputs for Image Filename aligned with Author */
        .row .col-md-6 {
            margin-bottom: 10px;
        }

        #backButton {
            margin-bottom: 20px;
            background: #0d6efd;
            width: 7%;
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
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center mb-4">📚 Library Management System</h2>
                <asp:LinkButton ID="backButton" runat="server" CssClass="btn btn-secondary" OnClick="backButton_Click">
        <i class="fa-solid fa-arrow-left fa-2x"></i> 
    </asp:LinkButton>
            <!-- 📌 Add or Edit Books Form -->
            <div class="card p-3 mb-3">
                <h4 class="mb-3">Update Books</h4>
                <div class="row">
                    <!-- Search Field and Button Aligned -->
                    <div class="col-md-12">
                        <div class="input-group">
                            <asp:TextBox ID="searchTxt" runat="server" CssClass="form-control" placeholder="Enter Book ID to Search"></asp:TextBox>
                            <div class="input-group-append">
                                <asp:Button ID="searchBtn" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="searchBtn_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

                <!-- Book Details -->
                <div class="row">
                    <div class="col-md-6">
                        <asp:TextBox ID="BookID" runat="server" CssClass="form-control" placeholder="Book ID"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="Title" runat="server" CssClass="form-control" placeholder="Book Title"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6">
                        <asp:TextBox ID="Author" runat="server" CssClass="form-control" placeholder="Author"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="Genre" runat="server" CssClass="form-control" placeholder="Category"></asp:TextBox>
                    </div>
                </div>

                <!-- Image Filename Aligned with Author -->
                <div class="row mt-3">
                    <div class="col-md-6">
                        <asp:TextBox ID="ImageFileName" runat="server" CssClass="form-control" Text="Image File Name"></asp:TextBox>
                    </div>
                </div>

                <div class="mt-3">
                    <asp:Button ID="btnUpdateBook" runat="server" Text="Update Book" CssClass="btn btn-warning" OnClick="btnUpdateBook_Click" />
                </div>
            </div>

            <!-- Success/Error Alerts -->
            <div id="alertContainer" class="mt-4">
                <div id="successAlert" class="alert alert-success" role="alert">
                    Book Data Updated Successfully!
                </div>
                <div id="errorAlert" class="alert alert-danger" role="alert">
                    Book Not Found!
                </div>
            </div>

            <!-- Buttons Section (Aligned with Flexbox) -->
            <div class="btn-group">
                <asp:Button ID="btnEditBook" runat="server" Text="Go To Request Borrow" CssClass="btn btn-primary" OnClick="btnRequestBorrow_Click" />
                <asp:Button ID="btnDeleteBook" runat="server" Text="Go To Delete Book" CssClass="btn btn-danger" OnClick="btnDeleteBook_Click" />
                <asp:Button ID="btnAddBorrow" runat="server" Text="Go To Add Book" CssClass="btn btn-success" OnClick="btnAddBorrow_Click" />
            </div>

        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Toggle success/error alerts based on actions
        function showAlert(isSuccess) {
            const successAlert = document.getElementById('successAlert');
            const errorAlert = document.getElementById('errorAlert');
            if (isSuccess) {
                successAlert.style.display = 'block';
                errorAlert.style.display = 'none';
            } else {
                successAlert.style.display = 'none';
                errorAlert.style.display = 'block';
            }
        }
    </script>
</body>
</html>
