<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Doctors Profile.aspx.cs" Inherits="practise_coding.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
   <div class="col-md-8 mx-auto">
       <div class="card">
           <div class="card-header bg-info text-white">
               <h2>User Profile</h2>
           </div>
           <div class="card-body">
               <div class="alert alert-info">
                   <h4>Data Transfer Successful!</h4>
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
                   <asp:Button ID="btnAccept" runat="server" Text="Submit" PostBackUrl="~/Home.aspx" />
               </div>
               </div>
              </div>
               
              <div class="col-md-8 mx-auto border border-primary">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
    <asp:BoundField DataField="Monday" HeaderText="Monday" />
    <asp:BoundField DataField="Tuesday" HeaderText="Tuesday" />
    <asp:BoundField DataField="Wednesday" HeaderText="Wednesday" />
    <asp:BoundField DataField="Thursday" HeaderText="Thursday" />
    <asp:BoundField DataField="Friday" HeaderText="Friday" />
                <asp:TemplateField>
                    <ItemTemplate>
                <asp:Button ID="btnSelect" runat="server" CommandName="SelectPerson" 
                               CommandArgument='<%# Eval("PersonId") %>' Text="View Profile" />
                        </ItemTemplate>
                    </asp:TemplateField>
</Columns>
       </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
              </div>
             </div>
            </div>
           
           
</asp:Content>
