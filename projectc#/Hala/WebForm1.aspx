<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="projectc_.Hala.WebForm1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

    <%--external File--%>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css" />
    <link rel="stylesheet" href="assets/vendors/ti-icons/css/themify-icons.css" />
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css" />
    <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.min.css" />
    <!-- endinject -->
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
    <style>
        /* General Styles */

        [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {

    background: #00000091;
}
        .content-wrapper {
/*            background: #f39c12;*/
            padding: 2.75rem 2.25rem;
            width: 100%;
            -webkit-flex-grow: 1;
            flex-grow: 1;
            margin-left: 9vw;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

.feedback-section {
    width: 100%;
    padding: 40px 20px;
    box-sizing: border-box;
    background-color: #f9f9f9;

}

.feedback-content {
    display: flex;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    gap: 40px; /* Space between image and text */
}

.feedback-image {
    width: 50%; /* Adjust as needed */
    height: auto;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Adds a subtle shadow */
}

.feedback-text-container {
    flex: 1; /* Takes remaining space */
    text-align: left;
}

.feedback-text {
    font-size: 25px;
    color: #333;
    margin-bottom: 20px;
    line-height: 1.6; /* Improves readability */
    font-weight:bold;
    text-align:center;
}

.feedback-button {
    padding: 12px 24px;
    font-size: 16px;
    color: #fff;
    background-color: #007BFF;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}
.margin{
      margin-left: 35%;
}
.feedback-button:hover {
    background-color: #0056b3;
}
    </style>

    <title></title>
</head>





<body>




    <form id="form1" runat="server">
        <!-- Add ScriptManager for AJAX support -->
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server" />--%>
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper">
                <div class="main-panel">
                    <div class="content-wrapper">



                        <%--                        library info--%>
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" />
                        <section class="app-stats bg-light py-5">
                            <div class="container">
                                <h2 class="text-center mb-5">Welcome to Admin page</h2>
                                <div class="row g-4">
                                    <div class="col-md-3 col-sm-6">
                                        <div class="stat-card text-center bg-white p-4 shadow-sm rounded">
                                            <i class="bi bi-people fs-1 text-primary mb-3"></i>
                                            <h3 id="numOfUsers" class="fs-2 fw-bold">1.2k</h3>
                                            <p class="text-muted mb-0">Last Month</p>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="stat-card text-center bg-white p-4 shadow-sm rounded">
                                            <i class="bi bi-book fs-1 fa-4x text-success mb-3"></i>
                                            <h3 id="numOfBooks" runat="server" class="fs-2 fw-bold" onclick="numOfBooks_Click"></h3>
                                            <p class="text-muted mb-0">Books</p>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="stat-card text-center bg-white p-4 shadow-sm rounded">
                                            <i class="bi bi-star-fill fs-1 text-warning mb-3"></i>
                                            <h3 class="fs-2 fw-bold">4.8</h3>
                                            <p class="text-muted mb-0">Average Rating</p>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="stat-card text-center bg-white p-4 shadow-sm rounded">
                                            <i class="bi bi-globe fs-1 text-info mb-3"></i>
                                            <h3 class="fs-2 fw-bold">50+</h3>
                                            <p class="text-muted mb-0">Countries</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>










                        <%--  admin cards--%>
                        <div class="row">
                            <div class="col-md-4 stretch-card grid-margin">
                                <div class="card bg-gradient-danger card-img-holder text-white">
                                    <%--card #1--%>
                                    <div class="card-body">
                                        <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                        <h2 class="mb-5">Books</h2>
                                        <h5 class="card-text">Manage books </h5>
                                        <br />
                                        <asp:Button runat="server" ID="booksCard1" class="btn btn-primary" Text="Books Managements" OnClick="booksCard_Click1" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 stretch-card grid-margin">
                                <div class="card bg-gradient-info card-img-holder text-white">
                                    <%--card #2--%>
                                    <div class="card-body">
                                        <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                        <h2 class="mb-5">Rooms</h2>
                                        <h5 class="card-text">Meeting Room Reservation </h5>
                                        <br />
                                        <asp:Button runat="server" ID="Rooms" class="btn btn-primary" Text="Rooms Managements" OnClick="Rooms_Click" />

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 stretch-card grid-margin">
                                <div class="card bg-gradient-success card-img-holder text-white">
                                    <%--card #3--%>
                                    <div class="card-body">
                                        <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                        <h2 class="mb-5">Requests</h2>
                                        <h5 class="card-text">Borrow Requests </h5>
                                        <br />
                                        <asp:Button runat="server" ID="BorrowBook" class="btn btn-primary" Text="Management Requests" OnClick="BorrowBook_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>



                        <%--Black list --%>
                        <div class="row">
                            <div class="col-md-7 grid-margin stretch-card">

                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Black List</h4>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Reason</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="blockedUser" runat="server" onclick="blockedUser_Click">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>





                            <%-- to do list--%>
                            <div class="col-md-5 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title text-dark">Todo List</h4>
                                        <div class="add-items d-flex">
                                            <asp:TextBox ID="txtTask" runat="server" CssClass="form-control todo-list-input" placeholder="What do you need to do today?"></asp:TextBox>
                                            <asp:Button ID="btnAddTask" runat="server" CssClass="add btn btn-gradient-primary font-weight-bold todo-list-add-btn" Text="Add" OnClick="btnAddTask_Click" />
                                        </div>
                                        <div class="list-wrapper">
                                            <asp:BulletedList ID="lstTasks" runat="server" CssClass="d-flex flex-column-reverse todo-list todo-list-custom" BulletStyle="NotSet"></asp:BulletedList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                 


                        <%-- Users Feedback Section --%>
                        <section class="feedback-section">
                            <div class="feedback-content">
                             <%-- assets/images/feed.jpeg--%>
                                <img src="https://i.pinimg.com/736x/79/30/37/793037cd4acc0fc2e2e66cbe1d0c684b.jpg"alt="Feedback Image" class="feedback-image" />
                                <div class="feedback-text-container">

                                    <p class="feedback-text"> 👥 Users Feedback are the core of developments! 📚</p>
                                    <asp:Button  ID="feedbackView" runat="server" CssClass="margin btn btn-gradient-primary font-weight-bold feedback-button" Text="View Feedbacks" OnClick="feedbackView_Click" />
                                </div>
                            </div>
                        </section>

                    </div>
            </div>
        </div>
    </form>

    <!-- Scripts -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="assets/vendors/chart.js/chart.umd.js"></script>
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/misc.js"></script>
    <script src="assets/js/dashboard.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   

</body>




</html>

