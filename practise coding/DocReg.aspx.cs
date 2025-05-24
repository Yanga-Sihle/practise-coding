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

namespace practise_coding
{
	public partial class WebForm3 : System.Web.UI.Page
	{
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void PublicSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (!FileUpload1.HasFile)
                {
                    Response.Write("<script>alert('Please upload a profile picture.');</script>");
                    return;
                }

                // Save uploaded image to the server
                string uploadFolder = Server.MapPath("~/ImageUploadBase/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }

                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string filePath = Path.Combine(uploadFolder, filename);
                FileUpload1.SaveAs(filePath);

                string dbFilePath = "~/ImageUploadBase/" + filename;

                // Get selected departments (support multiple selections)
                string selectedDepartments = string.Join(",",
                    cblPublicDepartments.Items.Cast<ListItem>()
                    .Where(item => item.Selected)
                    .Select(item => item.Text));

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"
               INSERT INTO PublicHospital 
(Name, Address, Telephone, Email, Department, Picture, Province, Password)
VALUES
(@Name, @Address, @Telephone, @Email, @Department, @Picture, @Province, @Password)
", con);

                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = txtPublicHospitalName.Text.Trim();
                    cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = TextBoxAddress.Text.Trim();
                    cmd.Parameters.Add("@Telephone", SqlDbType.NVarChar).Value = txtPublicTelephone.Text.Trim();
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtPublicEmail.Text.Trim();
                    cmd.Parameters.Add("@Department", SqlDbType.NVarChar).Value = selectedDepartments;
                    cmd.Parameters.Add("@Picture", SqlDbType.NVarChar).Value = dbFilePath;
                    cmd.Parameters.Add("@Province", SqlDbType.NVarChar).Value = txtProvince.Text.Trim();
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = txtPublicPassword.Text.Trim();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Session["PublicEmail"] = txtPublicEmail.Text.Trim();
                        Response.Write("<script>alert('Registration successful!'); window.location='DoctorsLogins.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Registration failed. Please try again.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.ToString().Replace("'", "").Replace("\r", "").Replace("\n", "") + "');</script>");
            }
        }





        protected void DocReg_Click1(object sender, EventArgs e)
        {
            try
            {
                if (!fulPP.HasFile)
                {
                    Response.Write("<script>alert('Please upload a profile picture.');</script>");
                    return;
                }

                string uploadFolder = Server.MapPath("~/ImageUploadBase/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }
                string filename = Path.GetFileName(fulPP.PostedFile.FileName);
                string filePath = uploadFolder + filename;

                // Save the uploaded image to the server
                fulPP.SaveAs(filePath);

                // Prepare the database path
                string dbFilePath = "~/ImageUploadBase/" + filename;

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"
            INSERT INTO Dr_Registration
            (DoctorName, DoctorAddress, DoctorContact, DoctorEmail, LicenceNumber, DoctorSpecialisation, Password, Hospital, Picture)
            VALUES
            (@DoctorName, @DoctorAddress, @DoctorContact, @DoctorEmail, @LicenceNumber, @DoctorSpecialisation, @Password, @Hospital, @Picture)", con);

                    cmd.Parameters.Add("@DoctorName", SqlDbType.NVarChar).Value = txtFullName.Text.Trim();
                    cmd.Parameters.Add("@DoctorAddress", SqlDbType.NVarChar).Value = locationTextbox.Text.Trim();
                    cmd.Parameters.Add("@DoctorContact", SqlDbType.NVarChar).Value = txtContacts.Text.Trim();
                    cmd.Parameters.Add("@DoctorEmail", SqlDbType.NVarChar).Value = txtEmailAdd.Text.Trim();
                    cmd.Parameters.Add("@LicenceNumber", SqlDbType.NVarChar).Value = txtLicense.Text.Trim();
                    cmd.Parameters.Add("@DoctorSpecialisation", SqlDbType.NVarChar).Value = cblpro.SelectedItem.Text;
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = txtPassword.Text.Trim();
                    cmd.Parameters.Add("@Hospital", SqlDbType.NVarChar).Value = txtHospitalN.Text.Trim();
                    cmd.Parameters.Add("@Picture", SqlDbType.NVarChar).Value = dbFilePath;

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Session["DoctorEmail"] = txtEmailAdd.Text.Trim();
                        Response.Write("<script>alert('Registration successful!'); window.location='DoctorProfile.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Registration failed. Please try again.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.ToString().Replace("'", "").Replace("\r", "").Replace("\n", "") + "');</script>");
            }
        }

        protected void SectionType_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Hide both by default
            pnlPrivate.Visible = false;
            pnlPublic.Visible = false;

            // Show the selected one
            if (rblSectionType.SelectedValue == "Private")
            {
                pnlPrivate.Visible = true;
            }
            else if (rblSectionType.SelectedValue == "Public")
            {
                pnlPublic.Visible = true;
            }
        }
    }
    }
