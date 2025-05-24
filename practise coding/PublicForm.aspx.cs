using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practise_coding
{
	public partial class PublicForm : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedHospitalID"] != null)
                {
                    int hospitalId = Convert.ToInt32(Session["SelectedHospitalID"]);
                    LoadHospitalName(hospitalId);
                    LoadTimeSlots(hospitalId);
                }
                else
                {
                    Response.Redirect("HospitalList.aspx"); // Adjust based on where selection happens
                }
            }
        }

        private void LoadHospitalName(int hospitalId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Name FROM PublicHospital WHERE HospitalID = @HospitalID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@HospitalID", hospitalId);

                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    Label1.Text = result.ToString();
                }
            }
        }

        private void LoadTimeSlots(int hospitalId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT SlotID, SlotDate, StartTime, EndTime, Status
                         FROM PublicHospitalTimeSlots
                         WHERE HospitalID = @HospitalID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@HospitalID", hospitalId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                TimeSlotGrid.DataSource = reader;
                TimeSlotGrid.DataBind();
            }
        }

        protected void TimeSlotGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "BookNow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int slotId = Convert.ToInt32(TimeSlotGrid.DataKeys[rowIndex].Value);

                Session["SelectedPublicSlotID"] = slotId;

                // Optional: send alert message to admin or hospital
                SendBookingMessageToHospital(Convert.ToInt32(Session["SelectedHospitalID"]), slotId);

                Response.Redirect("PublicClientBooking.aspx");
            }
        }

        private void SendBookingMessageToHospital(int hospitalId, int slotId)
        {
            string messageText = $"A client has booked time slot #{slotId}. Please confirm.";
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO PublicMessages (HospitalID, MessageText, DateSent) VALUES (@HospitalID, @MessageText, GETDATE())";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@HospitalID", hospitalId);
                cmd.Parameters.AddWithValue("@MessageText", messageText);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

    }
}