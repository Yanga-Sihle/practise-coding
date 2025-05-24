<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PublicUpdate.aspx.cs" Inherits="practise_coding.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
    <h2 class="mb-4">Public Hospital Time Slot Dashboard</h2>
    <div class="row">
        <!-- Left Column: Time Slot Form -->
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-primary text-white">
                    <h4>Enter Time Slot</h4>
                </div>
                <div class="card-body">
                    <asp:Label ID="MessageLabel" runat="server" CssClass="alert alert-info text-center" Visible="false" />
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
                        <asp:Button ID="SubmitButton" runat="server" Text="Add Slot" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
                        <asp:Button ID="UpdateButton" runat="server" Text="Update Slot" CssClass="btn btn-warning" OnClick="UpdateButton_Click" />
                        <asp:Button ID="DeleteButton" runat="server" Text="Delete Slot" CssClass="btn btn-danger" OnClick="DeleteButton_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column: Grid -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-info text-white">
                    <h4>Your Time Slots</h4>
                </div>
                <div class="card-body">
                    <asp:GridView ID="TimeSlotGrid" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-bordered"
                        DataKeyNames="SlotID"
                        OnRowCommand="TimeSlotGrid_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:Button ID="SelectButton" runat="server" Text="Select" CommandName="Select"
                                        CommandArgument='<%# Eval("SlotID") %>' CssClass="btn btn-info btn-sm" />
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

</asp:Content>
