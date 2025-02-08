<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="projectc_.Hala.Requests" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <style>
        .twoCol {
            display: grid;
            grid-template-columns: auto auto;
            justify-content: space-evenly;
            margin: 2% 5%;
        }

        .card {
            margin: 5% 3%;
        }

        h2 {
            text-align: center;
        }

        .card-img-top {
            height: 20vw;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <h2>Welcome Admin</h2>
        <div class="twoCol">

            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="https://i.pinimg.com/236x/c4/21/04/c4210491e34a34d4c6f0d95628bc7850.jpg" alt="Card image cap" />
                <div class="card-body">
                    <h5 class="card-title"> Books Requests</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <asp:Button runat="server" ID="bookRequests" class="btn btn-primary" Text="View " OnClick="bookRequests_Click" />

                </div>
            </div>


            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="data:image/jpeg;base64,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" alt="Card image cap" />
                <div class="card-body">
                    <h5 class="card-title">Rooms Requests </h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <asp:Button runat="server" ID="roomsRequests" class="btn btn-primary" Text="View " OnClick="roomsRequests_Click" />
                    
                </div>
            </div>

           

        </div>
    </form>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

</body>
</html>
