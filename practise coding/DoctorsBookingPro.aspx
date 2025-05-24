<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctorsBookingPro.aspx.cs" Inherits="practise_coding.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="row">

    <!-- LEFT COLUMN -->
    <div class="col-md-6">
        <div class="col-md-10 mx-auto">
            <div class="card">
                <div class="card-header bg-info text-white">
                    <h2>Our Doctor</h2>
                </div>
                <div class="card-body">
                    <div class="alert alert-info">
                        <p>Your registration information was successfully transferred using Response.Redirect with Query Strings.</p>
                    </div>

                    <h3 class="text-center">Profile Information</h3>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label>SlotID</label>
                            <asp:TextBox CssClass="form-control" ID="TextBoxID" runat="server" placeholder="Insert Slot ID"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Date (yyyy-MM-dd)</label>
                            <asp:TextBox CssClass="form-control" ID="txtDate" runat="server" placeholder="yyyy-MM-dd"></asp:TextBox>
                            <asp:RegularExpressionValidator 
                                ID="regexDate" 
                                runat="server" 
                                ControlToValidate="txtDate"
                                ErrorMessage="Invalid format. Use yyyy-MM-dd." 
                                ForeColor="Red"
                                ValidationExpression="^(19|20)\d\d-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$"
                                Display="Dynamic" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label>Start Time</label>
                            <asp:TextBox CssClass="form-control" ID="TextBoxstarttime" runat="server" placeholder="e.g. 08:00"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>End Time</label>
                            <asp:TextBox CssClass="form-control" ID="TextBoxEndTime" runat="server" placeholder="e.g. 09:00"></asp:TextBox>
                        </div>
                         <div class="col-md-6">
                            <label>Space Available</label>
                        <asp:TextBox ID="TextBoxSpace" runat="server" CssClass="form-control" placeholder="Yes/No"></asp:TextBox>
                          </div>
                    </div>

                    <div class="mb-3">
                        <label>Status</label>
                        <asp:TextBox CssClass="form-control" ID="TextBoxStatus" runat="server" placeholder="Available/Booked"></asp:TextBox>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                           <asp:Button ID="Button3" runat="server" Text="Insert" OnClick="Button3_Click" />
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-warning btn-block" OnClick="Button1_Click" />
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="Button2" runat="server" Text="Delete" CssClass="btn btn-danger btn-block"  />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- RIGHT COLUMN -->
    <div class="col-md-6">
        <div class="container mt-4">
            <h2 class="mb-4">Welcome, <asp:Label ID="lblDoctorName" runat="server" Text="Dr. Smith"></asp:Label></h2>

            <div class="card mb-4 p-3">
                <h4>Your Profile</h4>
                <p><asp:Label ID="lblDoctorEmail" runat="server" Text="smith@email.com" /></p>
                <p><asp:Label ID="lblDoctorSpecialisation" runat="server" Text="Cardiologist" /></p>
                <p><asp:Label ID="lblHospital" runat="server" Text="General Hospital" /></p>
            </div>

            <div class="card p-3">
                <h4>Available Time Slots</h4>
                <asp:GridView ID="gvTimeSlots" runat="server" CssClass=" table table-striped table-bordered" AutoGenerateColumns="False" OnSelectedIndexChanged="gvTimeSlots_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="SlotID" HeaderText="Slot ID" />
                        <asp:BoundField DataField="SlotDate" HeaderText="Date" />
                        <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                        <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>


</asp:Content>
