<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Public.aspx.cs" Inherits="practise_coding.services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointments</title>
       <script src="Scripts/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="Content/bootstrap.css" />
</head>
<body>
     <%-- navbar --%>
    <form id="form2" runat="server">
        <div>
            <%-- Header --%>
            <header class="bg-primary text-white text-center py-3">
                <h1>AyfaCare</h1>
            </header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">Public Appointments</a>
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
      </ul>
        <div>
         <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
             <button class="btn btn-outline-success" type="submit">Search</button>
            
    </div>
        <div>
            <label>Type:</label>
        </div>
         
        </div>
  </div>
     </nav>
      </div>
                    <div class="row">
                <div class="col-md-4">
            <div class=" container col-6 ">
                 <div class=" card row">
       <label>Type:</label>

</div>

            </div>
        </div>
                <div class="col-md-8">

          <asp:SqlDataSource ID="SqlDataSourcepub" runat="server"
    ConnectionString="<%$ ConnectionStrings:AyfaCareConnectionString8 %>"
    SelectCommand="SELECT * FROM [PublicHospital]">
</asp:SqlDataSource>

<asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"
    AutoGenerateColumns="False" DataSourceID="SqlDataSourcepub"
    OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
    DataKeyNames="HospitalID">  <%-- ADDED DataKeyNames HERE --%>
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnBooks" runat="server" Text="Book" CommandName="Select"
                    CssClass="btn btn-primary" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
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
                                    <asp:Image ID="Image3" ImageUrl="~/gps.png" Height="20" Width="20" runat="server" />
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Province") %>'></asp:Label>
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
            <%--<asp:GridView ID="GridView2" CssClass="table table-striped table-bordered" runat="server"
                AutoGenerateColumns="False" DataKeyNames="HospitalID" DataSourceID="SqlDataSourcepub"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                
            </asp:GridView>--%>

                </div>
                </div>
    
    </form>
</body>
</html>
