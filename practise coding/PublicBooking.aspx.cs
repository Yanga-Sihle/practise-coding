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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedSlotID"] != null)
                {
                    int slotId = Convert.ToInt32(Session["SelectedSlotID"]);
                    LoadSlotDetails(slotId);
                }
                else
                {
                    Response.Redirect("HospitalList.aspx"); // Or your listing page
                }
            }
        }

        private void LoadSlotDetails(int slotId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT SlotDate, StartTime, EndTime FROM PublicTimeSlots WHERE SlotID = @SlotID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@SlotID", slotId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblSlotInfo.Text = $"<strong>Selected Time Slot:</strong> {reader["SlotDate"]} {reader["StartTime"]} - {reader["EndTime"]}";
                }
            }
        }

        protected void ConfirmBooking_Click(object sender, EventArgs e)
        {
            if (Session["SelectedSlotID"] == null)
            {
                lblResult.Text = "Session expired. Please select a time slot again.";
                lblResult.CssClass = "alert alert-danger";
                lblResult.Visible = true;
                return;
            }

            int slotId = Convert.ToInt32(Session["SelectedSlotID"]);
            string name = txtClientName.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string reason = txtReason.Text.Trim();
            string email = txtEmail.Text.Trim();

            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO PublicHospitalAppointments (SlotID, ClientName, Phone, Reason, BookingDate, Email) " +
                               "VALUES (@SlotID, @ClientName, @Phone, @Reason, GETDATE(), @Email)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@SlotID", slotId);
                cmd.Parameters.AddWithValue("@ClientName", name);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Reason", reason);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblResult.Text = "✅ Your appointment has been booked!";
            lblResult.CssClass = "alert alert-success";
            lblResult.Visible = true;
        }
    }
}