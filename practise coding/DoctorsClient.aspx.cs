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
    public partial class WebForm9 : System.Web.UI.Page
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
                    Response.Redirect("DoctorList.aspx");
                }
            }
           
            if (!IsPostBack)
            {
                PaymentSection.Visible = false; // Hide payment section initially
                btnPay.Visible = false; // Hide Pay button initially
                lblResult.Visible = false;
                pnlReason.Visible = true;
            }
        }
        protected void RblBookingFor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblBookingFor.SelectedValue == "self")
            {
                pnlReason.Visible = true;
            }
            else if (rblBookingFor.SelectedValue == "other")
            {
                pnlReason.Visible = false;
            }
        }
        protected void ConfirmBooking_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtClientName.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
               
                Session["SelectedSlotID"] == null)
            {
                lblResult.Text = "Please complete all booking fields and select a time slot.";
                lblResult.CssClass = "alert alert-danger";
                lblResult.Visible = true;
                return;
            }

            // Populate summary table
            lblSummaryName.Text = txtClientName.Text;
            lblSummaryPhone.Text = txtPhone.Text;
            lblSummaryEmail.Text = txtEmail.Text;
            lblSummaryReason.Text = txtReason.Text;
            
           
            // Show the summary panel
            pnlBookingSummary.Visible = true;

            // Show the payment form section
            PaymentSection.Visible = true;
            btnPay.Visible = true;

            // Hide Confirm button
            btnConfirmBooking.Visible = false;

            lblResult.Text = "Please review and complete your payment below.";
            lblResult.CssClass = "alert alert-info";
            lblResult.Visible = true;
        }

        private void LoadSlotDetails(int slotId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT SlotDate, StartTime, EndTime FROM DoctorTimeSlots WHERE SlotID = @SlotID";
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

        protected void BtnPay_Click(object sender, EventArgs e)
        {
            // Validate payment details (you can expand this with actual checks)
            if (Page.IsValid)
            {
                int slotId = Convert.ToInt32(Session["SelectedSlotID"]);
                string name = txtClientName.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string reason = txtReason.Text.Trim();
                string email = txtEmail.Text.Trim();

                string fullName = txtFullName.Text.Trim();
                string cardNumber = txtCardNumber.Text.Trim();
                string expiryMonth = ddlMonth.SelectedValue;
                string expiryYear = ddlYear.SelectedValue;
                string ccv = txtCCV.Text.Trim();
                string paymentMethod = rblPaymentMethod.SelectedValue;

                string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    // Insert into DAppointments
                    string appointmentQuery = @"INSERT INTO DAppointments 
                (SlotID, ClientName, Phone, Reason, BookingDate, Email)
                VALUES 
                (@SlotID, @ClientName, @Phone, @Reason, GETDATE(), @Email)";

                    SqlCommand appointmentCmd = new SqlCommand(appointmentQuery, con);
                    appointmentCmd.Parameters.AddWithValue("@SlotID", slotId);
                    appointmentCmd.Parameters.AddWithValue("@ClientName", name);
                    appointmentCmd.Parameters.AddWithValue("@Phone", phone);
                    appointmentCmd.Parameters.AddWithValue("@Reason", reason);
                    appointmentCmd.Parameters.AddWithValue("@Email", email);
                    appointmentCmd.ExecuteNonQuery();

                    // Insert into PaymentsDetails
                    string paymentQuery = @"INSERT INTO PaymentsDetails 
                (FullNameOnCard, CardNumber, ExpiryMonth, ExpiryYear, CCV, PaymentMethod)
                VALUES 
                (@FullNameOnCard, @CardNumber, @ExpiryMonth, @ExpiryYear, @CCV, @PaymentMethod)";

                    SqlCommand paymentCmd = new SqlCommand(paymentQuery, con);
                    paymentCmd.Parameters.AddWithValue("@FullNameOnCard", fullName);
                    paymentCmd.Parameters.AddWithValue("@CardNumber", cardNumber);
                    paymentCmd.Parameters.AddWithValue("@ExpiryMonth", expiryMonth);
                    paymentCmd.Parameters.AddWithValue("@ExpiryYear", expiryYear);
                    paymentCmd.Parameters.AddWithValue("@CCV", ccv);
                    paymentCmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                    paymentCmd.ExecuteNonQuery();

                    con.Close();
                }

                lblError.Text = "Payment successful and booking saved!";
                lblError.ForeColor = System.Drawing.Color.Green;

                // Hide payment section if needed
                PaymentSection.Visible = false;
            }
            else
            {
                lblError.Text = "Please fill in all required payment fields.";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }


        private void SaveBooking()
        {
            // Sample code to save booking
            //string clientName = txtClientName.Text;
            //string phone = txtPhone.Text;
            //string email = txtEmail.Text;
            //string reason = txtReason.Text;

            // Here you would add your SQL code to insert into DAppointments
            // using ADO.NET or Entity Framework depending on your setup
        }

        //protected void ConfirmBooking_Click(object sender, EventArgs e)
        //{
        //    if (Session["SelectedSlotID"] == null)
        //    {
        //        lblResult.Text = "Session expired. Please select a time slot again.";
        //        lblResult.CssClass = "alert alert-danger";
        //        lblResult.Visible = true;
        //        return;
        //    }

        //    int slotId = Convert.ToInt32(Session["SelectedSlotID"]);
        //    string name = txtClientName.Text.Trim();
        //    string phone = txtPhone.Text.Trim();
        //    string reason = txtReason.Text.Trim();
        //    string email = txtEmail.Text.Trim();
        //    string connStr = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString8"].ToString();
        //    using (SqlConnection con = new SqlConnection(connStr))
        //    {
        //        string query = "INSERT INTO DAppointments (SlotID, ClientName, Phone, Reason, BookingDate, Email)\r\nVALUES (@SlotID, @ClientName, @Phone, @Reason, GETDATE(), @Email)";
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        cmd.Parameters.AddWithValue("@SlotID", slotId);
        //        cmd.Parameters.AddWithValue("@ClientName", name);
        //        cmd.Parameters.AddWithValue("@Phone", phone);
        //        cmd.Parameters.AddWithValue("@Reason", reason);
        //        cmd.Parameters.AddWithValue("@Email", email);

        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //    }

        //    lblResult.Text = "✅ Your appointment has been booked!";
        //    lblResult.CssClass = "alert alert-success";
        //    lblResult.Visible = true;


        //    string fullName = txtFullName.Text.Trim();
        //    string cardNumber = txtCardNumber.Text.Trim();
        //    string expiryMonth = ddlMonth.SelectedValue;
        //    string expiryYear = ddlYear.SelectedValue;
        //    string ccv = txtCCV.Text.Trim();
        //    string paymentMethod = rblPaymentMethod.SelectedValue;



        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(connStr))
        //        {
        //            con.Open();

        //            SqlCommand cmd = new SqlCommand(@"
        //            INSERT INTO PaymentsDetails 
        //            (FullNameOnCard, CardNumber, ExpiryMonth, ExpiryYear, CCV, PaymentMethod)
        //            VALUES 
        //            (@FullNameOnCard, @CardNumber, @ExpiryMonth, @ExpiryYear, @CCV, @PaymentMethod)", con);

        //            cmd.Parameters.AddWithValue("@FullNameOnCard", fullName);
        //            cmd.Parameters.AddWithValue("@CardNumber", cardNumber);
        //            cmd.Parameters.AddWithValue("@ExpiryMonth", expiryMonth);
        //            cmd.Parameters.AddWithValue("@ExpiryYear", expiryYear);
        //            cmd.Parameters.AddWithValue("@CCV", ccv);
        //            cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);

        //            cmd.ExecuteNonQuery();
        //        }

        //        lblError.Text = "✅ Payment successfully saved!";
        //        lblError.CssClass = "alert alert-success";
        //    }
        //    catch (Exception ex)
        //    {
        //        lblError.Text = "❌ Error: " + ex.Message;
        //        lblError.CssClass = "alert alert-danger";
        //    }

        //    lblError.Visible = true;
        //}


    }
}