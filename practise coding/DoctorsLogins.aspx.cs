using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;
using System.Configuration;

namespace practise_coding
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            // Handle any necessary page load logic here (if any).
        }

        // Submit the login credentials
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = txtDocUsername.Text.Trim();
            string password = txtpassword.Text.Trim();

            // Manager login
            if (email == "manager@gmail.com" && password == "admin123")
            {
                Session["Role"] = "Manager";
                Response.Redirect("ManagerDash.aspx");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // First, check in Dr_Registration (Private Doctors)
                string queryDoctor = "SELECT DoctorID FROM Dr_Registration WHERE DoctorEmail = @Email AND Password = @Password";
                SqlCommand cmdDoctor = new SqlCommand(queryDoctor, con);
                cmdDoctor.Parameters.AddWithValue("@Email", email);
                cmdDoctor.Parameters.AddWithValue("@Password", password);

                object doctorResult = cmdDoctor.ExecuteScalar();
                if (doctorResult != null)
                {
                    Session["DoctorID"] = Convert.ToInt32(doctorResult);
                    Session["Role"] = "PrivateDoctor";
                    Response.Redirect("DoctorEditPro.aspx");
                    return;
                }

                // Then check in PublicHospital
                string queryPublic = "SELECT HospitalID FROM PublicHospital WHERE Email = @Email AND Password = @Password";
                SqlCommand cmdPublic = new SqlCommand(queryPublic, con);
                cmdPublic.Parameters.AddWithValue("@Email", email);
                cmdPublic.Parameters.AddWithValue("@Password", password);

                object publicResult = cmdPublic.ExecuteScalar();
                if (publicResult != null)
                {
                    Session["HospitalID"] = Convert.ToInt32(publicResult);
                    Session["Role"] = "PublicHospital";
                    Response.Redirect("PublicUpdate.aspx"); // redirect to the time slot page
                    return;
                }

                // If no match
                Response.Write("<script>alert('Invalid email or password');</script>");
            }
        }

        // Delete the doctor based on the username (for the delete functionality)
        protected void Delete_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM Dr_Registration WHERE DoctorEmail = @Email", con);
                cmd.Parameters.AddWithValue("@Email", txtDocUsername.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Doctor successfully deleted');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                Response.Redirect("DoctorEditPro.aspx");
            }
        }

        // Password TextChanged event handler
        protected void TXTPassword_TextChanged(object sender, EventArgs e)
        {
            string password = txtpassword.Text.Trim();

            // You can perform any additional validation or logic here
            if (password.Length < 6)
            {
                Response.Write("<script>alert('Password must be at least 6 characters long');</script>");
            }
            else
            {
                // If password is valid, you can perform other actions
            }
        }

        
    }
}