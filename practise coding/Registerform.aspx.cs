using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace practise_coding
{
	public partial class Registerform : System.Web.UI.Page
	{
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnReg_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO ClientReg(FullName, Email, Password, Contacts,DateOfBirth,Gender, Address) values (@FullName, @Email, @Password, @Contacts,@DateOfBirth,@Gender, @Address)", con);
                cmd.Parameters.AddWithValue("@FullName", txtFullName .Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmailAdd .Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword .Text.Trim());
                cmd.Parameters.AddWithValue("@Contacts", txtContacts .Text.Trim());
                cmd.Parameters.AddWithValue("@DateOfBirth", txtdob.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", DropDownListclient .SelectedValue);
                cmd.Parameters.AddWithValue("@Address", txtAddress1.Text.Trim());
       

                string username = txtFullName .Text;


                // Assume registration logic is successful here

                // Redirect with alert
                string script = $"alert('Registration successful! Welcome, {username}.'); window.location='Login.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

                cmd.ExecuteNonQuery();
                con.Close();


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}