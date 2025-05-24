using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practise_coding
{
	public partial class services : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected doctor's ID from DataKey
            string hospitalId = GridView1.SelectedDataKey.Value.ToString();

            // Store it in session and redirect
            Session["SelectedHospitalID"] = hospitalId;
            Response.Redirect("PublicClientbook.aspx");
        }
    }
}