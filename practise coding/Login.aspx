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
                 <asp:Image ID="Image1"  Width="100" height="100" ImageUrl="~/clinic.png" runat="server" />
                <h1>AyfaCare</h1>
            </header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">Online Booking</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Home.aspx">Home</a>
        </li>
       
        <li class="nav-item ">
           <a class="nav-link active" aria-current="page" href="Login.aspx">Patient</a>
            </li>
        <li class="nav-item ">
         <a class="nav-link active" aria-current="page" href="DoctotrsLogins.aspx" >Doctors</a>
        </li>
         
      </ul>
      <div class="row">
          <div class="col-4">

        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
        
          </div>
          <div class="col-6"><button class="btn btn-outline-primary" type="submit">Search</button></div>
         </div>
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
                <asp:Button ID="btnSubmit" runat="server" Text="Submit"  CssClass="btn btn-primary " OnClick="btnSubmit_Click"   />
            </div>
        </div>
    </form>
</body>
</html>
