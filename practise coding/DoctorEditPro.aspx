<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctorEditPro.aspx.cs" Inherits="practise_coding.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type= "text/javascript">
        $(document).ready(function () {
            
            
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <link rel="stylesheet" href="datatables/css/dataTables.dataTables.min.css" />
    
       <style>
       .sidenav {
    height: 100%;
    width: 20%;
    position: fixed;
    z-index: 1;
    top: 40%;
    left: 0;
    background-color: #1a5aa8;
    overflow-x: hidden;
    transition: 0.5s;
    padding-bottom: 60px;
}

/* The links inside the side navigation */
.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #ffffff;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #ffffff;
}

/* The close button */
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

/* Page content */
#main {
    transition: margin-left .5s;
    padding: 16px;
}
   </style>

   <div>
       <h1>Menu</h1>
        <div id="mySidenav" class="sidenav ">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">My Profile</a>
        <a href="DoctorEditPro.aspx">Availability</a>
        <a href="DoctorsClient.aspx" >Client</a>
        <a href="#">Reports</a>
    </div>

    <!-- Open Button -->
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>

    <!-- Main Content -->
    
        <script src="datatables/js/dataTables.min.js"></script>
       <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <script src="scripts.js"></script>
   </div> 
   <script type="text/javascript">
        // JavaScript function to open the navbar
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
        }

        // JavaScript function to close the navbar
        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
        }
   </script>

        <div class="row">
   <div class="col-md-8 mx-auto">
       <div class="card">
           <div class="card-header bg-info text-white">
               <h2>User Profile</h2>
           </div>
           <div class="card-body">
               <div class="alert alert-info">
                   <h4>My Profile</h4>
                   <p>Your registration information was successfully transferred using Response.Redirect with Query Strings.</p>
               </div>

               <h3 class="text-center">Profile Information</h3>
                   
               
               <div class="table-responsive">
                   <Table class="table table-bordered">
                       <tr>
    <th>ID</th>
    <td><asp:Label ID="Label1" runat="server"></asp:Label></td>
</tr>
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
                   </Table>
               </div>
               <div>
                   <asp:Button ID="btnAccept" runat="server" Text="Submit" PostBackUrl="~/Home.aspx" />
               </div>
               </div>
              </div>
       <div>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AyfaCareConnectionString %>" SelectCommand="SELECT DISTINCT [Id], [Username] FROM [USERSLOGIN]"></asp:SqlDataSource>
       </div>
               
              <div class="col-md-8 mx-auto border border-primary">
                        <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
               <%-- <asp:TemplateField>
                    <ItemTemplate>
                <asp:Button ID="btnSelect" runat="server" CommandName="SelectPerson" 
                               CommandArgument='<%# Eval("PersonId") %>' Text="View Profile" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
</Columns>
       </asp:GridView>
              </div>
             </div>
            </div>
     <div class="card">
    <div class="row">
        <div class="col">
            <asp:TextBox ID="txtdelete" runat="server"></asp:TextBox>
            <asp:Button ID="btndelete" runat="server" Text="Delete" />
        </div>
         <div class="col">
     <asp:TextBox ID="TxtUpdate" runat="server"></asp:TextBox>
     <asp:Button ID="btnUpdate" runat="server" Text="Update" />
 </div>
         <div class="col">
     <asp:TextBox ID="txtEdit" runat="server"></asp:TextBox>
     <asp:Button ID="btnEdit" runat="server" Text="Edit" />
 </div>
    </div>
         </div>
           
</asp:Content>
