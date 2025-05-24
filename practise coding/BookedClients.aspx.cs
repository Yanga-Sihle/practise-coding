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
	public partial class WebForm14 : System.Web.UI.Page
	{
        public partial class AcceptedClients : System.Web.UI.Page
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

                    // No need to manually bind the GridView since SqlDataSource does it.
                }
            }

          

        }
    }
}