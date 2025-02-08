<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersFeedback.aspx.cs" Inherits="projectc_.hala2.UsersFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css" />
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.png" />
    <%--    for feedback bootstrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        .back {
            width: 14vw;
            align-self: center;
        }

        [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
            cursor: pointer;
            /*            background: #00000091 !important;*/
            border: white !important;
        }

        .nav-tabs .nav-link {
            border-top-right-radius: var(--bs-nav-tabs-border-radius);
            /*            background: #333 !important;*/
            color: black !important;
        }

        .card-body {
            background: #ecf6ff !important;
        }

        .feedback-card {
            /*            background: #f39c129c !important;*/
            /*            color: white !important;*/
        }

        .feedback-message {
            color: #fff !important;
        }


        .feedback-date {
            /*           color: #fff !important;*/
        }

        .feedback-user {
            /*            color: #fff !important;*/
        }

        .feedback-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .feedback-card {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #e9ecef;
            border-radius: 10px;
            background: #ecf6ff;
            transition: transform 0.2s ease-in-out;
        }

            .feedback-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

        .feedback-user {
            font-weight: bold;
            color: #333;
        }

        .feedback-date {
            font-size: 0.9em;
            color: #6c757d;
        }

        .feedback-message {
            margin-top: 10px;
            color: black !important;
        }

        .no-feedback {
            text-align: center;
            color: #6c757d;
            font-style: italic;
        }

        .nav-link.disabled {
            pointer-events: none; /* Prevents clicking */
            opacity: 0.6; /* Makes it look disabled */
            color: gray; /* Change text color */
        }



        .stat-card {
            transition: transform 0.3s ease-in-out;
        }

            .stat-card:hover {
                transform: translateY(-5px);
            }

            .stat-card i {
                transition: transform 0.3s ease-in-out;
            }

            .stat-card:hover i {
                transform: scale(1.1);
            }
    </style>
</head>

<body id="page-top">
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
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="/hala2/WebForm1.aspx">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

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


                        <%--feesback from users--%>
                        <div class="card text-center">
                            <div class="card-header">
                                <ul class="nav nav-tabs card-header-tabs">
                                    <li class="nav-item">
                                        <asp:LinkButton ID="lnkSuggestion" runat="server" CssClass="nav-link active" OnClick="lnkSuggestion_Click">Suggestion</asp:LinkButton>
                                    </li>
                                    <li class="nav-item">
                                        <asp:LinkButton ID="lnkComplaint" runat="server" CssClass="nav-link " OnClick="lnkComplaint_Click">Complaint</asp:LinkButton>
                                    </li>
                                    <li class="nav-item">
                                        <asp:LinkButton ID="lnkInquiry" runat="server" CssClass="nav-link " OnClick="lnkInquiry_Click">Inquiry</asp:LinkButton>
                                    </li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <div class="feedback-container">
                                    <h2 id="feedbackHeader" runat="server" class="text-center mb-4"></h2>

                                    <!-- Feedback List -->
                                    <div id="Div1" runat="server" class="text-center mb-4"></div>
                                    <div id="feed" runat="server"></div>
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
