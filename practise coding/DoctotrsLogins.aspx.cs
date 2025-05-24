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
			
        }
		

       

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Dr_Registration WHERE DoctorEmail= '" + txtDocUsername.Text.Trim() + "' AND Password= '" + txtpassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Welcome Back " + dr.GetValue(1).ToString() + "' ); window.location='DoctorEditPro.aspx';</script>");

                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid Username or Password');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM ClientReg WHERE FullName = '" + txtDocUsername.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@DoctorID", txtDocUsername.Text.Trim());
               

                cmd.ExecuteNonQuery();
                con.Close();

                // Write the success message first
                Response.Write("<script>alert('Sign Up Successful');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                // Ensure redirect happens after script execution
                Response.Redirect("Private.aspx");
            }

        }
    }
}