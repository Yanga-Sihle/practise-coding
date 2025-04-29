<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ClientBooking.aspx.cs" Inherits="practise_coding.ClientBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DoctorID" DataSourceID="SqlDataSource1" Width="1016px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="DoctorID" HeaderText="DoctorID" InsertVisible="False" ReadOnly="True" SortExpression="DoctorID" />
            <asp:BoundField DataField="DoctorName" HeaderText="DoctorName" SortExpression="DoctorName" />
            <asp:BoundField DataField="DoctorAddress" HeaderText="DoctorAddress" SortExpression="DoctorAddress" />
            <asp:BoundField DataField="DoctorContact" HeaderText="DoctorContact" SortExpression="DoctorContact" />
            <asp:BoundField DataField="DoctorEmail" HeaderText="DoctorEmail" SortExpression="DoctorEmail" />
            <asp:BoundField DataField="LicenceNumber" HeaderText="LicenceNumber" SortExpression="LicenceNumber" />
            <asp:BoundField DataField="DoctorSpecialisation" HeaderText="DoctorSpecialisation" SortExpression="DoctorSpecialisation" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="Hospital" HeaderText="Hospital" SortExpression="Hospital" />
            <asp:BoundField DataField="Picture" HeaderText="Picture" SortExpression="Picture" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image CssClass="image-fluid p-2" ID="Image2"  runat="server" ImageUrl='<%# Eval("Picture") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AyfaCareConnectionString6 %>" ProviderName="<%$ ConnectionStrings:AyfaCareConnectionString6.ProviderName %>" SelectCommand="SELECT * FROM [Dr_Registration]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AyfaCareConnectionString5 %>" SelectCommand="SELECT * FROM [Dr_Registration]"></asp:SqlDataSource>

    </asp:Content>
