<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReqBorrow.aspx.cs" Inherits="projectc_.khalid.ReqBorrow" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Requested Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">📚 Requested Books</h2>

            <asp:LinkButton ID="backButton" runat="server" CssClass="btn btn-secondary" OnClick="backButton_Click">
        <i class="fa-solid fa-arrow-left fa-2x"></i> 
            </asp:LinkButton>

            <!-- Success/Error Message -->
            <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="false"></asp:Label>

            <!-- GridView displaying books -->
            <asp:GridView ID="BooksGridView" runat="server" AutoGenerateColumns="False"
                CssClass="table table-bordered"
                OnRowCommand="BooksGridView_RowCommand"
                OnRowDataBound="BooksGridView_RowDataBound">

                <Columns>
                    <asp:BoundField DataField="BookId" HeaderText="Book ID" SortExpression="BookId" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="ImagePath" HeaderText="Image Path" SortExpression="ImagePath" />

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" CssClass="fw-bold"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnAccept" runat="server" Text="Accept"
                                CommandName="AcceptRequest"
                                CommandArgument='<%# Eval("BookId") %>'
                                CssClass="btn btn-success" />

                            <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                                CommandName="CancelRequest"
                                CommandArgument='<%# Eval("BookId") %>'
                                CssClass="btn btn-danger" />
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
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
