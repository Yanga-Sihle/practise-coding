<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DocReg.aspx.cs" Inherits="practise_coding.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function readURL(input) {
             if (input.file && input.file[0]) {
                 var reader = new FileReader();
                 reader.onload = function (e) {
                     $('#imgview').attr('src', e.target.result);
                 };
                 reader.readAsDataURL(input.files[0]);
             }
         }
    </script>
    <style>
        .suggestions {
            border: 1px solid #ccc;
            background-color: white;
            position: absolute;
            width: 100%;
            max-height: 150px;
            overflow-y: auto;
            z-index: 9999;
        }
        .suggestion-item {
            padding: 8px;
            cursor: pointer;
        }
        .suggestion-item:hover {
            background-color: #eee;
        }
    </style>
    <script type="text/javascript">
        async function getSuggestions(query) {
            const suggestionPanel = document.getElementById("<%= suggestionPanel.ClientID %>");

            if (!query) {
                suggestionPanel.style.display = "none";
                return;
            }

            const apiKey = "a5165c4d6ecf462bbe999477b59e295c";
            const url = `https://api.geoapify.com/v1/geocode/autocomplete?text=${query}&limit=1&apiKey=${apiKey}`;

            try {
                const response = await fetch(url);
                const data = await response.json();

                suggestionPanel.innerHTML = '';

                if (data.features && data.features.length > 0) {
                    const suggestion = data.features[0].properties.formatted;

                    const suggestionItem = document.createElement("div");
                    suggestionItem.className = "suggestion-item";
                    suggestionItem.innerText = suggestion;
                    suggestionItem.onclick = () => {
                        document.getElementById("<%= locationTextbox.ClientID %>").value = suggestion;
                        suggestionPanel.style.display = "none";
                    };

                    suggestionPanel.appendChild(suggestionItem);
                    suggestionPanel.style.display = "block";
                } else {
                    suggestionPanel.style.display = "none";
                }
            } catch (error) {
                console.error("Error fetching location suggestions:", error);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         

      <br />
        <br />
           
              
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

                    <label for="locationTextbox">Address</label>
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

                    <label>Upload Document:</label>
                    <asp:FileUpload ID="fulPP" onchange="readURL(this);" Class="form-control" runat="server" />

                    <div class="text-center mt-3">
                        <asp:Button ID="btnDocReg" CssClass="btn btn-primary" runat="server" Text="Register" OnClick="btnDocReg_Click1" />
                    </div>
                </div>
            </div>
        </div>
    </div>
               

           
</asp:Content>
