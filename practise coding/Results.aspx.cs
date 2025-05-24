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
	public partial class Results : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DoctorID"] != null)
                {
                    int doctorId = Convert.ToInt32(Session["DoctorID"]);
                    LoadCounts(doctorId);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadCounts(int doctorId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["AyfaCareConnectionString10"].ToString();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Total Bookings from DAppointments
                SqlCommand cmdTotal = new SqlCommand("SELECT COUNT(*) FROM DAppointments WHERE SlotID IN (SELECT SlotID FROM ConfirmedBookings WHERE DoctorID = @DoctorID)", con);
                cmdTotal.Parameters.AddWithValue("@DoctorID", doctorId);
                lblTotalBookings.Text = cmdTotal.ExecuteScalar().ToString();

                // Confirmed Bookings
                SqlCommand cmdConfirmed = new SqlCommand("SELECT COUNT(*) FROM ConfirmedBookings WHERE DoctorID = @DoctorID", con);
                cmdConfirmed.Parameters.AddWithValue("@DoctorID", doctorId);
                lblConfirmedBookings.Text = cmdConfirmed.ExecuteScalar().ToString();

                // Payments (example: sum payment from a Payments table if applicable)
                //SqlCommand cmdPayments = new SqlCommand("SELECT ISNULL(SUM(Amount), 0) FROM Payments WHERE DoctorID = @DoctorID", con);
                //cmdPayments.Parameters.AddWithValue("@DoctorID", doctorId);
                //decimal paymentTotal = Convert.ToDecimal(cmdPayments.ExecuteScalar());
                //lblPayments.Text = "R" + paymentTotal.ToString("N2");

                con.Close();
            }
        }
    }
}