<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deletroom.aspx.cs" Inherits="projectc_.Amal.deletroom" %> 

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>Delete Room</title>
    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
            background-color: #f8f9fa;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-size: 1.2rem;
        }

        .form-control {
            font-size: 1rem;
            padding: 10px;
            border-radius: 5px;
        }

        .btn-primary, .btn-danger {
            width: 100%;
            font-size: 1.1rem;
            padding: 12px;
            border-radius: 5px;
        }

        .s {
            margin-top: 20px;
        }

        .mb-3 {
            margin-bottom: 1.5rem;
        }

        .result-text {
            margin-top: 10px;
            font-size: 1.1rem;
            font-weight: bold;
        }

        .result-text.success {
            color: green;
        }

        .result-text.error {
            color: red;
        }

        /* Style for search button and result to be inline */
        .search-container {
            display: flex;
            align-items: center;
        }

        .search-result {
            margin-left: 10px;
            font-size: 1rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center mb-4">Delete Room</h2>

            <!-- Search Room (Search box, button and result together) -->
            <div class="mb-3">
                <label for="search" class="form-label">Search Room</label>
                <div class="search-container">
                    <asp:TextBox style="width:100%;" ID="search" runat="server" class="form-control" type="search" placeholder="Enter Room ID to search" aria-label="Search"></asp:TextBox>
                    <asp:Button ID="butsearch" runat="server" OnClick="butsearch_Click" class="btn btn-outline-primary" Text="Search" type="submit"></asp:Button>
                    <!-- Result Label on the right side of the search button -->
                    <asp:Label ID="result" runat="server" Text="" CssClass="result-text search-result" Visible="false"></asp:Label>
                </div>
            </div>

            <!-- Room ID Input -->
            <div class="mb-3">
                <label for="roomid" class="form-label">Room ID</label>
                <asp:TextBox class="form-control" ID="roomid" runat="server"></asp:TextBox>
            </div>

            <!-- Delete Button -->
            <div class="s">
                <asp:Button ID="deletbutton" runat="server" OnClick="deletbutton_Click" Text="Delete this Room" class="btn btn-danger"></asp:Button>
            </div>

            <!-- Delete Confirmation Label -->
            <asp:Label ID="labeldelete" runat="server" Text="" CssClass="result-text" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
