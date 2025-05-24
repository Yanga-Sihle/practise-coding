<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Doctors Profile.aspx.cs" Inherits="practise_coding.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .doctor-profile {
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    max-width: 500px;
    margin: auto;
    text-align: center;
}
    </style>
    <style>
  /* Animated purple border with rounded corners */
  .card-animated-purple-border {
  position: relative;
  border-radius: 15px; /* rounded corners */
  padding: 1.5rem; /* inner padding */
  background: white;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
  overflow: hidden;
  color: black; /* make text black */
}

/* rest remains the same */

.btn-purple {
  background-color: #6f42c1; /* Bootstrap purple */
  color: white;
  border: none;
  transition: background-color 0.3s ease;
}

.btn-purple:hover, .btn-purple:focus {
  background-color: #5a32a3; /* darker purple on hover/focus */
  color: white;
  outline: none;
  box-shadow: 0 0 8px #a684e8;
}

  .card-animated-purple-border::before {
    content: "";
    position: absolute;
    top: -2px; left: -2px; right: -2px; bottom: -2px;
    border-radius: 15px;
    padding: 2px;
    background: linear-gradient(270deg, #8e2de2, #4a00e0, #8e2de2);
    background-size: 600% 600%;
    animation: animatedBorder 8s linear infinite;
    -webkit-mask:
      linear-gradient(#fff 0 0) content-box, 
      linear-gradient(#fff 0 0);
    -webkit-mask-composite: destination-out;
    mask-composite: exclude;
    pointer-events: none;
    z-index: 0;
  }
  .table.table-bordered.table-striped {
  background-color: #f8f9fa;
  color: black;
}

.table.table-bordered.table-striped tbody tr {
  background-color: white;
}

  @keyframes animatedBorder {
    0% {background-position: 0% 50%;}
    50% {background-position: 100% 50%;}
    100% {background-position: 0% 50%;}
  }

  /* Ensure content inside is above the border */
  .card-animated-purple-border > * {
    position: relative;
    z-index: 1;
  }
</style>
 <div class="container mt-4">
  <!-- Doctor Profile Section -->
 <div class="card-animated-purple-border" style="max-width: 800px; margin: auto;">
  <div class="row g-4 align-items-center">
    <div class="col-md-4 text-center">
      <asp:Image ID="imgDoctor" runat="server" CssClass="img-fluid rounded-circle"
                 Style="height: 200px; width: 200px; object-fit: cover;" />
    </div>
    <div class="col-md-8">
      <h2><asp:Label ID="lblName" runat="server" /></h2>
      <p><strong>Specialisation:</strong> <asp:Label ID="lblSpecialisation" runat="server" /></p>
      <p><strong>Hospital:</strong> <asp:Label ID="lblHospital" runat="server" /></p>
      <p><strong>Address:</strong> <asp:Label ID="lblAddress" runat="server" /></p>
      <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
      <p><strong>Contact:</strong> <asp:Label ID="lblContact" runat="server" /></p>
    </div>
  </div>
</div>

  <!-- Welcome Message and Time Slots -->
  <div class="row justify-content-center">
    <div class="col-md-8">
      <h2 class="mb-4">Welcome, <asp:Label ID="Label1" runat="server" /></h2>

      <div class="card p-3 shadow-sm">
        <h4>Available Time Slots</h4>
       <asp:GridView ID="TimeSlotGrid" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
               DataKeyNames="SlotID" OnRowCommand="TimeSlotGrid_RowCommand" OnSelectedIndexChanged="TimeSlotGrid_SelectedIndexChanged">
   <Columns>
     <asp:BoundField DataField="SlotDate" HeaderText="Date" SortExpression="SlotDate" />
     <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime" />
     <asp:BoundField DataField="EndTime" HeaderText="End Time" SortExpression="EndTime" />
     <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
     <asp:TemplateField>
       <ItemTemplate>
         <asp:Button ID="btnBook" runat="server" Text="Book Now" CommandName="BookNow"
                     CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-purple " />
       </ItemTemplate>
     </asp:TemplateField>
   </Columns>
 </asp:GridView>


        <asp:Label ID="lblmessage" runat="server" CssClass="text-success mt-3" />
        <asp:Label ID="lblArlet" runat="server" CssClass="text-danger mt-3" />
      </div>
    </div>
  </div>
</div>

  
       

        


</asp:Content>
