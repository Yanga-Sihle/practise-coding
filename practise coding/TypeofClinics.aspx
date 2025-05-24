<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TypeofClinics.aspx.cs" Inherits="practise_coding.TypeofClinics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Type Of Clinics</title>

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
  </style>
</head>
<body>
      <form id="form2" runat="server">
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
  /* Card border */
  .card-purple-border {
    border: 2px solid #6f42c1 !important;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(111, 66, 193, 0.3);
  }

  /* Card images */
  .card-img-top {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
  }

  /* Purple button style */
  .btn-purple {
    background-color: #6f42c1;
    border-color: #6f42c1;
    color: white;
    transition: background-color 0.3s ease, border-color 0.3s ease;
  }

  /* Purple button hover */
  .btn-purple:hover,
  .btn-purple:focus {
    background-color: #5931a9; /* a darker purple */
    border-color: #5931a9;
    color: #e0d7f7;
  }
</style>

<style>
  /* Transparent card with blur and animated glowing border */
  .card-transparent-animated {
    background: rgba(111, 66, 193, 0.15); /* translucent purple */
    backdrop-filter: blur(8px); /* blur background behind */
    border: 3px solid;
    border-image-slice: 1;
    border-width: 3px;
    border-image-source: linear-gradient(270deg, #6f42c1, #9b59b6, #6f42c1);
    border-radius: 12px;
    position: relative;
    overflow: hidden;
    transition: box-shadow 0.3s ease;
    animation: borderGlow 3s linear infinite;
    box-shadow: 0 0 15px rgba(111, 66, 193, 0.6);
  }

  /* Animated glowing border keyframes */
  @keyframes borderGlow {
    0% {
      border-image-source: linear-gradient(270deg, #6f42c1, #9b59b6, #6f42c1);
      box-shadow: 0 0 10px rgba(111, 66, 193, 0.6);
    }
    50% {
      border-image-source: linear-gradient(270deg, #9b59b6, #6f42c1, #9b59b6);
      box-shadow: 0 0 25px rgba(155, 89, 182, 0.9);
    }
    100% {
      border-image-source: linear-gradient(270deg, #6f42c1, #9b59b6, #6f42c1);
      box-shadow: 0 0 10px rgba(111, 66, 193, 0.6);
    }
  }
  .card.card-transparent-animated {
  border-radius: 30px; /* Rounded corners */
  border: 2px solid purple;
  background: rgba(255, 255, 255, 0.1); /* transparent background */
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
  height:contain;
}

.card.card-transparent-animated img.card-img-top {
  width: 100%;
  height: 200px;
  object-fit: cover;
 
  display: block;
}
.text-white {
  color: white !important;
}

.bg-purple {
  background-color: #281c2d !important; /* Matches footer/nav color */
  color: white !important;
}

.card-transparent-animated {
  background: rgba(255, 255, 255, 0.05);
  border: 2px solid #6f42c1;
  border-radius: 20px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(8px);
}

 
 
  /* Purple button */
  .btn-purple {
    background-color: #6f42c1;
    border-color: #6f42c1;
    color: white;
    transition: background-color 0.3s ease, border-color 0.3s ease;
  }
  .btn-purple:hover,
  .btn-purple:focus {
    background-color: #5931a9;
    border-color: #5931a9;
    color: #e0d7f7;
  }
</style>

<div class="row my-4 container m-4 text-center py-3">
  <div class="col-md-6">
    <div class="card card-transparent-animated text-white" style="width: 18rem;">
      <div class="card-header bg-purple text-white">
        PRIVATE
      </div>
      <img src="/Pictures/Healthcare Humanoid GIF _ GIFDB_com.gif" class="card-img-top" />
      <div class="card-body">
       <h5 class="card-title">Private Doctors</h5>
<p class="card-text">Access expert medical care from certified private doctors offering personalized consultations, flexible scheduling, and premium service tailored to your needs.</p>

        <a href="Private.aspx" class="btn btn-purple">Book Now</a>
      </div>
    </div>
  </div>

  <div class="col-md-6">
    <div class="card card-transparent-animated text-white" style="width: 18rem;">
      <div class="card-header bg-purple text-white">
        PUBLIC
      </div>
      <img src="/Pictures/pexels-chokniti-khongchum-1197604-2280549.jpg" class="card-img-top" />
        <hr class=" bg bg-purple" />
      <div class="card-body">
        <h5 class="card-title">Public Clinics</h5>
<p class="card-text">Receive essential healthcare services at trusted public clinics. Affordable and accessible care for everyone, supported by dedicated medical professionals.</p>

        <a href="Public.aspx" class="btn btn-purple">Book Now</a>
      </div>
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
