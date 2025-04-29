<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorsReg.aspx.cs" Inherits="practise_coding.DoctorsLogin" %>

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

      <br />
        <br />
           
              
   <div class="row">
   <div class="col-md-8 mx-auto">
       <div class="card">
           <div class="card-header bg-primary text-white">
               <h2>Doctor's Form</h2>
           </div>
           <div class="card-body">
               <div class="alert alert-info">
                   Please fill out the form below to register for your company.
               </div>
               
   <label><strong>Select Profession:</strong></label>
       <div class="card border border-Primary">
           <hr />
        <asp:CheckBoxList ID="cblpro" runat="server">
            <asp:ListItem Text="General Practitioner" Value=" General Practitioner" Selected="True"></asp:ListItem>
              <asp:ListItem Text="Dentist" Value=" Dentist"  ></asp:ListItem>
             <asp:ListItem Text="Clinic" Value=" Clinic" ></asp:ListItem>
              <asp:ListItem Text="Gynaecologist" Value=" Gynaecologist"  ></asp:ListItem>
              <asp:ListItem Text="Vitality Health Check" Value="Vitality Health Check"  ></asp:ListItem>
               <asp:ListItem Text="Virtual Consult" Value=" Virtual Consult" ></asp:ListItem>
             
        </asp:CheckBoxList>
           </div>
                      <div>   <label>Name:</label>
               <asp:TextBox ID="txtFullName" CssClass=" form-control" placeholder="Enter Full Name" runat="server"></asp:TextBox></div>
               <div class="md-3">
<div>
          <label>Hospital:</label>
          <asp:TextBox ID="txtHospital" CssClass=" form-control" placeholder="Enter Hospital" runat="server"></asp:TextBox>
                        </div>
   <div class="md-3">
   <label>Address</label>
<asp:TextBox ID="txtAddress" CssClass=" form-control" placeholder="Enter Address" runat="server"></asp:TextBox>
   </div>
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
   <label>Contact</label>
<asp:TextBox ID="txtContacts" CssClass=" form-control" runat="server"></asp:TextBox>
   </div>
                   <div>
    <asp:FileUpload ID="fulPP" CssClass="form-control " runat="server" />
       </div>
               <div class="btn text-lg-center">
                   <asp:Button ID="btnDocReg" CssClass=" btn btn-primary" runat="server" Text="Register" PostBackUrl="~/Doctors Profile.aspx" OnClick="btnDocReg_Click"/>
               </div>
                   
     </div>
    </div>
         
           </div>
   </div>
</div>    
            
                 
    </form>
</body>
</html>
