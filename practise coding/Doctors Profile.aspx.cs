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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedDoctorID"] != null)
                {
                    int doctorId = Convert.ToInt32(Session["SelectedDoctorID"]);
                    LoadDoctorName(doctorId);
                    LoadTimeSlots(doctorId);
                }
                else
                {
                    Response.Redirect("DoctorList.aspx"); // Or wherever the GridView is
                }
                if (Session["SelectedDoctorID"] != null)
                {
                    string doctorId = Session["SelectedDoctorID"].ToString();
                    LoadDoctorProfile(doctorId);
                }
                else
                {
                    Response.Redirect("DoctorList.aspx");
                }
            }
        }
        private void LoadDoctorProfile(string doctorId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT DoctorName, DoctorAddress, DoctorContact, DoctorEmail, 
                         DoctorSpecialisation, Hospital, Picture 
                         FROM Dr_Registration WHERE DoctorID = @DoctorID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DoctorID", doctorId);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblName.Text = reader["DoctorName"].ToString();
                    lblAddress.Text = reader["DoctorAddress"].ToString();
                    lblContact.Text = reader["DoctorContact"].ToString();
                    lblEmail.Text = reader["DoctorEmail"].ToString();
                    lblSpecialisation.Text = reader["DoctorSpecialisation"].ToString();
                    lblHospital.Text = reader["Hospital"].ToString();

                    // Handle image path (stored as nvarchar)
                    string picturePath = reader["Picture"].ToString();
                    if (!string.IsNullOrEmpty(picturePath))
                    {
                        imgDoctor.ImageUrl = picturePath;
                    }
                    else
                    {
                        imgDoctor.ImageUrl = "~/Pictures/default-doctor.png"; // fallback image
                    }
                }
                else
                {
                    lblName.Text = "Doctor not found.";
                }
            }
        }


        private void LoadDoctorName(int doctorId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT DoctorName FROM Dr_Registration WHERE DoctorID = @DoctorID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DoctorID", doctorId);

                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    Label1.Text = "Dr. " + result.ToString();
                }
            }
        }

        private void LoadTimeSlots(int doctorId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT SlotID, SlotDate, StartTime, EndTime, Status
                 FROM DoctorTimeSlots
                 WHERE DoctorID = @DoctorID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DoctorID", doctorId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                TimeSlotGrid.DataSource = reader;
                TimeSlotGrid.DataBind();
            }

        }


        private string GetProfessionText(string professionValue)
        {
            switch (professionValue)
            {
                case "General Practitioner": return "General Practitioner";
                case "Dentist": return "Dentist";
                case "Clinic": return "Clinic";
                case "Gynaecologist": return "Gynaecologist";
                case "Vitality Health Check": return "Vitality Health Check";
                case "Virtual Consult": return "itality Health Check";
                default: return professionValue;
            }
        }

        protected void TimeSlotGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "BookNow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int slotId = Convert.ToInt32(TimeSlotGrid.DataKeys[rowIndex].Value);

                // Store slot ID in session or pass via query string
                Session["SelectedSlotID"] = slotId;

                // Redirect to booking form page
                Response.Redirect("DoctorsClient.aspx");
            }
        }
        private void SendBookingMessageToDoctor(int doctorId, int slotId)
        {
            string messageText = $"A patient has requested to book time slot #{slotId}. Please review and respond.";
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Messages (DoctorID, MessageText, DateSent) VALUES (@DoctorID, @MessageText, GETDATE())";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DoctorID", doctorId);
                cmd.Parameters.AddWithValue("@MessageText", messageText);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void TimeSlotGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            string doctorId = TimeSlotGrid.SelectedDataKey.Value.ToString();
            Session["SelectedDoctorID"] = doctorId;
            Response.Redirect("Doctors Profile.aspx");
        }
    }
}