using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practise_coding
{
    public partial class Private : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Book")
            {
                string doctorId = e.CommandArgument.ToString();
                Session["SelectedDoctorID"] = doctorId;
                Response.Redirect("Doctors Profile.aspx");
            }
        }
        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected specialization from the RadioButtonList
            string selectedSpecialization = RadioButtonList1.SelectedItem.Value;

            // Modify the SelectCommand of the SqlDataSource to filter by the selected specialization
            SqlDataSource1.SelectCommand = "SELECT [DoctorID], [DoctorName], [DoctorAddress], [DoctorContact], [DoctorEmail], [LicenceNumber], [DoctorSpecialisation], [Hospital], [Picture] FROM [Dr_Registration] WHERE [DoctorSpecialisation] = @Specialisation";
            SqlDataSource1.SelectParameters.Clear(); // Clear any previous parameters
            SqlDataSource1.SelectParameters.Add("Specialisation", System.Data.DbType.String, selectedSpecialization);

            // Rebind the GridView to the updated SqlDataSource
            ListView1.DataBind();

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}