<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="practise_coding.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home-Ayfa Care</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-2">
        <div class="jumbotron bg-light p-4">
       <h1 class="display-4">Welcome to AyfaCare Booking </h1>
            <p class="lead"><strong>Empowering communities through connection<strong></strong></strong></p>
            <hr class="my-4">
        </div>
    </div>
    <asp:Button ID="btnRegister" runat="server" Text="Register" PostBackUrl="~/Service.aspx" CssClass=" btn btn-primary btn-lg"  />
     <br />
 <br />
    <div class="row my-4">
        <div class="col-md-4">
    <div class="card" style="width: 18rem;">
        <div class=" card-header bg-primary text-white"> 
             <header>Our Mission </header>
             
        </div>
           <div class="card-body">
               <p> to Build bridges between those who can help and those who need </p>
                 </div>
        </div>
       </div>
        <div class="col-md-4">
         <div class="card" style="width: 22rem;" >
     <div class=" card-header bg-primary text-white"> 
          <header>Howw It Works </header>
        
     </div>
             <div class="card-body">
    <p> we also build the smart thing to our company</p>
</div>
      </div>
    </div>
  <div class="card-body">
  </div>
</div>

 
</asp:Content>
