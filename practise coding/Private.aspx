<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Private.aspx.cs" Inherits="practise_coding.Private" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <script src="Scripts/jquery-3.7.1.js"></script>
    <script src="Scripts/jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="Content/bootstrap.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.dataTables.min.css" />
    <script src="datatables/js/dataTables.min.js"></script>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
   <script src="Scripts/jquery-3.7.1.slim.min.js"></script>
     <script src="Scripts/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>

  <link rel="stylesheet" href="Content/bootstrap.css" />
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
  <style>
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
    .card-animated-purple-border {
    border: 3px solid #6f42c1;
    border-radius: 1rem;
    position: relative;
    overflow: hidden;
    animation: pulse-border 2s infinite;
}
   .btn-purple {
    background-color: #6f42c1; /* Purple */
    color: white;
    border: none;
    border-radius: 5px;
    padding: 8px 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
    display: inline-block;
    text-align: center;
    text-decoration: none;
}

.btn-purple:hover {
    background-color: #5a32a3; /* Darker purple on hover */
}


@keyframes pulse-border {
    0% {
        box-shadow: 0 0 10px #6f42c1;
    }
    50% {
        box-shadow: 0 0 20px #9b59b6;
    }
    100% {
        box-shadow: 0 0 10px #6f42c1;
    }
}

  </style>
    <style>
.card-animated-purple-border {
    background-color: #f5f5f5; /* light grey */
    border: 2px solid #6f42c1; /* purple border */
    border-radius: 12px;
    /* example animated border effect */
    animation: borderGlow 3s infinite alternate;
}

@keyframes borderGlow {
    0% {
        box-shadow: 0 0 5px #6f42c1;
    }
    100% {
        box-shadow: 0 0 20px #a078d9;
    }
}

.btn-purple {
    background-color: #6f42c1;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 8px 16px;
    font-weight: bold;
    cursor: pointer;
    transition: box-shadow 0.3s ease, transform 0.3s ease;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.5);
}
.btn-purple:focus {
    box-shadow: 0 0 20px rgba(111, 66, 193, 0.8);
    outline: none;
}
.card-border-animated-wrapper {
    position: relative;
    border-radius: 16px;
    padding: 2px; /* Creates space for the animated border */
    background: linear-gradient(45deg, #6f42c1, #a078d9, #6f42c1);
    background-size: 400% 400%;
    animation: borderPulse 6s ease infinite;
}

.card-animated-purple-border {
    background-color: #f5f5f5; /* Light grey */
    border-radius: 14px;
    padding: 1rem;
      color: black !important;
}

@keyframes borderPulse {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}



.btn-purple:hover {
    background-color: #5a32a3;
    box-shadow: 0 0 20px rgba(111, 66, 193, 0.6); /* Purple light glow */
    transform: scale(1.02);

}
</style>
     <script type="text/javascript">
         // JavaScript function to open the navbar
         

         // JavaScript function to close the navbar
         function closeNav() {
             document.getElementById("mySidenav").style.width = "0";
             document.getElementById("main").style.marginLeft = "0";
         }
         function openNav() {
             document.getElementById("mySidenav").style.width = "250px";
             document.getElementById("main").style.marginLeft = "250px";
         }
     </script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Make sure to target the actual GridView table by ID or class
            $("#GridView1").prepend("<thead></thead>").find("thead").append($("#GridView1 tr:first"));
            $("#GridView1").DataTable();
        });
    </script>
</head>
<body>
        <form id="form1" runat="server">
        <div>
          
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
            <br />
            <br />
            <div class="row">
                <div class="col-md-4">
            <div class=" container col-6 ">
                <asp:CheckBoxList ID="CheckBoxList2" runat="server"></asp:CheckBoxList>

            </div>
                   <div class="row">
  <div class="card row col-10 card-animated-purple-border text-black">
    <div class="card-body">
      <h5 class="card-title fw-bold">Search Specialisation</h5>
      <div>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server"
          CssClass="form-check d-flex flex-column gap-2 col-md-4"
          AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
          <asp:ListItem Text="Dentist" Value="Dentist"></asp:ListItem>
          <asp:ListItem Text="Clinic" Value="Clinic"></asp:ListItem>
          <asp:ListItem Text="Gynaecologist" Value="Gynaecologist"></asp:ListItem>
          <asp:ListItem Text="Vitality Health Check" Value="Vitality Health Check"></asp:ListItem>
          <asp:ListItem Text="Virtual Consult" Value="Virtual Consult"></asp:ListItem>
        </asp:RadioButtonList>
      </div>
    </div>
  </div>
</div>

        </div>
                <div class="col-md-8">

           <asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:AyfaCareConnectionString8 %>"
    ProviderName="<%$ ConnectionStrings:AyfaCareConnectionString8.ProviderName %>"
    SelectCommand="SELECT [DoctorID], [DoctorName], [DoctorAddress], [DoctorContact], [DoctorEmail], [LicenceNumber], [DoctorSpecialisation], [Hospital], [Picture] FROM [Dr_Registration]">
</asp:SqlDataSource>

<div class="row">
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
   <ItemTemplate>
    <div class="card-border-animated-wrapper mb-3 w-100 shadow">
        <div class="card-animated-purple-border">
            <div class="d-flex align-items-center justify-content-between">
                <div class="d-flex align-items-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Picture") %>' 
                        CssClass="rounded me-3" Style="width: 120px; height: 120px; object-fit: cover;" />
                    <div>
                        <h5 class="mb-1 fw-bold"><%# Eval("DoctorName") %></h5>
                        <p class="mb-1 fw-bold">
                            <img src="Pictures/stethoscope.png" height="16" />
                            <%# Eval("DoctorSpecialisation") %> &nbsp; | &nbsp;
                            <img src="hospital.png" height="16" />
                            <%# Eval("Hospital") %>
                        </p>
                        <p class="mb-1 fw-bold">
                            <img src="Pictures/maps-and-flags.png" height="16" />
                            <%# Eval("DoctorAddress") %>
                        </p>
                        <p class="mb-0 fw-bold">
                            <img src="Pictures/email.png" height="16" />
                            <%# Eval("DoctorEmail") %> &nbsp;
                            <img src="Pictures/phone.png" height="16" />
                            <%# Eval("DoctorContact") %>
                        </p>
                    </div>
                </div>
                <asp:Button 
    ID="btnSubmit" 
    runat="server" 
    Text="Book Now" 
    CssClass="btn-purple"
    CommandName="Book"
    CommandArgument='<%# Eval("DoctorID") %>' />
            </div>
        </div>
    </div>
</ItemTemplate>

    <LayoutTemplate>
        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
    </LayoutTemplate>
</asp:ListView>


</div>



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