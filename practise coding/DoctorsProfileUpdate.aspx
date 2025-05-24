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
                   <h4>My Clients</h4>
                   <p>Bookings</p>
               </div>

               
              <asp:GridView ID="DoctorAppointmentsGrid" runat="server" AutoGenerateColumns="False"  
    DataKeyNames="AppointmentID" CssClass="table table-sm" 
    OnRowCommand="DoctorAppointmentsGrid_RowCommand" 
    OnSelectedIndexChanged="DoctorAppointmentsGrid_SelectedIndexChanged1"> 
    <Columns>
        <asp:BoundField DataField="ClientName" HeaderText="Client Name" SortExpression="ClientName" />
        <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
        <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" SortExpression="BookingDate" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="SlotDate" HeaderText="Slot Date" SortExpression="SlotDate" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime" />
        <asp:BoundField DataField="EndTime" HeaderText="End Time" SortExpression="EndTime" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="AcceptButton" runat="server" Text="Accept" CommandName="Accept" CommandArgument='<%# Eval("AppointmentID") %>' />
                <asp:Button ID="CancelButton" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%# Eval("AppointmentID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
          </div>
           </div>
       </div>
            </div>
            <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
            
   </form>
</body>
</html>
