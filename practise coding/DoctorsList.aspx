<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctorsList.aspx.cs" Inherits="practise_coding.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="row">
        <div class="col-2">
            <asp:Label ID="lbldocsec" runat="server" Text="Search Doctor"></asp:Label>
            <asp:TextBox ID="txtSearchDoc" CssClass="form control bg bg-outlet-primary" Placeholder="Search doctors" runat="server"></asp:TextBox>
             
        </div>
       
          
        
        <div class="col-2">
              <label>Type:</label>
          <asp:DropDownList ID="DropDownList1" runat="server" >
      <asp:ListItem Text="Dentist" Value="Dentist"></asp:ListItem>
      <asp:ListItem Text="Surgery" Value="Surgery"></asp:ListItem>
      <asp:ListItem Text="Gynaecologist" Value="Gynaecologist"></asp:ListItem>
       <asp:ListItem Text="Vitality Health Check" Value="Vitality Health Check"></asp:ListItem>
       <asp:ListItem Text="Virtual Consult" Value="Virtual Consult"></asp:ListItem>
  </asp:DropDownList>

        </div>
        <hr class="bg-primary"/>

    </div>
    
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                  OnRowCommand="GridView1_RowCommand" 
                  CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" RowHeaderColumn="PersonId">
            <Columns>
            <asp:BoundField DataField="PersonId" HeaderText="Person ID" SortExpression="PersonId" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:TemplateField>
                <ItemTemplate>
                    <!-- Select button to pass the PersonId -->
                    <asp:Button ID="btnSelect" runat="server" CommandName="SelectPerson" 
                                CommandArgument='<%# Eval("PersonId") %>' Text="View Profile" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
  
    <div>
        <div>
        <asp:Button ID="btnSecback" runat="server" Text="Back" PostBackUrl="~/TypeofClinics.aspx" />
            </div>
        <div>
            <div>
          <asp:Button ID="btnsecNext" runat="server" Text="Next" PostBackUrl="~/Doctors Profile.aspx"/>
    </div>
        </div>
    </div>
</asp:Content>
