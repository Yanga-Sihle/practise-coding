<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DocReg.aspx.cs" Inherits="practise_coding.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {  // <-- FIXED here
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('imgview').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <style>
        .suggestions { /* your style unchanged */ }
        .suggestion-item { /* your style unchanged */ }
    </style>
    <script type="text/javascript">
        async function getSuggestions(query) { /* your Geoapify function unchanged */ }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         

      <br />
        <br />
           
              
<!-- Section Selector -->
<div class="text-center mb-4">
   <asp:RadioButtonList ID="rblSectionType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblSectionType_SelectedIndexChanged" RepeatDirection="Horizontal">
    <asp:ListItem Text="Private" Value="Private" />
    <asp:ListItem Text="Public" Value="Public" />
</asp:RadioButtonList>
</div>

<!-- PRIVATE Section Panel -->
<asp:Panel ID="pnlPrivate" runat="server" Visible="false">
    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h2>Doctor's Registration Form</h2>
                </div>
                <div class="card-body">

                    <asp:CheckBoxList ID="cblpro" runat="server" CssClass="form-check">
                        <asp:ListItem Text="General Practitioner" Value="General Practitioner" />
                        <asp:ListItem Text="Dentist" Value="Dentist" />
                        <asp:ListItem Text="Clinic" Value="Clinic" />
                        <asp:ListItem Text="Gynaecologist" Value="Gynaecologist" />
                        <asp:ListItem Text="Vitality Health Check" Value="Vitality Health Check" />
                        <asp:ListItem Text="Virtual Consult" Value="Virtual Consult" />
                    </asp:CheckBoxList>

                    <label>Name:</label>
                    <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Enter Full Name" runat="server"></asp:TextBox>

                    <label>Hospital:</label>
                    <asp:TextBox ID="txtHospital" CssClass="form-control" placeholder="Enter Hospital" runat="server"></asp:TextBox>

                    <label for="locationTextbox">Address:</label>
                    <asp:TextBox ID="locationTextbox" CssClass="form-control" runat="server" Placeholder="Enter address" AutoCompleteType="Disabled" onkeyup="getSuggestions(this.value)" />
                    <asp:Panel ID="suggestionPanel" runat="server" CssClass="suggestions" Style="display: none;"></asp:Panel>

                    <label>Email Address:</label>
                    <asp:TextBox ID="txtEmailAdd" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>

                    <label>Password:</label>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Enter Password" TextMode="Password" runat="server"></asp:TextBox>

                    <label>Confirm Password:</label>
                    <asp:TextBox ID="txtConfirm" CssClass="form-control" placeholder="Confirm Password" TextMode="Password" runat="server"></asp:TextBox>

                    <label>Contact:</label>
                    <asp:TextBox ID="txtContacts" CssClass="form-control" runat="server"></asp:TextBox>

                    <label>Practice License:</label>
                    <asp:TextBox ID="txtLicense" CssClass="form-control" placeholder="Enter Licence" runat="server"></asp:TextBox>

                    <label>Hospital Name:</label>
                    <asp:TextBox ID="txtHospitalN" CssClass="form-control" placeholder="Enter hospital name" runat="server"></asp:TextBox>
                     <label>Biography:</label>
                      <asp:TextBox ID="TextBoxbiograph" TextMode="MultiLine"  CssClass="form-control" placeholder="Tell us about yourself" runat="server"></asp:TextBox>
                    <label>Upload Document:</label>
                    <asp:FileUpload ID="fulPP" CssClass="form-control" runat="server" onchange="readURL(this);" />
                    <img id="imgview" src="#" alt="Preview" style="margin-top:10px; width:150px; height:150px; display:block;" />

                    <div class="text-center mt-3">
                        <asp:Button ID="btnDocReg" CssClass="btn btn-primary" runat="server" Text="Register" OnClick="btnDocReg_Click1" />
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Panel>

<!-- PUBLIC Section Panel -->
<asp:Panel ID="pnlPublic" runat="server" Visible="false">
    <div class="row mt-4">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-header bg-success text-white">
                    <h3>Public Hospital Registration</h3>
                </div>
                <div class="card-body">
                    <label>Public Hospital/Clinic Name:</label>
                    <asp:TextBox ID="txtPublicHospitalName" CssClass="form-control" placeholder="Enter Public Hospital Name" runat="server" />

                    <label>Province:</label>
                    <asp:TextBox ID="txtProvince" CssClass="form-control" placeholder="Enter Province" runat="server" />

                    <label>Address:</label>
                    <asp:TextBox ID="TextBoxAddress" CssClass="form-control" placeholder="Enter Address" runat="server" />

                    <label>Email:</label>
                    <asp:TextBox ID="txtPublicEmail" CssClass="form-control" placeholder="Enter Email" runat="server" />

                    <label>Telephone:</label>
                    <asp:TextBox ID="txtPublicTelephone" CssClass="form-control" placeholder="Enter Telephone" runat="server" />

                    <label>Departments:</label>
                    <asp:CheckBoxList ID="cblPublicDepartments" runat="server" CssClass="form-check">
                        <asp:ListItem Text="Emergency" Value="Emergency" />
                        <asp:ListItem Text="Outpatient" Value="Outpatient" />
                        <asp:ListItem Text="Maternity" Value="Maternity" />
                        <asp:ListItem Text="Pediatrics" Value="Pediatrics" />
                        <asp:ListItem Text="Surgery" Value="Surgery" />
                        <asp:ListItem Text="General Medicine" Value="General Medicine" />
                    </asp:CheckBoxList>
                    <label>Password:</label>
                    <asp:TextBox ID="txtPublicPassword" CssClass="form-control" TextMode="Password" placeholder="Enter Password" runat="server" />

                    <label>Confirm Password:</label>
                     <asp:TextBox ID="txtPublicConfirmPassword" CssClass="form-control" TextMode="Password" placeholder="Confirm Password" runat="server" />

                    <label>Upload Document:</label>
                    <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                    <img id="imgview1" src="#" alt="Preview" style="margin-top:10px; width:150px; height:150px; display:none;" />

                    <div class="text-center mt-3">
                        <asp:Button ID="btnPublicSubmit" runat="server" Text="Register" CssClass="btn btn-success" OnClick="btnPublicSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Panel>


           
</asp:Content>
