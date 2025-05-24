<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookedClients.aspx.cs" Inherits="practise_coding.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-4">Accepted Clients</h2>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:AyfaCareConnectionString9 %>"
    ProviderName="<%$ ConnectionStrings:AyfaCareConnectionString9.ProviderName %>"
    SelectCommand="SELECT [BookingID], [ClientName], [Reasons], [BookingDate], [SlotDate], [SlotStartTime], [SlotEndTime] 
                   FROM [ConfirmedBookings] 
                   WHERE DoctorID = @DoctorID">
    <SelectParameters>
        <asp:SessionParameter Name="DoctorID" SessionField="DoctorID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

    <asp:GridView ID="AcceptedClientsGrid" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" DataKeyNames="BookingID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="BookingID" HeaderText="BookingID" InsertVisible="False" ReadOnly="True" SortExpression="BookingID" />
            <asp:BoundField DataField="ClientName" HeaderText="ClientName" SortExpression="ClientName" />
            <asp:BoundField DataField="Reasons" HeaderText="Reasons" SortExpression="Reasons" />
            <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
            <asp:BoundField DataField="SlotDate" HeaderText="SlotDate" SortExpression="SlotDate" />
            <asp:BoundField DataField="SlotStartTime" HeaderText="SlotStartTime" SortExpression="SlotStartTime" />
            <asp:BoundField DataField="SlotEndTime" HeaderText="SlotEndTime" SortExpression="SlotEndTime" />
        </Columns>
    </asp:GridView>

    <asp:Button ID="btnBack" runat="server" Text="Back to Appointments" PostBackUrl="~/DoctorAppointments.aspx" CssClass="btn btn-secondary mt-3" />
</asp:Content>
