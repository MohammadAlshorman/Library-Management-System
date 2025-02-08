<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page1.aspx.cs" Inherits="projectc_.Amal.page1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>Admin Dashboard</title>
    <style>
        /* Global Styles */
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        /* Container for center-aligned content */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding-top: 3rem;
        }

        /* Heading Styles */
        h2 {
            text-align: center;
            margin-bottom: 3rem;
            font-size: 2.5rem;
            color: #343a40;
        }

        /* Flex container for cards */
        .flex {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            flex-wrap: wrap;
        }

        /* Card Styling */
        .card {
            width: 18rem;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s ease;
            background-color: white;
        }

        /* Card Hover Effect */
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .card-img-top {
            height: 180px;
            object-fit: cover;
        }

        /* Card Body */
        .card-body {
            padding: 1.5rem;
            text-align: center;
        }

        .card-title {
            font-size: 1.5rem;
            color: #007bff;
            margin-bottom: 1rem;
        }

        .card-text {
            font-size: 1rem;
            color: #6c757d;
            margin-bottom: 1.5rem;
        }

        /* Button Styling */
        .btn-primary {
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        /* Button Hover Effect */
        .btn-primary:hover {
            background-color: #0056b3;
        }

        /* Horizontal Line Styling for Separation */
        .line {
            border-top: 2px solid #007bff;
            margin: 20px 0;
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 768px) {
            .flex {
                justify-content: center;
            }

            .card {
                width: 100%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Admin Dashboard</h2>

            <div class="flex">
                <!-- Add Room Card -->
                <div class="card">
                    <img src="room3.jpg" class="card-img-top" alt="Add Room">
                    <div class="card-body">
                        <h5 class="card-title">Add New Room</h5>
                        <p class="card-text">Create a new study room easily.</p>
                        <asp:Button ID="but1" runat="server" OnClick="but1_click" Text="Add" class="btn btn-primary"></asp:Button>
                    </div>
                </div>

                <!-- Line Separator Before Edit Card -->
              

                <!-- Edit Room Card (Currently commented out) -->
                <!--
                <div class="card">
                    <img src="room2.jpg" class="card-img-top" alt="Edit Room">
                    <div class="card-body">
                        <h5 class="card-title">Edit Room</h5>
                        <p class="card-text">Modify existing study rooms.</p>
                        <asp:Button ID="but2" runat="server" OnClick="but2_click" Text="Edit" class="btn btn-primary"></asp:Button>
                    </div>
                </div>
                -->

                <!-- Line Separator After Edit Card -->
              

                <!-- Delete Room Card -->
                <div class="card">
                    <img src="room4.jpg" class="card-img-top" alt="Delete Room">
                    <div class="card-body">
                        <h5 class="card-title">Delete & Edit Room</h5>
                        <p class="card-text">Remove rooms from the system permanently.</p>
                        <asp:Button ID="but3" runat="server" OnClick="but3_click" Text="Delete" class="btn btn-primary"></asp:Button>
                    </div>
                </div>

                <!-- Show All Rooms Card -->
                <div class="card">
                    <img src="roooooom.jpg" class="card-img-top" alt="Show Reservations">
                    <div class="card-body">
                        <h5 class="card-title">Show All Rooms</h5>
                        <p class="card-text">View all rooms available in the library.</p>
                        <asp:Button ID="but6" runat="server" OnClick="but6_click" Text="Show All Rooms" class="btn btn-primary"></asp:Button>
                    </div>
                </div>

                <!-- Show Requests Card -->
                <div class="card">
                    <img src="room6.jpg" class="card-img-top" alt="Show Requests">
                    <div class="card-body">
                        <h5 class="card-title">Show Requests</h5>
                        <p class="card-text">Check pending room reservation requests.</p>
                        <asp:Button ID="but5" runat="server" OnClick="but5_click" Text="Show Requests" class="btn btn-primary"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
