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
                <asp:Image ID="Image1"  Width="100" height="100" ImageUrl="~/clinic.png" runat="server" />
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
        
        
            
                    
   <div class="row">
   <div class="col-md-8 mx-auto">
       <div class="card">
           <div class="card-header bg-primary text-white">
               <h2>Client Form</h2>
           </div>
           <div class="card-body">
               <div class="alert alert-info">
                   Please fill out the form below to register for our services.
               </div>
  
                      <div>   <label>Name:</label>
               <asp:TextBox ID="txtFullName" CssClass=" form-control" placeholder="Enter Full Name" runat="server"></asp:TextBox></div>
               <div class="md-3">

   
    <div class="md-3">
   <label>Email Address:</label>
<asp:TextBox ID="txtEmailAdd" CssClass=" form-control" placeholder="Email" runat="server"></asp:TextBox>
   </div>
    <div class="md-3">
        <label>Password:</label>
       <asp:TextBox ID="txtPassword" CssClass=" form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
     </div>
       <div class="md-3">
    <label>Confirm Password:</label>
   <asp:TextBox ID="txtConfirm" CssClass=" form-control" placeholder="Confirm Password" runat="server"></asp:TextBox>
 </div>
                         <div class="md-3">
   <label>Address:</label>
  <asp:TextBox ID="txtAddress1" CssClass=" form-control" placeholder="Address" runat="server"></asp:TextBox>
</div>
                      <label>Date Of Birth:</label>
  <asp:TextBox ID="txtdob" CssClass=" form-control" placeholder="DD/MM/YYYY" runat="server"></asp:TextBox>
</div>
   <div class="md-3">
   <label>Contact</label>
<asp:TextBox ID="txtContacts" CssClass=" form-control" runat="server"></asp:TextBox>
   </div>
                   <div>
                       <asp:DropDownList ID="DropDownListclient" runat="server">
                           <asp:ListItem Text=" --Select Gender --" Value="Male" />
                           <asp:ListItem Text="Male " Value="Male" />
                           <asp:ListItem Text="Female " Value="Female" />
                           
                       </asp:DropDownList>
    <asp:FileUpload ID="fulPP" CssClass="form-control " runat="server" />
       </div>
                   <br />
                   <br />
                   <div class="row">
               <div class=" col-4 text-lg-end">
                   <div class="col-md-4">
              <asp:Button ID="btnBack" runat="server" Text="Back" Postbackurl="~/Login.aspx" CssClass="btn btn-primary me-2 "  />
        </div>
               </div>
                   
            <div class="col-md-4 text-center">
            <asp:Button ID="btnReg" runat="server" Text="Next"  CssClass="btn btn-primary me-2 " OnClick="btnReg_Click" Width="73px"  />
              </div>
              </div>

                   
     </div>
    </div>
         
           </div>
   </div>
 
        
        
        
   
    </form>
</body>
</html>
