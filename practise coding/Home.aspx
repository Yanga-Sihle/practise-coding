<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="practise_coding.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home-Ayfa Care</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container rounded shadow" style="background-color:khaki">
    

                <div class="container rounded shadow" style="background-color:khaki">
     <div class="text-center">
        <h1 class="display-4 fw-bold mb-4" style="color:darkslategrey">Welcome to Ayfa Care</h1>
        <p class="lead mb-5" style="color:darkslategrey">A modern and reliable platform for booking hospital appointments, finding trusted doctors, and managing healthcare online.</p>

        <div class="d-flex justify-content-center gap-3 mb-5">
            <a href="Doctors.aspx" class="btn btn-light btn-lg btn-animated">Register as Doctor</a>
            <a href="Patients.aspx" class="btn btn-outline-light btn-lg btn-animated">Register as Patient</a>
        </div>
    </div>
        <div class="container rounded shadow-lg">

    <div class="category-images row text-center mb-5" style="border-color:crimson" >
        <div class="col-md-4 mb-4">
            <div class="service-card animate-card"  style="border: 4px solid crimson;">
            <img src="images for home page/pexels-laura-james-6098047.jpg" alt="Doctors" class="img-fluid shadow" />
            <h5 class="mt-3 text-dark">Qualified Doctors</h5>
            <p class="text-dark">Connect with certified healthcare professionals ready to assist you.</p>
                </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="service-card animate-card" style="border: 4px solid crimson;">
            <img src="images for home page/pexels-pixabay-40568.jpg" alt="Appointments" class="img-fluid shadow" />
            <h5 class="mt-3">Easy Appointment Booking</h5>
            <p>Book appointments with doctors or hospitals anytime, anywhere.</p>
                </div>
        </div>
        <div class="col-md-4 mb-4" >
            <div class="service-card animate-card" style="border: 4px solid crimson;">
            <img src="images for home page/pexels-jmeyer1220-668298.jpg" alt="Hospitals" class="img-fluid shadow" />
            <h5 class="mt-3">Trusted Hospitals</h5>
            <p>Access to a growing network of verified hospitals and clinics.</p>
                </div>
        </div>
    </div>
            </div>
       
     

    

    <!-- 👤 Login Panel for Returning Users -->
    
        <h2 class="text-center" style="color:darkslategrey">Already have an account?</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="login-panel text-center">
                    <h4 class="text-dark">Sign in to Book Your Appointment</h4>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control my-3" placeholder="Email"></asp:TextBox>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control my-3" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-glow" />
                </div>
            </div>
        </div>
    </div>
        <br />
<br />
        </div>
    

    <section class="container my-5">
  <h2 class="text-center mb-4">How It Works</h2>
  <div class="row text-center">
    <div class="col-md-3">
      <div class="p-4 shadow-sm rounded animate-card">
        <i class="bi bi-person-plus" style="font-size: 2rem; color: teal;"></i>
        <h5 class="mt-3"> 1.) Register</h5>
        <p>Create your account as a doctor or patient.</p>
      </div>
    </div>
    <div class="col-md-3">
      <div class="p-4 shadow-sm rounded animate-card">
        <i class="bi bi-search" style="font-size: 2rem; color: teal;"></i>
        <h5 class="mt-3"> 2.) Find a Doctor</h5>
        <p>Browse specialties and read doctor profiles.</p>
      </div>
    </div>
    <div class="col-md-3">
      <div class="p-4 shadow-sm rounded animate-card">
        <i class="bi bi-calendar-check" style="font-size: 2rem; color: teal;"></i>
        <h5 class="mt-3"> 3.) Book Appointment</h5>
        <p>Select date & time, and confirm your booking.</p>
      </div>
    </div>
    <div class="col-md-3">
      <div class="p-4 shadow-sm rounded animate-card">
        <i class="bi bi-envelope-check" style="font-size: 2rem; color: teal;"></i>
        <h5 class="mt-3"> 4.) Get Confirmation</h5>
        <p>Receive appointment details instantly.</p>
      </div>
    </div>
  </div>
</section>
<section class="container my-5">
  <div class="row text-center">
    <div class="col-md-3">
      <a href="DoctorLogin.aspx" class="text-decoration-none">
        <div class="p-4 shadow rounded animate-card bg-white">
          <i class="bi bi-stethoscope fs-1 text-primary"></i>
          <h6 class="mt-2 text-dark">Doctor Login</h6>
        </div>
      </a>
    </div>
    <div class="col-md-3">
      <a href="PatientLogin.aspx" class="text-decoration-none">
        <div class="p-4 shadow rounded animate-card bg-white">
          <i class="bi bi-person-circle fs-1 text-success"></i>
          <h6 class="mt-2 text-dark">Patient Login</h6>
        </div>
      </a>
    </div>
    <div class="col-md-3">
      <a href="Records.aspx" class="text-decoration-none">
        <div class="p-4 shadow rounded animate-card bg-white">
          <i class="bi bi-file-medical fs-1 text-danger"></i>
          <h6 class="mt-2 text-dark">Medical Records</h6>
        </div>
      </a>
    </div>
    <div class="col-md-3">
      <a href="Locations.aspx" class="text-decoration-none">
        <div class="p-4 shadow rounded animate-card bg-white">
          <i class="bi bi-geo-alt fs-1 text-warning"></i>
          <h6 class="mt-2 text-dark">Our Locations</h6>
        </div>
      </a>
    </div>
  </div>
</section>
<section class="bg-light py-5">
  <div class="container text-center">
    <h4 class="mb-3 text-dark">Stay Updated with Ayfa Care</h4>
    <p class="text-dark">Subscribe for health tips and appointment updates</p>
    <div class="d-flex justify-content-center gap-2 flex-wrap">
      <input type="email" class="form-control w-auto" placeholder="Your email" />
      <button type="submit" class="btn btn-primary">Subscribe</button>
    </div>
  </div>
</section>

    <section class="container my-5">
  <h2 class="text-center mb-4">Frequently Asked Questions</h2>
  <div class="accordion" id="faqAccordion">
    <div class="accordion-item">
      <h2 class="accordion-header" id="faq1">
        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1">
          How do I book an appointment?
        </button>
      </h2>
      <div id="collapse1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
        <div class="accordion-body">
          Register as a patient, find a doctor, and choose your slot — it's quick and easy!
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header" id="faq2">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2">
          Can I cancel or reschedule?
        </button>
      </h2>
      <div id="collapse2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
        <div class="accordion-body">
          Yes! You can manage your appointments through your dashboard anytime.
        </div>
      </div>
    </div>
    <!-- Add more FAQs as needed -->
  </div>
</section>
       


    <script>
    window.addEventListener("scroll", () => {
        document.querySelectorAll(".animate-card").forEach(el => {
            const rect = el.getBoundingClientRect();
            if (rect.top < window.innerHeight - 100) {
                el.classList.add("visible");
            }
        });
    });

    // Trigger on load
    window.dispatchEvent(new Event("scroll"));
    </script>
   
    
</asp:Content>
