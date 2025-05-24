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
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DoctorID"] == null)
                    Response.Redirect("DoctorLogin.aspx");

                LoadDoctorTimeSlots();
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if (Session["DoctorID"] == null) return;

            int doctorId = Convert.ToInt32(Session["DoctorID"]);
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string insertQuery = "INSERT INTO DoctorTimeSlots (DoctorID, SlotDate, StartTime, EndTime, Status) " +
                                     "VALUES (@DoctorID, @SlotDate, @StartTime, @EndTime, @Status)";

                SqlCommand cmd = new SqlCommand(insertQuery, conn);
                cmd.Parameters.AddWithValue("@DoctorID", doctorId);
                cmd.Parameters.AddWithValue("@SlotDate", SlotDateTextBox.Text);
                cmd.Parameters.AddWithValue("@StartTime", StartTimeTextBox.Text);
                cmd.Parameters.AddWithValue("@EndTime", EndTimeTextBox.Text);
                cmd.Parameters.AddWithValue("@Status", TextBoxStatus.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            MessageLabel.Text = "Time slot successfully added.";
            MessageLabel.Visible = true;
            LoadDoctorTimeSlots();
        }

        private void LoadDoctorTimeSlots()
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT SlotID, SlotDate, StartTime, EndTime, Status FROM DoctorTimeSlots WHERE DoctorID = @DoctorID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DoctorID", Session["DoctorID"]);
                con.Open();
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
                int slotID = Convert.ToInt32(e.CommandArgument);
                Session["SelectedSlotID"] = slotID;

                string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "SELECT SlotDate, StartTime, EndTime, Status FROM DoctorTimeSlots WHERE SlotID = @SlotID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@SlotID", slotID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        SlotDateTextBox.Text = Convert.ToDateTime(reader["SlotDate"]).ToString("yyyy-MM-dd");
                        StartTimeTextBox.Text = reader["StartTime"].ToString();
                        EndTimeTextBox.Text = reader["EndTime"].ToString();
                        TextBoxStatus.Text = reader["Status"].ToString();
                    }
                }
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (Session["SelectedSlotID"] == null) return;

            int slotID = Convert.ToInt32(Session["SelectedSlotID"]);
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "UPDATE DoctorTimeSlots SET SlotDate=@SlotDate, StartTime=@StartTime, EndTime=@EndTime, Status=@Status WHERE SlotID=@SlotID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@SlotID", slotID);
                cmd.Parameters.AddWithValue("@SlotDate", SlotDateTextBox.Text);
                cmd.Parameters.AddWithValue("@StartTime", StartTimeTextBox.Text);
                cmd.Parameters.AddWithValue("@EndTime", EndTimeTextBox.Text);
                cmd.Parameters.AddWithValue("@Status", TextBoxStatus.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            MessageLabel.Text = "Time slot updated.";
            MessageLabel.Visible = true;
            LoadDoctorTimeSlots();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (Session["SelectedSlotID"] == null) return;

            int slotID = Convert.ToInt32(Session["SelectedSlotID"]);
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM DoctorTimeSlots WHERE SlotID=@SlotID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@SlotID", slotID);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            MessageLabel.Text = "Time slot deleted.";
            MessageLabel.Visible = true;
            LoadDoctorTimeSlots();
        }

        protected void TimeSlotGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}