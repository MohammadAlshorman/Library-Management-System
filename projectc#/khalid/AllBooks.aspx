<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllBooks.aspx.cs" Inherits="projectc_.khalid.AllBooks" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .book-card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            text-align: center;
            padding: 15px;
        }

            .book-card:hover {
                transform: scale(1.05);
            }

        .book-image {
            width: 100%;
            height: 200px;
            object-fit: contain;
            object-position: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .book-actions {
            display: flex;
            justify-content: center;
            gap: 20px; /* زيادة المسافة بين الأزرار */
        }

        .btn-borrow {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 25px;
            transition: all 0.3s ease-in-out;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 45%;
        }

            .btn-borrow:hover {
                background-color: #0056b3;
                transform: scale(1.1);
            }

        .btn-return {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 25px;
            transition: all 0.3s ease-in-out;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 45%;
        }

            .btn-return:hover {
                background-color: #218838;
                transform: scale(1.1);
            }

            .btn-borrow:disabled, .btn-return:disabled {
                background-color: #6c757d;
                cursor: not-allowed;
                transform: none;
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
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">Available Books</h2>

         <%--   <asp:LinkButton ID="backButton" runat="server" CssClass="btn btn-secondary"
                OnClick="back_Click">
                <i class="fa-solid fa-arrow-left fa-2x"></i> 
            </asp:LinkButton>--%>






            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>

            <asp:Panel ID="booksContainer" runat="server" CssClass="row"></asp:Panel>

        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        function borrowBook(bookId, title, author, category, imageName, buttonElement, event) {
            event.preventDefault();
            buttonElement.disabled = true;
            buttonElement.innerText = "Requesting...";

            $.ajax({
                type: "POST",
                url: 'AllBooks.aspx/BorrowBook',
                data: JSON.stringify({
                    bookId: bookId,
                    title: title,
                    author: author,
                    category: category,
                    imageName: imageName
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.includes("Error")) {
                        // إذا كانت الاستجابة تحتوي على خطأ، لا تغير حالة الزر
                        alert(response.d);
                        buttonElement.disabled = false;
                        buttonElement.innerText = "Borrow";
                    } else {
                        // إذا كانت الاستجابة ناجحة، قم بتغيير حالة الزر
                        alert(response.d);
                        buttonElement.innerText = "Pending Approval";
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error: " + error);
                    buttonElement.disabled = false;
                    buttonElement.innerText = "Borrow";
                }
            });
        }

        function returnBook(bookId, button, event) {
            event.preventDefault();

            fetch("AllBooks.aspx/ReturnBook", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ bookId: bookId })
            })
                .then(response => response.json())
                .then(data => {
                    alert(data.d); // عرض رسالة تأكيد إيقاف العد التنازلي
                })
                .catch(error => console.error("Error:", error));
        }


        function approveBorrowRequest(bookId) {
            $.ajax({
                type: "POST",
                url: 'AllBooks.aspx/ApproveBorrowRequest',
                data: JSON.stringify({ bookId: bookId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert(response.d);
                    location.reload(); // إعادة تحميل الصفحة بعد التحديث
                },
                error: function (xhr, status, error) {
                    alert("Error: " + error);
                }
            });
        }
    </script>
</body>
</html>
