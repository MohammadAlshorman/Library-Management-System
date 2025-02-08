<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomCards.aspx.cs" Inherits="projectc_.hala2.RoomCards" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />



    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <title>Room management</title>
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
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/hala2/WebForm1.aspx">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fa-solid fa-book fa-2x"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Memorial </div>
                </a>
                <!-- Divider -->
                <hr class="sidebar-divider my-0"/>

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="/hala2/WebForm1.aspx">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider"/>

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
            <%--    <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                        aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Requests</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Users Requests:</h6>
                            <a class="collapse-item" href="/hala2/BookReq.aspx">Books</a>
                            <a class="collapse-item" href="/hala2/RoomReq.aspx">Rooms</a>
                        </div>
                    </div>
                </li>--%>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                        aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Management</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                        data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Books & Rooms:</h6>
                            <a class="collapse-item" href="/hala2/BookCards.aspx">Books</a>
                            <a class="collapse-item" href="/hala2/RoomCards.aspx
">Rooms</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Addons
                </div>



                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="/hala2/UsersFeedback.aspx">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Feedbacks</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="/hala2/BlackList.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Black List</span></a>
                </li>
                <%--           <asp:Button id="blackList" runat="server" onclick="blackList_click" Text="blackList" />
                --%>
                <!-- Divider -->

                <hr class="sidebar-divider d-none d-md-block">
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <form class="form-inline">
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>
                        <!-- Topbar Navbar -->

                    </nav>
                    <!-- End of Topbar -->






                    <!-- Begin Page Content -->
                    <div class="container-fluid">


                        <div class="container">
                            <h2>Admin Dashboard</h2>

                            <div class="flex">
                                <!-- Add Room Card -->
                                <div class="card">
                                    <img src="https://cdn.shopify.com/s/files/1/2690/0106/files/download_24_480x480.jpg?v=1708755719" class="card-img-top" alt="Add Room"/>
                                    <div class="card-body">
                                        <h5 class="card-title">Add New Room</h5>
                                        <p class="card-text">Create a new study room easily.</p>
                                        <asp:Button ID="but1" runat="server" OnClick="but1_click" Text="Add" class="btn btn-primary"></asp:Button>
                                    </div>
                                </div>

                                <!-- Delete Room Card -->
                                <div class="card">
                                    <img src="https://www.squareyards.com/blog/wp-content/uploads/2024/04/Study-Room-Along-With-Books.jpg" class="card-img-top" alt="Deletee.Room"/>
                                    <div class="card-body">
                                        <h5 class="card-title">Delete & Edit Room</h5>
                                        <p class="card-text">Remove rooms from the system permanently.</p>
                                        <asp:Button ID="but3" runat="server" OnClick="but3_click" Text="Delete" class="btn btn-primary"></asp:Button>
                                    </div>
                                </div>

                                <!-- Show All Rooms Card -->
                                <div class="card">
                                    <img src="https://mixmag.asia/assets/uploads/images/_full/Murakami-7.jpeg" class="card-img-top" alt="Show Reservations">
                                    <div class="card-body">
                                        <h5 class="card-title">Show All Rooms</h5>
                                        <p class="card-text">View all rooms available in the library.</p>
                                        <asp:Button ID="but6" runat="server" OnClick="but6_click" Text="Show All Rooms" class="btn btn-primary"></asp:Button>
                                    </div>
                                </div>

                                <!-- Show Requests Card -->
                                <div class="card">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyzvqR1DoDGN-1prlLQfOPEw_X88hJXliJALM4QqwVCfesLBPIHFRIr2wxvsGwjdqYkmk&usqp=CAU" class="card-img-top" alt="Show Requests"/>
                                    <div class="card-body">
                                        <h5 class="card-title">Show Requests</h5>
                                        <p class="card-text">Check pending room reservation requests.</p>
                                        <asp:Button ID="but5" runat="server" OnClick="but5_click" Text="Show Requests" class="btn btn-primary"></asp:Button>
                                    </div>
                                </div>
                            </div>
                        </div>




                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>



        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>
    </form>







</body>
</html>
