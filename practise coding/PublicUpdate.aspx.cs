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
	public partial class WebForm11 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
        private void LoadTimeSlots()
        {
            string hospitalId = Session["HospitalID"]?.ToString();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString()))
            {
                string query = "SELECT SlotID, SlotDate, StartTime, EndTime, Status FROM PublicTimeSlots WHERE HospitalID = @HospitalID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@HospitalID", hospitalId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                TimeSlotGrid.DataSource = dt;
                TimeSlotGrid.DataBind();
            }
        }
        protected void TimeSlotGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int slotId = Convert.ToInt32(e.CommandArgument);
                ViewState["SlotID"] = slotId; // Store for Update/Delete

                string hospitalId = Session["HospitalID"]?.ToString();

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString()))
                {
                    string query = "SELECT * FROM PublicTimeSlots WHERE SlotID = @SlotID AND HospitalID = @HospitalID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@SlotID", slotId);
                    cmd.Parameters.AddWithValue("@HospitalID", hospitalId);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        SlotDateTextBox.Text = Convert.ToDateTime(reader["SlotDate"]).ToString("yyyy-MM-dd");
                        StartTimeTextBox.Text = reader["StartTime"].ToString();
                        EndTimeTextBox.Text = reader["EndTime"].ToString();
                        TextBoxStatus.Text = reader["Status"].ToString();
                    }
                    conn.Close();
                }
            }
        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (ViewState["SlotID"] != null)
            {
                int slotId = (int)ViewState["SlotID"];
                string hospitalId = Session["HospitalID"]?.ToString();

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString()))
                {
                    string query = "DELETE FROM PublicTimeSlots WHERE SlotID = @SlotID AND HospitalID = @HospitalID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@SlotID", slotId);
                    cmd.Parameters.AddWithValue("@HospitalID", hospitalId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    MessageLabel.Text = "Slot deleted successfully.";
                    MessageLabel.Visible = true;
                    LoadTimeSlots();
                }
            }
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (ViewState["SlotID"] != null)
            {
                int slotId = (int)ViewState["SlotID"];
                string hospitalId = Session["HospitalID"]?.ToString();

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString()))
                {
                    string query = @"UPDATE PublicTimeSlots 
                             SET SlotDate = @Date, StartTime = @StartTime, EndTime = @EndTime, Status = @Status
                             WHERE SlotID = @SlotID AND HospitalID = @HospitalID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Date", SlotDateTextBox.Text);
                    cmd.Parameters.AddWithValue("@StartTime", StartTimeTextBox.Text);
                    cmd.Parameters.AddWithValue("@EndTime", EndTimeTextBox.Text);
                    cmd.Parameters.AddWithValue("@Status", TextBoxStatus.Text);
                    cmd.Parameters.AddWithValue("@SlotID", slotId);
                    cmd.Parameters.AddWithValue("@HospitalID", hospitalId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    MessageLabel.Text = "Slot updated successfully.";
                    MessageLabel.Visible = true;
                    LoadTimeSlots();
                }
            }
        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string hospitalId = Session["HospitalID"]?.ToString();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString()))
            {
                string query = "INSERT INTO PublicTimeSlots (HospitalID, SlotDate, StartTime, EndTime, Status) VALUES (@HospitalID, @Date, @StartTime, @EndTime, @Status)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@HospitalID", hospitalId);
                cmd.Parameters.AddWithValue("@Date", SlotDateTextBox.Text);
                cmd.Parameters.AddWithValue("@StartTime", StartTimeTextBox.Text);
                cmd.Parameters.AddWithValue("@EndTime", EndTimeTextBox.Text);
                cmd.Parameters.AddWithValue("@Status", TextBoxStatus.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                MessageLabel.Text = "Time slot added successfully.";
                MessageLabel.Visible = true;
                LoadTimeSlots();
            }
        }
    }
}