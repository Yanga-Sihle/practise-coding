<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctotrsLogins.aspx.cs" Inherits="practise_coding.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class=" container mt-4 text-center py-3 border border-primary " >
     
     <h1><asp:Image ID="Image2" runat="server" ImageURL="~/user.png" Width="70" /></h1>
     <div>
         <label >Username</label>
         <asp:TextBox  ID="txtDocUsername" runat="server" ></asp:TextBox>
     </div>
     <div> 
         <label>Password</label>
         <asp:TextBox ID="txtpassword" runat="server" ></asp:TextBox>
     </div>
     <div>
         <label>Dont have account?</label>
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DoctorsReg.aspx.cs" >Register</asp:HyperLink>
     </div>
     
     <div>
         <br />
         <br />
         <asp:Button ID="btnSubmit" runat="server" Text="Submit"  CssClass="btn btn-primary " OnClick="btnSubmit_Click1"   />
         <asp:Button ID="btndelete" runat="server" Text="Delete" Width="89px" OnClick="btndelete_Click" />
     </div>
 </div>
</asp:Content>

       