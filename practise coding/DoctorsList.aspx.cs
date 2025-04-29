using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practise_coding
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind GridView with sample data (You can use actual database logic here)
                GridView1.DataSource = GetPeople();
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SelectPerson")
            {
                // Get the PersonId from the CommandArgument (the ID passed in the button click)
                int personId = Convert.ToInt32(e.CommandArgument);

                // You can now use this PersonId to do something, such as redirecting to another page
                // In this case, redirecting to a profile page
                Response.Redirect("Profile.aspx?PersonId=" + personId);
            }
        }
        private object GetPeople()
        {
            // Sample list of people
            return new[]
            {
                new { PersonId = 1, FirstName = "John", LastName = "Doe" },
                new { PersonId = 2, FirstName = "Jane", LastName = "Smith" },
                new { PersonId = 3, FirstName = "Alice", LastName = "Johnson" }
            };
        }
    }
}