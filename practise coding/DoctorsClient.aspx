<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctorsClient.aspx.cs" Inherits="practise_coding.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type= "text/javascript">
        $(document).ready(function () {


            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
    .bg-purple {
        background-color: #7c3aed; /* Purple */
    }

    .text-black {
        color: black;
    }

    .btn-purple {
        background-color: #7c3aed;
        color: white;
        border: none;
    }

    .btn-purple:hover {
        background-color: #6a21d7;
        color: white;
    }
    .alert-light-purple {
        background-color: #e6dcfa; /* Light purple background */
        color: #4b0082;            /* Darker purple text for contrast */
        border-color: #d3bdf2;     /* Optional: border to match */
        padding: 10px 15px;
        border-radius: 5px;
        font-weight: 500;
    }
</style>

<div class="container">
    <div class="row">
        <!-- Left Column - Booking Form -->
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-purple text-black">
                    <h2>User Profile</h2>
                </div>
                <div class="card-body text-black">
                    <asp:Label ID="lblSlotInfo" runat="server" CssClass="alert-light-purple" /><br /><br />

                    <!-- Booking For Options -->
                    <asp:RadioButtonList ID="rblBookingFor" runat="server" AutoPostBack="true"
                        CssClass="form-check mb-3" OnSelectedIndexChanged="RblBookingFor_SelectedIndexChanged">
                        <asp:ListItem Text="Booking for myself" Value="self" Selected="True" />
                        <asp:ListItem Text="Booking for someone else" Value="other" />
                    </asp:RadioButtonList>

                    <!-- Booking Fields -->
                    <asp:TextBox ID="txtClientName" runat="server" Placeholder="Your Full Name" CssClass="form-control mb-2" />
                    <asp:TextBox ID="txtPhone" runat="server" Placeholder="Phone Number" CssClass="form-control mb-2" />
                    <asp:Panel ID="pnlReason" runat="server">
                        <asp:TextBox ID="txtReason" runat="server" Placeholder="Reason for visit"
                            TextMode="MultiLine" CssClass="form-control mb-2" />
                    </asp:Panel>
                    <asp:TextBox ID="txtEmail" runat="server" Placeholder="Enter Email"
                        CssClass="form-control mb-2" />
                    <br />
                    <div class="text-center my-3">
                        <asp:Label ID="lblResult" runat="server" Visible="false" CssClass="text-success fs-5" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column - Summary & Payment -->
        <div class="col-md-6">
            <!-- Booking Summary -->
            <div class="card mb-4">
                <div class="card-header bg-purple text-black">
                    <h2>Please Confirm Information</h2>
                </div>
                <div class="card-body text-black">
                    <asp:Panel ID="pnlBookingSummary" runat="server" Visible="false" CssClass="table-responsive">
                        <table class="table table-bordered">
                            <tr><th>Client Name</th><td><asp:Label ID="lblSummaryName" runat="server" /></td></tr>
                            <tr><th>Phone</th><td><asp:Label ID="lblSummaryPhone" runat="server" /></td></tr>
                            <tr><th>Email</th><td><asp:Label ID="lblSummaryEmail" runat="server" /></td></tr>
                            <tr><th>Reason</th><td><asp:Label ID="lblSummaryReason" runat="server" /></td></tr>
                        </table>
                    </asp:Panel>
                </div>
            </div>

            <!-- Payment Section -->
            <asp:Panel ID="PaymentSection" runat="server" Visible="false">
                <div class="card">
                    <div class="card-header bg-purple text-black">
                        <h2>Payments</h2>
                    </div>
                    <div class="card-body text-black">
                        <div class="mb-3">
                            <asp:Label ID="lblFullName" runat="server" Text="Full Name on Card:" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblCardNumber" runat="server" Text="Card Number:" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" MaxLength="16" />
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <asp:Label ID="lblExpiryMonth" runat="server" Text="Expiry Month:" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="01" Value="01" />
                                    <asp:ListItem Text="02" Value="02" />
                                    <asp:ListItem Text="03" Value="03" />
                                    <asp:ListItem Text="04" Value="04" />
                                    <asp:ListItem Text="05" Value="05" />
                                    <asp:ListItem Text="06" Value="06" />
                                    <asp:ListItem Text="07" Value="07" />
                                    <asp:ListItem Text="08" Value="08" />
                                    <asp:ListItem Text="09" Value="09" />
                                    <asp:ListItem Text="10" Value="10" />
                                    <asp:ListItem Text="11" Value="11" />
                                    <asp:ListItem Text="12" Value="12" />
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblExpiryYear" runat="server" Text="Expiry Year:" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="2025" Value="2025" />
                                    <asp:ListItem Text="2026" Value="2026" />
                                    <asp:ListItem Text="2027" Value="2027" />
                                    <asp:ListItem Text="2028" Value="2028" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblCCV" runat="server" Text="CCV:" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtCCV" runat="server" CssClass="form-control" MaxLength="4" TextMode="Password" />
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method:" CssClass="form-label"></asp:Label>
                            <asp:RadioButtonList ID="rblPaymentMethod" runat="server" CssClass="form-check">
                                <asp:ListItem Text="Visa" Value="Visa" />
                                <asp:ListItem Text="Mastercard" Value="Mastercard" />
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

    <!-- Bottom Buttons -->
    <div class="text-center mt-4">
        <asp:Button ID="btnConfirmBooking" runat="server" Text="Confirm Booking" OnClick="ConfirmBooking_Click" CssClass="btn btn-purple me-2" />
        <asp:Button ID="btnPay" runat="server" Text="Pay" OnClick="BtnPay_Click" CssClass="btn btn-purple" Width="302px" />
        <asp:Label ID="lblError" runat="server" Text="" CssClass="form-label text-danger ms-3" />
    </div>
</div>


</asp:Content>
