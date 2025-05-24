<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctorsBookingPro.aspx.cs" Inherits="practise_coding.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
   <div class="col-md-8 mx-auto">
       <div class="card">
           <div class="card-header bg-info text-white">
               <h2>Our Doctor</h2>
           </div>
           <div class="card-body">
               <div class="alert alert-info">
                   <p>Your registration information was successfully transferred using Response.Redirect with Query Strings.</p>
               </div>

               <h3 class="text-center">Profile Information</h3>
                   
               
               <div class="table-responsive">
                   <table class="table table-bordered">
                       <tr>
                           <th>Full Name:</th>
                           <td><asp:Label ID="lblDocFullName" runat="server"></asp:Label></td>
                       </tr>
                       <tr>
                           <th> Address:</th>
                           <td><asp:Label ID="lblDocAddress" runat="server"></asp:Label></td>
                       </tr>
                       <tr>
                        <th>Email Address:</th>
                         <td><asp:Label ID="lblDocEmail" runat="server"></asp:Label></td>
                         </tr>
                        <tr>
                           <th>Profession:</th>
                        <td><asp:Label ID="lblDocProfession" runat="server"></asp:Label></td>
                       </tr>
                       <tr>
                           <th>Contact:</th>
                           <td><asp:Label ID="lblDocContact" runat="server"></asp:Label></td>
                       </tr>
                   </table>
               </div>
               <div>
                  <%-- <asp:Button ID="btnAccept" runat="server" Text="Submit" PostBackUrl="~/Home.aspx" />--%>
               </div>
               </div>
              </div>
             </div>
            </div>
           
           
</asp:Content>
