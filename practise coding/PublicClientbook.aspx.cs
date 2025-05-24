using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practise_coding
{
	public partial class WebForm12 : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedHospitalID"] != null)
                {
                    int hospitalId = Convert.ToInt32(Session["SelectedHospitalID"]);
                    LoadHospitalName(hospitalId);
                    LoadAvailableSlots(hospitalId);
                }
                else
                {
                    Response.Redirect("DoctorList.aspx"); // Or wherever the GridView is
                }
            }
        }
        private void LoadHospitalName(int hospitalid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Name FROM PublicHospital WHERE HospitalID = @HospitalID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@HospitalID", hospitalid);

                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    Label1.Text = "Dr. " + result.ToString();
                }
            }
        }

        private void LoadAvailableSlots(int hospitalid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT SlotID, SlotDate, StartTime, EndTime, Status FROM PublicTimeSlots WHERE @HospitalID= HospitalID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@HospitalID", hospitalid);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
        }

        protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int slotId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

            // Store slot ID in session or pass via query string
            Session["SelectedSlotID"] = slotId;

            // Redirect to booking form page
            Response.Redirect("DoctorsClient.aspx");
        }
        

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}