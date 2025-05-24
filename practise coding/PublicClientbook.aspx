<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PublicClientbook.aspx.cs" Inherits="practise_coding.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <h2 class="mb-4">Welcome, <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2>

            <div class="card shadow p-4">
                <div class="card-header bg-success text-white mb-3">
                    <h4 class="mb-0">Available Public Hospital Time Slots</h4>
                </div>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
    DataKeyNames="SlotID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
    CssClass="table table-bordered">
    
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="SlotDate" HeaderText="Date" />
        <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
        <asp:BoundField DataField="EndTime" HeaderText="End Time" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
    </Columns>
</asp:GridView>

                <asp:Label ID="lblmessage" runat="server" CssClass="text-success" Visible="false" />
                <asp:Label ID="lblAlert" runat="server" CssClass="text-danger" Visible="false" />
            </div>
        </div>
    </div>
</div>
</asp:Content>
