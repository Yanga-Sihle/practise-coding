<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctorsLogins.aspx.cs" Inherits="practise_coding.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        <h1><asp:Image ID="Image2" runat="server" ImageURL="~/user.png" Width="70" /></h1>
        
        <div>
            <label>Username</label>
            <asp:TextBox ID="txtDocUsername" runat="server" CssClass="form-control" />
        </div>

        <div>
            <label>Password</label>
            <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" OnTextChanged="TXTPassword_TextChanged" AutoPostBack="True" />
        </div>

        <div>
            <label>Don't have an account?</label>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DoctorsReg.aspx">Register</asp:HyperLink>
        </div>

        <div>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-purple" OnClick="Submit_Click1" />
           
        </div>
    </div>
</asp:Content>

       