<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Public.aspx.cs" Inherits="practise_coding.services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointments</title>
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
    <a class="navbar-brand" href="#">Public Appointments</a>
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
        <div>
         <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
             <button class="btn btn-outline-success" type="submit">Search</button>
            
    </div>
        <div>
            <label>Type:</label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Text="Dentist" Value="Dentist"></asp:ListItem>
                <asp:ListItem Text="Surgery" Value="Surgery"></asp:ListItem>
                <asp:ListItem Text="Gynaecologist" Value="Gynaecologist"></asp:ListItem>
                 <asp:ListItem Text="Vitality Health Check" Value="Vitality Health Check"></asp:ListItem>
                 <asp:ListItem Text="Virtual Consult" Value="Virtual Consult"></asp:ListItem>
            </asp:DropDownList>
        </div>
         
        </div>
  </div>
     </nav>
      </div>
    
    </form>
</body>
</html>
