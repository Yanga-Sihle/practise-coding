using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practise_coding
{
	public partial class PublicHospital : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected doctor's ID from DataKey
            string hospitalid = GridView2.SelectedDataKey.Value.ToString();

            // Store it in session and redirect
            Session["SelectedHospitalID"] = hospitalid;
            Response.Redirect("Doctors Profile.aspx");
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedDepartment = RadioButtonList1.SelectedValue;

            // Update the SqlDataSource query to filter by selected department
            SqlDataSource2.SelectCommand = "SELECT * FROM [PublicHospital] WHERE Department = @Department";
            SqlDataSource2.SelectParameters.Clear();
            SqlDataSource2.SelectParameters.Add("Department", selectedDepartment);

            GridView2.DataBind(); // Refresh GridView to show filtered results
        }
    }
}