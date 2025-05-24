<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="practise_coding.Results" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container mt-4">
     <div class="alert alert-success">

 
     <h1>Service</h1>
    
         <ul>
             <li><strong>Full Name</strong><asp:Label ID="lblfullname" runat="server" ></asp:Label>  </li>
              <li><strong>Full Name</strong><asp:Label ID="lblEmail" runat="server" ></asp:Label>  </li>
         </ul>
         </div>
        </div>
        <br />
       <br />
      <asp:Button ID="btnSave" runat="server" Text="Save" />
    
    </form>
</body>
</html>
