<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registerform.aspx.cs" Inherits="practise_coding.Registerform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <script src="Scripts/jquery-3.7.1.js"></script>
 <link rel="stylesheet" href="Content/bootstrap.css" />
</head>
<body>
        
 <%-- navbar --%>
    <form id="form2" runat="server">
        <div>
            <%-- Header --%>
            <header class="bg-primary text-white text-center py-3">
                <h1>AyfaCare</h1>
            </header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">Client Registration</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Home.aspx">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Login.aspx">SignIn</a>
        </li>
        <li class="nav-item ">
           <a class="nav-link active" aria-current="page" href="Registerform.aspx">SignUp</a>
            </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>
      </ul>
        </div>
  </div>
     </nav>
      </div>
        <div class=" container  border border-primary">
    <div>
        <label>Name:</label>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    </div>
         <div>
        <label>Surname:</label>
        <asp:TextBox ID="txtsurname" runat="server"></asp:TextBox>
    </div> 
        <div>
        <label>Email:</label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    </div>
        <div>
        <label>Phone Number:</label>
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    </div>
        <div class="row my-4" >
            <div class="col-md-4">
            <asp:Button ID="btnReg" runat="server" Text="Next" Postbackurl="~/Service.aspx" CssClass="btn btn-primary me-2 "  />
        </div>
        <div class="col-md-4">
            <asp:Button ID="btnBack" runat="server" Text="Back" Postbackurl="~/Login.aspx" CssClass="btn btn-primary me-2 "  />
        </div>
        </div>
            </div>
        
        
   
    </form>
</body>
</html>
