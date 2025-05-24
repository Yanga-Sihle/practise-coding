<%@ Page Title="" Language="C#" MasterPageFile="~/Doctorsbg.Master" AutoEventWireup="true" CodeBehind="DoctorEditPro.aspx.cs" Inherits="practise_coding.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type= "text/javascript">
        $(document).ready(function () {
            
            
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
    
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <link rel="stylesheet" href="datatables/css/dataTables.dataTables.min.css" />
   <%-- <style>
    body {
        background-image: url("/Pictures/Healthcare Humanoid GIF _ GIFDB_com.gif");
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        margin: 0;
        padding: 0;
    }

    .main-content {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 10px;
        border-radius: 5px;
        margin: 20px;
    }

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

    .sidenav .closebtn {
        position: absolute;
        top: 0;
        right: 25px;
        font-size: 36px;
        margin-left: 50px;
    }

    #main {
        transition: margin-left .5s;
        padding: 16px;
    }

    .bg-light-gray {
        background-color: #f0f0f0;
        color: #000000;
    }
</style>--%>


 <%-- <div>
    <h1>Menu</h1>
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">My Profile</a>
        <a href="DoctorEditPro.aspx">Availability</a>
        <a href="DoctorsProfileUpdate.aspx">Client</a>
        <a href="BookedClients.aspx">Accepted Clients</a>
        <a href="#">Reports</a>
    </div>
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>--%>

  <%--  <script type="text/javascript">
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
        }
    </script>
</div>--%>

<!-- Main Content -->
<div class="container mt-5">
    <h2 class="mb-4">Doctor's Time Slot Dashboard</h2>
    <div class="row">
        <!-- Time Slot Form -->
        <div class="col-md-6">
            <div class="card mb-4 animated-purple-border">
                <div class="card-header bg-light-gray">
                    <h4>Enter Time Slot</h4>
                </div>
                <div class="card-body">
                    <asp:Label ID="MessageLabel" runat="server" CssClass="alert alert-info" Visible="false" />
                    <div class="form-group">
                        <label>Slot Date:</label>
                        <asp:TextBox ID="SlotDateTextBox" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                    <div class="form-group">
                        <label>Start Time:</label>
                        <asp:TextBox ID="StartTimeTextBox" runat="server" CssClass="form-control" TextMode="Time" />
                    </div>
                    <div class="form-group">
                        <label>End Time:</label>
                        <asp:TextBox ID="EndTimeTextBox" runat="server" CssClass="form-control" TextMode="Time" />
                    </div>
                    <div class="form-group">
                        <label>Status:</label>
                        <asp:TextBox ID="TextBoxStatus" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group mt-3">
                        <div class="row text-center">
                            <div class="col-md-4 mb-2">
                                <asp:Button ID="SubmitButton" runat="server" Text="Add Slot" CssClass="btn btn-purple-1 w-100" OnClick="SubmitButton_Click" />
                            </div>
                            <div class="col-md-4 mb-2">
                                <asp:Button ID="UpdateButton" runat="server" Text="Update Slot" CssClass="btn btn-purple-2 w-100" OnClick="UpdateButton_Click" />
                            </div>
                            <div class="col-md-4 mb-2">
                                <asp:Button ID="DeleteButton" runat="server" Text="Delete Slot" CssClass="btn btn-purple-3 w-100" OnClick="DeleteButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Time Slot Grid -->
        <div class="col-md-6">
            <div class="card animated-purple-border">
                <div class="card-header bg-light-gray">
                    <h4>Your Time Slots</h4>
                </div>
                <div class="card-body">
                    <asp:GridView ID="TimeSlotGrid" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-bordered"
                        DataKeyNames="SlotID"
                        OnRowCommand="TimeSlotGrid_RowCommand"
                        OnSelectedIndexChanged="TimeSlotGrid_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:Button ID="SelectButton" runat="server" Text="Select"
                                        CommandName="Select" CommandArgument='<%# Eval("SlotID") %>'
                                        CssClass="btn btn-info btn-sm" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SlotDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                            <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Custom Styles -->
<style>
    .animated-purple-border {
        border: 3px solid transparent;
        border-image: linear-gradient(270deg, #6f42c1, #9b59b6, #b57edc);
        border-image-slice: 1;
        animation: pulse-border 4s linear infinite;
        border-radius: 10px;
    }

    @keyframes pulse-border {
        0% {
            border-image-source: linear-gradient(270deg, #6f42c1, #9b59b6, #b57edc);
        }
        50% {
            border-image-source: linear-gradient(270deg, #b57edc, #9b59b6, #6f42c1);
        }
        100% {
            border-image-source: linear-gradient(270deg, #6f42c1, #9b59b6, #b57edc);
        }
    }

    .btn-purple-1 {
        background-color: #6f42c1;
        color: white;
    }

    .btn-purple-2 {
        background-color: #9b59b6;
        color: white;
    }

    .btn-purple-3 {
        background-color: #b57edc;
        color: white;
    }

    .bg-light-gray {
        background-color: #f8f9fa;
    }
</style>

</asp:Content>
