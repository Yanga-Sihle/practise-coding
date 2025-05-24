<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="practise_coding.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <script src="Scripts/jquery-3.7.1.js"></script>
 <link rel="stylesheet" href="Content/bootstrap.css" />
    <script src="Scripts/jquery-3.7.1.js"></script>
 <link rel="stylesheet" href="Content/bootstrap.css" />
 <link rel="stylesheet" href="datatables/css/dataTables.dataTables.min.css" />
 <script src="datatables/js/dataTables.min.js"></script>
 <link rel="stylesheet" href="Content/bootstrap.min.css" />
<script src="Scripts/jquery-3.7.1.slim.min.js"></script>
  <script src="Scripts/bootstrap.min.js"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
  <style>
      transparent-container {
    background: rgba(255, 255, 255, 0.1); /* Semi-transparent background */
    border: 2px solid #6f42c1; /* Purple border */
    border-radius: 1rem; /* Rounded corners */
    backdrop-filter: blur(10px); /* Background blur effect */
    -webkit-backdrop-filter: blur(10px); /* For Safari */
    padding: 2rem;
    margin: 2rem auto;
    color: white;
    max-width: 800px;
}
body {
    padding-bottom: 100px;
    background: linear-gradient(
        to bottom right,
        #4b4b4b 0%,        /* Space grey start */
        #4b4b4b 60%,       /* 60% space grey */
        rgba(245, 245, 245, 0.8) 80%,  /* Fading white */
        rgba(245, 245, 245, 0.4) 100%  /* Lighter fade at the end */
    );
    color: white;
    min-height: 100vh;
    margin: 0;
    display: flex;
    flex-direction: column;
}
    nav.navbar,
    footer {
      background: linear-gradient(135deg, rgba(40, 28, 45, 0.9), rgba(111, 66, 193, 0.9)); /* Ebony to purple */
      color: white;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
    }

    nav.navbar:hover,
    footer:hover {
      background: linear-gradient(135deg, rgba(40, 28, 45, 1), rgba(111, 66, 193, 1));
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.5);
    }

    nav.navbar a,
    footer a {
      color: white;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    nav.navbar a:hover,
    footer a:hover {
      color: #d1c4e9;
      text-decoration: underline;
    }

    footer {
      padding: 1.5rem 0;
      margin-top: auto;
    }

    .form-control::placeholder {
      color: #ccc;
    }
  </style>
</head>
<body>
    <form id="form1" runat="server">
                      <div>
            <%-- Header --%>
            
                 <nav class="navbar navbar-expand-lg">
   <div class="container">
     <a class="navbar-brand d-flex align-items-center text-white fw-bold" href="#">
       <i class="fas fa-clinic-medical me-2" style="font-size: 1.6rem;"></i>
       AyfaCare
     </a>
     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
       aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>
     <div class="collapse navbar-collapse" id="navbarSupportedContent">
       <ul class="navbar-nav me-auto mb-2 mb-lg-0">
         <li class="nav-item">
           <a class="nav-link active text-white" aria-current="page" href="Home.aspx">Home</a>
         </li>
         <li class="nav-item">
           <a class="nav-link active text-white" aria-current="page" href="Login.aspx">Patient</a>
         </li>
         <li class="nav-item">
           <a class="nav-link active text-white" aria-current="page" href="DoctorsLogins.aspx">Doctors</a>
         </li>
       </ul>
       <div class="row">
         <div class="col-4">
           <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
         </div>
         <div class="col-6">
           <button class="btn btn-outline-light" type="submit">Search</button>
         </div>
       </div>
     </div>
   </div>
 </nav>
  
        
           
           
        </div>

        

       <style>
  /* Transparent container with purple border and blur */
  .transparent-container {
    background: rgba(255, 255, 255, 0.1); /* mostly transparent white */
    border: 2px solid #6f42c1; /* purple border */
    backdrop-filter: blur(10px); /* blur background behind */
    -webkit-backdrop-filter: blur(10px); /* Safari support */
    border-radius: 8px;
    padding: 20px;
    max-width: 400px;
    margin: 2rem auto;
    color: white; /* text color */
     box-shadow: 0 8px 20px rgba(111, 66, 193, 0.6);

  }
  .btn-purple {
  background-color: #6f42c1; /* Purple color */
  border-color: #6f42c1;
  color: white;
}

.btn-purple:hover,
.btn-purple:focus {
  background-color: #5931a9; /* Darker purple on hover */
  border-color: #5931a9;
  color: white;
  box-shadow: 0 0 10px rgba(111, 66, 193, 0.7);
}
</style>

<div class="transparent-container mt-4 text-center py-3">
  <h1>
    <asp:Image ID="Image2" runat="server" ImageUrl="~/user.png" Width="70" />
  </h1>
  <div>
    <label>Username</label>
    <asp:TextBox CssClass="form-control" ID="txtUsername" runat="server" OnTextChanged="txtUsername_TextChanged"></asp:TextBox>
  </div>
  <div>
    <label>Password</label>
    <asp:TextBox CssClass="form-control col-2" ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
  </div>
  <div>
    <label>Don't have an account?</label>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registerform.aspx">Register</asp:HyperLink>
  </div>

  <div>
    <br />
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-purple" OnClick="btnSubmit_Click" />
  </div>
</div>

    </form>
     <footer>
   <div class="container">
     <div class="row">
       <!-- Navigation Links -->
       <div class="col-md-6 mb-3 mb-md-0">
         <ul class="list-inline mb-0">
           <li class="list-inline-item"><a href="ManagerSignIn.aspx" class="text-white text-decoration-none">Management</a></li>
           <li class="list-inline-item"><a href="/about" class="text-white text-decoration-none">About</a></li>
         </ul>
       </div>
       <!-- Social Media Icons -->
       <div class="col-md-6 text-md-end">
         <ul class="list-inline mb-0">
           <li class="list-inline-item">
             <a href="https://facebook.com" target="_blank" class="text-white text-decoration-none">
               <i class="fab fa-facebook fa-lg me-1"></i>Facebook
             </a>
           </li>
           <li class="list-inline-item">
             <a href="https://instagram.com" target="_blank" class="text-white text-decoration-none">
               <i class="fab fa-instagram fa-lg me-1"></i>Instagram
             </a>
           </li>
         </ul>
       </div>
     </div>
     <!-- Copyright -->
     <div class="row mt-3">
       <div class="col text-center">
         <small>&copy; 2025 AyfaCare. All rights reserved.</small>
       </div>
     </div>
   </div>
 </footer>
</body>
</html>
