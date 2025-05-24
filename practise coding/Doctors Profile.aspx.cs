using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practise_coding
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (PreviousPage != null && PreviousPage is DoctorsLogin )

            {
                DoctorsLogin prevousPage = (DoctorsLogin)PreviousPage;
                TextBox txtFullName = (TextBox)prevousPage.FindControl("txtFullName");
                TextBox txtAddress = (TextBox)prevousPage.FindControl("txtAddress");
                TextBox txtEmailAdd = (TextBox)prevousPage.FindControl("txtEmailAdd");
                FileUpload fulPP = (FileUpload)prevousPage.FindControl("fulPP");
                CheckBoxList cblpro = (CheckBoxList)prevousPage.FindControl("cblpro");
                if (txtFullName != null)
                    lblDocFullName.Text = txtFullName.Text;
                if (txtAddress != null)
                    lblDocAddress.Text = txtAddress.Text;
                if (txtEmailAdd != null)
                    lblDocEmail.Text = txtFullName.Text;
                if (cblpro != null)
                    lblDocProfession.Text = cblpro.Text;
                // Retrieve data from query string
                //if (Context.Items["name"] != null)
                //{
                //    lblDocFullName.Text = Request.QueryString["name"];
                //}
                //if (Request.QueryString["Address"] != null)
                //{
                //    lblDocAddress.Text = Request.QueryString["Address"];
                //}

                //if (Request.QueryString["email"] != null)
                //{
                //    lblDocEmail.Text = Request.QueryString["email"];
                //}

                //if (Request.QueryString["Profession"] != null)
                //{
                //    string ProfessionValue = Request.QueryString["Profession"];
                //    string professionText = GetProfessionText(ProfessionValue);
                //    lblDocProfession.Text = professionText;
                //}

                //if (Session["PROFILE"] != null)
                //{
                //    string imagePath = Session["PROFILE"].ToString();
                //    imgPP.ImageUrl = imagePath;
                //}
            }
        }

        private string GetProfessionText(string professionValue)
        {
            switch (professionValue)
            {
                case "General Practitioner": return "General Practitioner";
                case "Dentist": return "Dentist";
                case "Clinic": return "Clinic";
                case "Gynaecologist": return "Gynaecologist";
                case "Vitality Health Check": return "Vitality Health Check";
                case "Virtual Consult": return "itality Health Check";
                default: return professionValue;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}