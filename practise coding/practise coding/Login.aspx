<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="practise_coding.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <script src="Scripts/jquery-3.7.1.js"></script>
 <link rel="stylesheet" href="Content/bootstrap.css" />
</head>
<body>
    <form id="form1" runat="server">
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
        <a class="nav-link" href="Login.aspx">SignUp</a>
      </li>
      <li class="nav-item ">
         <a class="nav-link active" aria-current="page" href="Service.aspx">Service</a>
          </li>
      <li class="nav-item">
        <a class="nav-link disabled" aria-disabled="true">Disabled</a>
      </li>
    </ul> 
      
      </div>
   
      </div>
       </nav>
    </div>

        

        <div class=" container mt-4 text-center py-3 border border-primary " >
            
            <h1><asp:Image ID="Image2" runat="server" ImageURL="~/user.png" Width="70" /></h1>
            <div>
                <label >Username</label>
                <asp:TextBox  ID="txtUsername" runat="server" ></asp:TextBox>
            </div>
            <div> 
                <label>Password</label>
                <asp:TextBox ID="txtpassword" runat="server" ></asp:TextBox>
            </div>
            <div>
                <label>Dont have account?</label>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registerform.aspx">Register</asp:HyperLink>
            </div>
            
            <div>
                <br />
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Postbackurl="~/Service.aspx" CssClass="btn btn-primary "  />
            </div>
        </div>
    </form>
</body>
</html>
