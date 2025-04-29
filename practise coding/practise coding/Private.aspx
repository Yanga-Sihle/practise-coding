<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Private.aspx.cs" Inherits="practise_coding.Private" %>

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
                <h1>AyfaCare</h1>
            </header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">Private Appointments</a>
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
          
          <li class="row-6">
              <input class="form-control me-2" type="search" placeholder="Search location" aria-label="Search"/>
          </li>
            <li>
                <button class="btn btn-outline-primary" type="submit">Search</button>
          </li>
      </ul>
     
         
         
          </div>
     

  </div>
</nav>
        </div>
           < <div>
     <label>Type:</label>
     <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
         <asp:ListItem Text="Dentist" Value="Dentist"></asp:ListItem>
         <asp:ListItem Text="Surgery" Value="Surgery"></asp:ListItem>
         <asp:ListItem Text="Gynaecologist" Value="Gynaecologist"></asp:ListItem>
          <asp:ListItem Text="Vitality Health Check" Value="Vitality Health Check"></asp:ListItem>
          <asp:ListItem Text="Virtual Consult" Value="Virtual Consult"></asp:ListItem>
     </asp:DropDownList>
 </div>
           <br />
           <br />
           <div class="container text-center">
   <div class="card" style="width: 18rem;">
  <asp:Image ID="Image1" runat="server" ImageUrl="~/OIP.jpg" />
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text"></p>
    <a href="Home.aspx" class="btn btn-primary">Check Appointment</a>
  </div>
</div>
      
      
  </div>
           

               

    </form>
</body>
</html>
