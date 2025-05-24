using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practise_coding
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                if (Session["DoctorID"] != null)
                {
                    lblDoctorName.Text = Session["DoctorName"].ToString();
                    lblDoctorEmail.Text = Session["DoctorEmail"].ToString();
                    // You can also fetch specialisation/hospital if not stored in session
                }
                else
                {
                  
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "INSERT INTO DoctorTimeSlots ( SlotDate, StartTime, EndTime, Status, SpaceAvailable) " +
                        "VALUES ( @SlotDate, @StartTime, @EndTime, @Status, @SpaceAvailable)", con);

                    
                    cmd.Parameters.AddWithValue("@SlotDate", txtDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@StartTime", TextBoxstarttime.Text.Trim());
                    cmd.Parameters.AddWithValue("@EndTime", TextBoxEndTime.Text.Trim());
                    cmd.Parameters.AddWithValue("@Status", TextBoxStatus.Text.Trim());
                    cmd.Parameters.AddWithValue("@SpaceAvailable", TextBoxSpace.Text.Trim());

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        Response.Write("<script>alert('Inserted successfully.');</script>");
                        BindGrid(); // refresh GridView
                    }
                    else
                    {
                        Response.Write("<script>alert('Insert failed.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }



        protected void Button1_Click(object sender, EventArgs e) // Update
        {
            try
            {
                if (Session["DoctorID"] == null)
                {
                    Response.Write("<script>alert('Session expired. Please log in again.');</script>");
                    Response.Redirect("DoctotrsLogins.aspx");
                    return;
                }

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                        "UPDATE DoctorTimeSlots SET SlotDate = @SlotDate, StartTime = @StartTime, EndTime = @EndTime, " +
                        "Status = @Status, SpaceAvailable = @SpaceAvailable " +
                        "WHERE SlotID = @SlotID AND DoctorID = @DoctorID", con);

                    cmd.Parameters.AddWithValue("@SlotID", TextBoxID.Text.Trim());
                    cmd.Parameters.AddWithValue("@DoctorID", Session["DoctorID"].ToString());
                    cmd.Parameters.AddWithValue("@SlotDate", txtDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@StartTime", TextBoxstarttime.Text.Trim());
                    cmd.Parameters.AddWithValue("@EndTime", TextBoxEndTime.Text.Trim());
                    cmd.Parameters.AddWithValue("@Status", TextBoxStatus.Text.Trim());
                    cmd.Parameters.AddWithValue("@SpaceAvailable", TextBoxSpace.Text.Trim());

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        Response.Write("<script>alert('Updated successfully.');</script>");
                        BindGrid(); // refresh the GridView
                    }
                    else
                    {
                        Response.Write("<script>alert('Update failed. Make sure the SlotID exists and belongs to you.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }

        }



        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM DoctorTimeSlots", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvTimeSlots.DataSource = dt;
                gvTimeSlots.DataBind();
            }
        }

        protected void gvTimeSlots_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}