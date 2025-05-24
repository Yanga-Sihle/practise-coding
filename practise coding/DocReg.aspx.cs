using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Configuration;
using System.IO;
using System.Web.Security;

namespace practise_coding
{
	public partial class WebForm3 : System.Web.UI.Page
	{
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                pnlPrivate.Visible = false;
                pnlPublic.Visible = false;
            }
        }

        protected void rblSectionType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblSectionType.SelectedValue == "Private")
            {
                pnlPrivate.Visible = true;
                pnlPublic.Visible = false;
            }
            else if (rblSectionType.SelectedValue == "Public")
            {
                pnlPrivate.Visible = false;
                pnlPublic.Visible = true;
            }
        }

        protected void btnDocReg_Click1(object sender, EventArgs e)
        {
            if (!fulPP.HasFile)
            {
                Response.Write("<script>alert('Please upload a profile picture.');</script>");
                return;
            }

            string filePath = SaveFile(fulPP);
            string dbFilePath = "~/ImageUploadBase/" + Path.GetFileName(filePath);

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Dr_Registration (DoctorName, DoctorAddress, DoctorContact, DoctorEmail, LicenceNumber, DoctorSpecialisation, Password, Hospital, Picture, Biography, Price) VALUES (@DoctorName, @DoctorAddress, @DoctorContact, @DoctorEmail, @LicenceNumber, @DoctorSpecialisation, @Password, @Hospital, @Picture, @Biography, @Price)", con);

                cmd.Parameters.AddWithValue("@DoctorName", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@DoctorAddress", locationTextbox.Text.Trim());
                cmd.Parameters.AddWithValue("@DoctorContact", txtContacts.Text.Trim());
                cmd.Parameters.AddWithValue("@DoctorEmail", txtEmailAdd.Text.Trim());
                cmd.Parameters.AddWithValue("@LicenceNumber", txtLicense.Text.Trim());
                cmd.Parameters.AddWithValue("@DoctorSpecialisation", cblpro.SelectedItem?.Text ?? "");
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Hospital", txtHospitalN.Text.Trim());
                cmd.Parameters.AddWithValue("@Picture", dbFilePath);
                cmd.Parameters.AddWithValue("@Biography", TextBoxbiograph.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", TextBoxAM.Text.Trim());

                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    Response.Write("<script>alert('Private doctor registration successful.'); window.location='DoctorEditPro.aspx';</script>");
                }
            }
        }

        protected void btnPublicSubmit_Click(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFile)
            {
                Response.Write("<script>alert('Please upload a document.');</script>");
                return;
            }

            string filePath = SaveFile(FileUpload1);
            string dbFilePath = "~/ImageUploadBase/" + Path.GetFileName(filePath);

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO PublicHospital (HospitalName, Province, Address, Email, Telephone, Departments, Password, Picture) VALUES (@HospitalName, @Province, @Address, @Email, @Telephone, @Departments, @Password, @Picture)", con);

                cmd.Parameters.AddWithValue("@HospitalName", txtPublicHospitalName.Text.Trim());
                cmd.Parameters.AddWithValue("@Province", txtProvince.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", TextBoxAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtPublicEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Telephone", txtPublicTelephone.Text.Trim());
                cmd.Parameters.AddWithValue("@Departments", string.Join(", ", GetSelectedValues(cblPublicDepartments)));
                cmd.Parameters.AddWithValue("@Password", txtPublicPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Picture", dbFilePath);

                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    Response.Write("<script>alert('Public hospital registration successful.'); window.location='HospitalProfile.aspx';</script>");
                }
            }
        }

        private string SaveFile(FileUpload uploadControl)
        {
            string uploadFolder = Server.MapPath("~/ImageUploadBase/");
            if (!Directory.Exists(uploadFolder))
            {
                Directory.CreateDirectory(uploadFolder);
            }
            string filename = Path.GetFileName(uploadControl.PostedFile.FileName);
            string filePath = Path.Combine(uploadFolder, filename);
            uploadControl.SaveAs(filePath);
            return filePath;
        }

        private string[] GetSelectedValues(System.Web.UI.WebControls.CheckBoxList cbl)
        {
            var selected = new System.Collections.Generic.List<string>();
            foreach (System.Web.UI.WebControls.ListItem item in cbl.Items)
            {
                if (item.Selected)
                    selected.Add(item.Value);
            }
            return selected.ToArray();
        }

    }
}
