<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AppointConfirm.aspx.cs" Inherits="practise_coding.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="card-body">
        <asp:Panel ID="pnlBookingSummary" runat="server" Visible="false" CssClass="table-responsive">
            <table class="table table-bordered">
                <tr>
                    <th>Client Name</th>
                    <td><asp:Label ID="lblSummaryName" runat="server" /></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><asp:Label ID="lblSummaryPhone" runat="server" /></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><asp:Label ID="lblSummaryEmail" runat="server" /></td>
                </tr>
                <tr>
                    <th>Reason</th>
                    <td><asp:Label ID="lblSummaryReason" runat="server" /></td>
                </tr>
            </table>
        </asp:Panel>
    </div>
     <asp:Button ID="btnConfirmBooking" runat="server" Text="Confirm Booking"  CssClass="btn btn-primary me-2" OnClick="BtnConfirmBooking_Click" />

</asp:Content>
