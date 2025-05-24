<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublicForm.aspx.cs" Inherits="practise_coding.PublicForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <div class="row">
    <div class="col-md-8">
        <div class="container mt-5">
            <h2 class="mb-4">
                Welcome, 
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </h2>

            <div class="card p-3">
                <h4>Available Time Slots</h4>
                <asp:GridView ID="TimeSlotGrid" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-bordered"
                    DataKeyNames="SlotID" 
                    OnRowCommand="TimeSlotGrid_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="SlotDate" HeaderText="Date" SortExpression="SlotDate" />
                        <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime" />
                        <asp:BoundField DataField="EndTime" HeaderText="End Time" SortExpression="EndTime" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnBook" runat="server" Text="Book Now" CommandName="BookNow"
                                    CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-primary" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:Label ID="lblmessage" runat="server" CssClass="text-success"></asp:Label>
                <asp:Label ID="lblArlet" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </div>
</div>

        </div>
    </form>
</body>
</html>
