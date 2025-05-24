using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Net.NetworkInformation;

namespace practise_coding
{
    public partial class DoctorsProfileUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DoctorID"] == null)
                {
                    Response.Redirect("DoctorLogin.aspx");
                    return;
                }

                LoadDoctorAppointments(); // 👈 Load appointments here
            }
        }
        private void LoadDoctorAppointments()
        {
            if (Session["DoctorID"] == null) return;

            int doctorId = Convert.ToInt32(Session["DoctorID"]);
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT 
                            A.AppointmentID,
                            A.ClientName,
                            A.Phone,
                            A.Reason,
                            A.BookingDate,
                            D.SlotDate,
                            D.StartTime,
                            D.EndTime
                         FROM 
                            DAppointments A
                         JOIN 
                            DoctorTimeSlots D ON A.SlotID = D.SlotID
                         WHERE 
                            D.DoctorID = @DoctorID
                         ORDER BY 
                            A.BookingDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);

                // ✅ This line is essential!
                cmd.Parameters.AddWithValue("@DoctorID", doctorId);

                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DoctorAppointmentsGrid.DataSource = dt;
                DoctorAppointmentsGrid.DataBind();
            }
        }

        protected void DoctorAppointmentsGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void LoadDoctorMessages()
        {
            int doctorId = Convert.ToInt32(Session["DoctorID"]);
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT m.MessageText, m.DateSent, a.AppointmentID
                         FROM Messages m
                         JOIN DAppointments a ON m.DoctorID = a.DoctorID
                         WHERE m.DoctorID = @DoctorID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DoctorID", doctorId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DoctorAppointmentsGrid.DataSource = reader;
                DoctorAppointmentsGrid.DataBind();
            }
        }


        protected void MessagesGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Accept" || e.CommandName == "Cancel")
            {
                int appointmentId = Convert.ToInt32(e.CommandArgument);
                string newStatus = e.CommandName == "Accept" ? "Accepted" : "Cancelled";

                string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "UPDATE DAppointments SET Status = @Status WHERE AppointmentID = @AppointmentID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Status", newStatus);
                    cmd.Parameters.AddWithValue("@AppointmentID", appointmentId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblStatus.Text = $"✅ Appointment has been {newStatus.ToLower()}.";
                lblStatus.CssClass = "alert alert-info";
                lblStatus.Visible = true;

                LoadDoctorMessages(); // Refresh grid
            }

        }


        protected void DoctorAppointmentsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Accept")
            {
                int appointmentId = Convert.ToInt32(e.CommandArgument);
                string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
                string clientEmail = "", clientName = "", reason = "", bookingDate = "", slotDate = "", startTime = "", endTime = "";

                int doctorId = Convert.ToInt32(Session["DoctorID"]); // 👈 get DoctorID from session

                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

                // Extract values from GridView row (adjust indexes if needed)
                clientName = row.Cells[0].Text;
                reason = row.Cells[1].Text;
                bookingDate = row.Cells[2].Text;
                slotDate = row.Cells[3].Text;
                startTime = row.Cells[4].Text;
                endTime = row.Cells[5].Text;

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    // Step 1: Update the appointment status
                    string updateQuery = "UPDATE DAppointments SET Status = 'Accepted' WHERE AppointmentID = @AppointmentID";
                    SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                    updateCmd.Parameters.AddWithValue("@AppointmentID", appointmentId);
                    updateCmd.ExecuteNonQuery();

                    // Step 2: Insert into ConfirmedBookings including DoctorID
                    string insertQueryConfirmed = @"
                INSERT INTO ConfirmedBookings 
                (ClientName, Reasons, BookingDate, SlotDate, SlotStartTime, SlotEndTime, DoctorID)
                VALUES 
                (@ClientName, @Reason, @BookingDate, @SlotDate, @StartTime, @EndTime, @DoctorID)";

                    SqlCommand insertCmdConfirmed = new SqlCommand(insertQueryConfirmed, con);

                    insertCmdConfirmed.Parameters.AddWithValue("@ClientName", clientName);
                    insertCmdConfirmed.Parameters.AddWithValue("@Reason", reason);
                    insertCmdConfirmed.Parameters.AddWithValue("@BookingDate", Convert.ToDateTime(bookingDate));
                    insertCmdConfirmed.Parameters.AddWithValue("@SlotDate", Convert.ToDateTime(slotDate));
                    insertCmdConfirmed.Parameters.AddWithValue("@StartTime", TimeSpan.Parse(startTime));
                    insertCmdConfirmed.Parameters.AddWithValue("@EndTime", TimeSpan.Parse(endTime));
                    insertCmdConfirmed.Parameters.AddWithValue("@DoctorID", doctorId); // 👈 added doctor ID

                    insertCmdConfirmed.ExecuteNonQuery();

                    // Step 3: Send confirmation email
                    string emailQuery = "SELECT Email FROM DAppointments WHERE AppointmentID = @AppointmentID";
                    SqlCommand emailCmd = new SqlCommand(emailQuery, con);
                    emailCmd.Parameters.AddWithValue("@AppointmentID", appointmentId);
                    clientEmail = (string)emailCmd.ExecuteScalar();
                    SendEmailToClient(clientEmail, clientName);

                    lblStatus.Text = "Appointment accepted and client notified.";
                    lblStatus.CssClass = "alert alert-success";
                    lblStatus.Visible = true;

                    // Step 4: Refresh grid
                    RemoveAppointmentAndRebind(appointmentId);
                }
            }
            else if (e.CommandName == "Cancel")
            {
                int appointmentId = Convert.ToInt32(e.CommandArgument);
                string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    string deleteQuery = "DELETE FROM DAppointments WHERE AppointmentID = @AppointmentID";
                    SqlCommand deleteCommand = new SqlCommand(deleteQuery, con);
                    deleteCommand.Parameters.AddWithValue("@AppointmentID", appointmentId);
                    deleteCommand.ExecuteNonQuery();
                }
                RemoveAppointmentAndRebind(appointmentId);
                lblStatus.Text = "Appointment Canceled.";
                lblStatus.CssClass = "alert alert-warning";
                lblStatus.Visible = true;
            }
        }

        



        private void RemoveAppointmentAndRebind(int appointmentId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                string deleteQuery = "DELETE FROM DAppointments WHERE AppointmentID = @AppointmentID";
                SqlCommand deleteCommand = new SqlCommand(deleteQuery, con);
                deleteCommand.Parameters.AddWithValue("@AppointmentID", appointmentId);
                deleteCommand.ExecuteNonQuery();
            }
            LoadDoctorAppointments(); //reloads the gridview
        }

        protected void DoctorAppointmentsGrid_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (DoctorAppointmentsGrid.SelectedIndex >= 0)
            {
                int appointmentId = (int)DoctorAppointmentsGrid.DataKeys[DoctorAppointmentsGrid.SelectedIndex].Value;
                //  Now you have the ID.  You can use it as needed.
            }
        }





        private void SendEmailToClient(string email, string name)
        {
            try
            {
                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential("your-email@gmail.com", "your-app-password"), // Use Gmail App Password
                    EnableSsl = true,
                };

                var mailMessage = new MailMessage
                {
                    From = new MailAddress("your-email@gmail.com", "AyfaCare"),
                    Subject = "Appointment Accepted",
                    Body = $"Dear {name},\n\nYour appointment has been accepted by the doctor. Please be available at the scheduled time.\n\nKind regards,\nAyfaCare Team",
                    IsBodyHtml = false,
                };

                mailMessage.To.Add(email);
                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                lblStatus.Text = " Error sending email: " + ex.Message;
                lblStatus.CssClass = "alert alert-danger";
                lblStatus.Visible = true;
            }
        }

      
    }

}