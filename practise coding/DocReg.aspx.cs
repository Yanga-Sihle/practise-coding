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

        protected void btnDocReg_Click(object sender, EventArgs e)
        {
           

        }

        protected void btnDocReg_Click1(object sender, EventArgs e)
        {
            try
            {
                string filepath = "~/imageUploadBase/profile.png";
                string filename = Path.GetFileName(fulPP.PostedFile.FileName);
                fulPP.SaveAs(Server.MapPath("imageUploadBase/" + filename));
                filepath = "~/imageUploadBase/" + filename;



                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand(@"
            INSERT INTO Dr_Registration
            (DoctorName, DoctorAddress, DoctorContact, DoctorEmail, LicenceNumber, DoctorSpecialisation, Password, Hospital, Picture)
            VALUES
            (@DoctorName, @DoctorAddress, @DoctorContact, @DoctorEmail, @LicenceNumber, @DoctorSpecialisation, @Password, @Hospital, @Picture)", con);

                    // Add parameters (note: fix DoctorAddress)
                    cmd.Parameters.AddWithValue("@DoctorName", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@DoctorAddress", locationTextbox .Text.Trim()); // ← FIXED
                    cmd.Parameters.AddWithValue("@DoctorContact", txtContacts.Text.Trim());
                    cmd.Parameters.AddWithValue("@DoctorEmail", txtEmailAdd.Text.Trim());
                    cmd.Parameters.AddWithValue("@LicenceNumber", txtLicense.Text.Trim());
                    cmd.Parameters.AddWithValue("@DoctorSpecialisation", cblpro.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@Hospital", txtHospitalN.Text.Trim());
                    cmd.Parameters.AddWithValue("@Picture", fulPP.FileBytes);

                    // Execute before redirect
                    cmd.ExecuteNonQuery();

                    // Show success message and redirect
                    string username = txtFullName.Text;
                    string script = $"alert('Registration successful! Welcome, {username}.'); window.location='Login.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }
            catch (Exception ex)
            {
                // Clean up error message to avoid JS issues
                string message = ex.Message.Replace("'", "").Replace("\n", "").Replace("\r", "");
                Response.Write("<script>alert('Error: " + message + "');</script>");
            }

        }
    }
    }
