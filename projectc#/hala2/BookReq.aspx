<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookReq.aspx.cs" Inherits="projectc_.hala2.BookReq" %>

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

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    <title>Requested Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
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
                <li class="nav-item">
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
                </li>

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




                        <div class="container mt-4">
                            <h2 class="text-center mb-4">📚 Requested Books</h2>

                            <!-- Success/Error Message -->
                            <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="false"></asp:Label>

                            <!-- GridView displaying books -->
                            <asp:GridView ID="BooksGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="BooksGridView_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="BookId" HeaderText="Book ID" SortExpression="BookId" />
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                                    <asp:BoundField DataField="ImagePath" HeaderText="Image Path" SortExpression="ImagePath" />

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <!-- Accept and Cancel buttons -->
                                            <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandName="AcceptRequest" CommandArgument='<%# Eval("BookId") %>' CssClass="btn btn-success" />
                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="CancelRequest" CommandArgument='<%# Eval("BookId") %>' CssClass="btn btn-danger" />

                                            <!-- Labels to show Approved or Rejected -->
                                            <asp:Label ID="lblApproved" runat="server" Text="Approved" CssClass="text-success" Visible="false" />
                                            <asp:Label ID="lblRejected" runat="server" Text="Rejected" CssClass="text-danger" Visible="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>





                            <!-- Additional Buttons Section -->
                            <%--    <div class="mt-4">
            <asp:Button ID="btnEditBook" runat="server" Text="Go To Edit Book" CssClass="btn btn-primary" OnClick="btnEditBook_Click" />
            <asp:Button ID="btnDeleteBook" runat="server" Text="Go To Delete Book" CssClass="btn btn-danger" OnClick="btnDeleteBook_Click" />
            <asp:Button ID="btnAddBorrow" runat="server" Text="Go To Add Book" CssClass="btn btn-success" OnClick="btnAddBorrow_Click" />
        </div>--%>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </form>
</body>
</html>
