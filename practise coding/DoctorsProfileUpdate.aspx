<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorsProfileUpdate.aspx.cs" Inherits="practise_coding.DoctorsProfileUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <a class="navbar-brand" href="#">Doctors</a>
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
      <div class="row">
          <div class="col-4">

      
          </div>
          <div class="col-6"><button class="btn btn-outline-primary" type="submit">Search</button></div>
         </div>
    </div>
  </div>
</nav>
   </div>
          <style>
       .sidenav {
    height: 100%;
    width: 20%;
    position: fixed;
    z-index: 1;
    top: 40%;
    left: 0;
    background-color: #1a5aa8;
    overflow-x: hidden;
    transition: 0.5s;
    padding-bottom: 60px;
}

/* The links inside the side navigation */
.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #ffffff;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #ffffff;
}

/* The close button */
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

/* Page content */
#main {
    transition: margin-left .5s;
    padding: 16px;
}
   </style>

   <div>
       <h1>Menu</h1>
        <div id="mySidenav" class="sidenav ">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">My Profile</a>
        <a href="DoctorEditPro.aspx">Availability</a>
        <a href="#">Client</a>
        <a href="#">Reports</a>
    </div>

    <!-- Open Button -->
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>

    <!-- Main Content -->
    

    <script src="scripts.js"></script>
   </div>
   <script type="text/javascript">
       // JavaScript function to open the navbar
       function openNav() {
           document.getElementById("mySidenav").style.width = "250px";
           document.getElementById("main").style.marginLeft = "250px";
       }

       // JavaScript function to close the navbar
       function closeNav() {
           document.getElementById("mySidenav").style.width = "0";
           document.getElementById("main").style.marginLeft = "0";
       }
   </script>
        <div class="row">
   <div class="col-md-8 mx-auto">
       <div class="card">
           <div class="card-header bg-info text-white">
               <h2>User Profile</h2>
           </div>
           <div class="card-body">
               <div class="alert alert-info">
                   <h4>My Profile</h4>
                   <p>Your registration information was successfully transferred using Response.Redirect with Query Strings.</p>
               </div>

               <h3 class="text-center">Profile Information</h3>
                   
               
               <div class="table-responsive">
                   <table class="table table-bordered">
                       <tr>
                           <th>Full Name:</th>
                           <td><asp:Label ID="lblDocFullName" runat="server"></asp:Label></td>
                       </tr>
                       <tr>
                           <th> Address:</th>
                           <td><asp:Label ID="lblDocAddress" runat="server"></asp:Label></td>
                       </tr>
                       <tr>
                        <th>Email Address:</th>
                         <td><asp:Label ID="lblDocEmail" runat="server"></asp:Label></td>
                         </tr>
                        <tr>
                           <th>Profession:</th>
                        <td><asp:Label ID="lblDocProfession" runat="server"></asp:Label></td>
                       </tr>
                       <tr>
                           <th>Contact:</th>
                           <td><asp:Label ID="lblDocContact" runat="server"></asp:Label></td>
                       </tr>
                   </table>
               </div>
               
              
               </div>
              </div>
               
              <div class="col-md-8 mx-auto border border-primary">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DoctorID" DataSourceID="SqlDataSource1" Width="1031px">
            <Columns>
    <asp:BoundField DataField="DoctorID" HeaderText="DoctorID" InsertVisible="False" ReadOnly="True" SortExpression="DoctorID" />
    <asp:BoundField DataField="DoctorName" HeaderText="DoctorName" SortExpression="DoctorName" />
    <asp:BoundField DataField="DoctorAddress" HeaderText="DoctorAddress" SortExpression="DoctorAddress" />
    <asp:BoundField DataField="DoctorContact" HeaderText="DoctorContact" SortExpression="DoctorContact" />
    <asp:BoundField DataField="DoctorEmail" HeaderText="DoctorEmail" SortExpression="DoctorEmail" />
               
                <asp:BoundField DataField="LicenceNumber" HeaderText="LicenceNumber" SortExpression="LicenceNumber" />
                <asp:BoundField DataField="DoctorSpecialisation" HeaderText="DoctorSpecialisation" SortExpression="DoctorSpecialisation" />
                <asp:BoundField DataField="Hospital" HeaderText="Hospital" SortExpression="Hospital" />
               
</Columns>
       </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AyfaCareConnectionString7 %>" ProviderName="<%$ ConnectionStrings:AyfaCareConnectionString7.ProviderName %>" SelectCommand="SELECT [DoctorID], [DoctorName], [DoctorAddress], [DoctorContact], [DoctorEmail], [LicenceNumber], [DoctorSpecialisation], [Hospital], [Picture] FROM [Dr_Registration]"></asp:SqlDataSource>
              </div>
             </div>
            </div>
    </form>
         
   
</body>
</html>
