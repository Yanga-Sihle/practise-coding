<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TypeofClinics.aspx.cs" Inherits="practise_coding.TypeofClinics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="Scripts/jquery-3.7.1.js"></script>
  <link rel="stylesheet" href="Content/bootstrap.css" />
</head>
<body>
      <form id="form2" runat="server">
      <div>
          <%-- Header --%>
          <header class="bg-primary text-white text-center py-3">
              <h1>AyfaCare</h1>
          </header>
              <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class="container">
  <a class="navbar-brand" href="#">Clinic/Hospitals</a>
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
           
          <div class="row my-4 container m-4 text-center py-3 border border-primary" >
             
    <div class="col-md-4 ">
    <asp:Button ID="btnPublic" runat="server" Text="Public"  CssClass="btn btn-primary me-2 " Width="300" Height="250" PostBackURl="~/Public.aspx" />
</div>
<div class="col-md-4">
    <asp:Button ID="btnPrivate" runat="server" Text="Private"  CssClass="btn btn-primary me-2 " Width="300" Height="250" PostBackURL="~/Private.aspx" />
</div>
 
    <div class="col-md-3 mb-4">
     <h5>About our company </h5>
     <%-- ul allows the listed name not to have bullets --%>
     <ul class="list-unstyled"> 
         <li><a href="#">About Us</a></li>
          <li><a href="#">Our Mission</a></li>
          <li><a href="#">Our Team</a></li>
        

  <li><a href="#">Contact Us</a></li>
  <li><a href="#">Resource</a></li>
  <li><a href="#">Technical Support</a></li>
      </ul>
 </div>
          

</div>
  
    </form>
</body>
</html>
