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
    <style>
    .transparent-container {
        background: rgba(255, 255, 255, 0.1);
        border: 2px solid #6f42c1;
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border-radius: 12px;
        padding: 30px;
        margin: 2rem auto;
        color: white;
        box-shadow: 0 8px 20px rgba(111, 66, 193, 0.6);
    }

    .btn-purple {
        background-color: #6f42c1;
        border-color: #6f42c1;
        color: white;
    }

    .btn-purple:hover,
    .btn-purple:focus {
        background-color: #5931a9;
        border-color: #5931a9;
        color: white;
        box-shadow: 0 0 10px rgba(111, 66, 193, 0.7);
    }

    .form-label {
        font-weight: bold;
        margin-top: 10px;
    }

    .form-check {
        margin-bottom: 10px;
    }
</style>

    <script type="text/javascript">
        async function getSuggestions(query) { /* your Geoapify function unchanged */ }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         
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
            <div class="transparent-container">
                <h2 class="text-center mb-4">Doctor's Registration Form</h2>

                <asp:CheckBoxList ID="cblpro" runat="server" CssClass="form-check" />

                <label class="form-label">Name:</label>
                <asp:TextBox ID="txtFullName" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Hospital:</label>
                <asp:TextBox ID="txtHospital" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvHospital" runat="server" ControlToValidate="txtHospital" ErrorMessage="Hospital is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Address:</label>
                <asp:TextBox ID="locationTextbox" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="locationTextbox" ErrorMessage="Address is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Email Address:</label>
                <asp:TextBox ID="txtEmailAdd" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmailAdd" ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Password:</label>
                <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Confirm Password:</label>
                <asp:TextBox ID="txtConfirm" CssClass="form-control" TextMode="Password" runat="server" />
                <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ControlToValidate="txtConfirm" ErrorMessage="Confirm your password." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Contact:</label>
                <asp:TextBox ID="txtContacts" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContacts" ErrorMessage="Contact is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Practice License:</label>
                <asp:TextBox ID="txtLicense" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvLicense" runat="server" ControlToValidate="txtLicense" ErrorMessage="License is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Hospital Name:</label>
                <asp:TextBox ID="txtHospitalN" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvHospitalN" runat="server" ControlToValidate="txtHospitalN" ErrorMessage="Hospital Name is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Biography:</label>
                <asp:TextBox ID="TextBoxbiograph" TextMode="MultiLine" CssClass="form-control" runat="server" />

                <label class="form-label">Amount:</label>
                <asp:TextBox ID="TextBoxAM" CssClass="form-control" runat="server" />

                <label class="form-label">Upload Document:</label>
                <asp:FileUpload ID="fulPP" CssClass="form-control" runat="server" />

                <div class="text-center mt-3">
                    <asp:Button ID="btnDocReg" CssClass="btn btn-purple" runat="server" Text="Register" OnClick="btnDocReg_Click1" />
                </div>
            </div>
        </div>
    </div>
</asp:Panel>


<!-- PUBLIC Section Panel -->
<asp:Panel ID="pnlPublic" runat="server" Visible="false">
    <div class="row mt-4">
        <div class="col-md-8 mx-auto">
            <div class="transparent-container">
                <h3 class="text-center mb-4">Public Hospital Registration</h3>

                <label class="form-label">Public Hospital/Clinic Name:</label>
                <asp:TextBox ID="txtPublicHospitalName" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvPubName" runat="server" ControlToValidate="txtPublicHospitalName" ErrorMessage="Hospital name is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Province:</label>
                <asp:TextBox ID="txtProvince" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvProvince" runat="server" ControlToValidate="txtProvince" ErrorMessage="Province is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Address:</label>
                <asp:TextBox ID="TextBoxAddress" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvPubAddress" runat="server" ControlToValidate="TextBoxAddress" ErrorMessage="Address is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Email:</label>
                <asp:TextBox ID="txtPublicEmail" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvPubEmail" runat="server" ControlToValidate="txtPublicEmail" ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Telephone:</label>
                <asp:TextBox ID="txtPublicTelephone" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="rfvPubPhone" runat="server" ControlToValidate="txtPublicTelephone" ErrorMessage="Telephone is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Departments:</label>
                <asp:CheckBoxList ID="cblPublicDepartments" runat="server" CssClass="form-check" />

                <label class="form-label">Password:</label>
                <asp:TextBox ID="txtPublicPassword" CssClass="form-control" TextMode="Password" runat="server" />
                <asp:RequiredFieldValidator ID="rfvPubPass" runat="server" ControlToValidate="txtPublicPassword" ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Confirm Password:</label>
                <asp:TextBox ID="txtPublicConfirmPassword" CssClass="form-control" TextMode="Password" runat="server" />
                <asp:RequiredFieldValidator ID="rfvPubConfirm" runat="server" ControlToValidate="txtPublicConfirmPassword" ErrorMessage="Confirm password." ForeColor="Red" Display="Dynamic" />

                <label class="form-label">Upload Document:</label>
                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />

                <div class="text-center mt-3">
                    <asp:Button ID="btnPublicSubmit" runat="server" Text="Register" CssClass="btn btn-purple" OnClick="btnPublicSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Panel>

           
</asp:Content>
