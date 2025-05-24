<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublicHospital.aspx.cs" Inherits="practise_coding.PublicHospital" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="Scripts/jquery-3.7.1.js"></script>
  <link rel="stylesheet" href="Content/bootstrap.css" />
    <script src="Scripts/jquery-3.7.1.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>


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
            <%-- Header --%>
            <header class="bg-primary text-white text-center py-3">
                <h1>AyfaCare</h1>
            </header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">Private Appointments</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Home.aspx">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Login.aspx">SignIn</a>
        </li>
        <li class="nav-item ">
            <a class="nav-link active" aria-current="page" href="Registerform.aspx">SignUp</a>
            </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>

         <li class="row-6">
             <input class="form-control me-2" type="search" placeholder="Search location" aria-label="Search"/>
         </li>
             <li>
                 <button class="btn btn-outline-primary" type="submit">Search</button>
         </li>
      </ul>


          </div>


  </div>
</nav>
        </div>
            <div class="row">
                <div class="col-md-4">
            <div class=" container col-6 ">
                <asp:CheckBoxList ID="CheckBoxList2" runat="server"></asp:CheckBoxList>

            </div>
            <div class=" container col-6 ">
                 <div class=" card row">
       <label>Type:</label>

                    <div class="card">
                        <div class="row">
                        <div>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"  class="col-md-4 "
                        AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                         <asp:ListItem Text="Dentist" Value="Dentist"></asp:ListItem>
        <asp:ListItem Text="Clinical Department" Value="Clinical Department"></asp:ListItem>
        <asp:ListItem Text="Support Department" Value="Support Department"></asp:ListItem>
         <asp:ListItem Text="Emergency Department" Value="Emergency Department"></asp:ListItem>
         <asp:ListItem Text="Administrative Department" Value="Administrative Department"></asp:ListItem>
                    </asp:RadioButtonList>
                                </div>
                            </div>
                        <div>
                        </div>
                        </div>
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>

</div>

            </div>
        </div>
                <div class="col-md-8">

           <asp:SqlDataSource ID="SqlDataSource2" runat="server"
    ConnectionString="<%$ ConnectionStrings:AyfaCareConnectionString8 %>"
    SelectCommand="SELECT * FROM [PublicHospital] WHERE Department = @Department">
    <SelectParameters>
        <asp:ControlParameter ControlID="RadioButtonList1" Name="Department" PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

            <asp:GridView ID="GridView2" CssClass="table table-striped table-bordered" runat="server"
                AutoGenerateColumns="False" DataKeyNames="HospitalID" DataSourceID="SqlDataSource2"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>

                    <asp:DynamicField DataField="Name" HeaderText="Name" />
                    <asp:TemplateField>
                        <ItemTemplate>
                                                    <div class="container-fluid">
     <div class="row">
         <div class="col-lg-10">
             <div class="row">
                 <div class="col-12">
                 </div>
             </div>
            
             <div class="row">
                 <div class="col-12">
                     <asp:Image ID="Image2" ImageUrl="~/hospital.png" Height="20" Width="20" runat="server" />
                     <asp:Label ID="Label3" runat="server" Text='<%# Eval("Department") %>'></asp:Label>
                 </div>
             </div>
             <div class="row">
                 <div class="col-12">
                     <asp:Image ID="Image4" ImageUrl="~/Pictures/maps-and-flags.png" Height="20" Width="20" runat="server" />
                     <asp:Label ID="Label4" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                 </div>
             </div>
             <div class="row">
                 <div class="col-12">
                     <asp:Image ID="Image5" ImageUrl="~/Pictures/email.png" Height="20" Width="20" runat="server" />
                     <asp:Label ID="Label5" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                 </div>
             </div>
             <div class="row">
                 <div class="col-12">
                     <asp:Image ID="Image6" ImageUrl="~/Pictures/phone.png" Height="20" Width="20" runat="server" />
                     <asp:Label ID="Label6" runat="server" Text='<%# Eval("Telephone") %>'></asp:Label>
                 </div>
             </div>
         </div>
         <div class="col-lg-2">
             <asp:Image CssClass="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Picture") %>' />
         </div>
     </div>
</div>
                        </ItemTemplate>
                         
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

                </div>
                </div>
    </form>
</body>
</html>