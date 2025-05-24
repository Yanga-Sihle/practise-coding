<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublicBooking.aspx.cs" Inherits="practise_coding.WebForm10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
                <asp:Label ID="lblSlotInfo" runat="server" CssClass="alert alert-info" /><br />
       <br />
       <br />

<asp:TextBox ID="txtClientName" runat="server" Placeholder="Your Full Name" CssClass="form-control" /><br />
<asp:TextBox ID="txtPhone" runat="server" Placeholder="Phone Number" CssClass="form-control" /><br />
<asp:TextBox ID="txtReason" runat="server" Placeholder="Reason for visit" TextMode="MultiLine" CssClass="form-control" /><br />
       <asp:TextBox ID="txtEmail" runat="server" Placeholder="Enter Email" TextMode="MultiLine" CssClass="form-control" /><br />

<asp:Label ID="lblResult" runat="server" Visible="false" />
        </div>
    </form>
</body>
</html>
