using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssesmentTool.st
{
    public partial class viewScore : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "View Score";
                Boolean b = Roles.IsUserInRole(this.Page.User.Identity.Name, "applicant");
                if (!this.Page.User.Identity.IsAuthenticated || !b)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
            }
            catch (Exception ex)
            {
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);
            }
            viewPage();
        }

        private void viewPage()
        {
            try
            {
                string query = "select * from applicants where email=@email";
                SqlCommand cmd = new SqlCommand(query,conn);
                cmd.Parameters.AddWithValue("@email",this.User.Identity.Name);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    Label_first_name.Text = reader["first_name"].ToString();
                    Label_last_name.Text = reader["last_name"].ToString();
                    Label_email.Text = reader["email"].ToString();
                    if(reader["test_score"].ToString()== null || reader["test_score"].ToString() == "" )
                    {
                        Label_test_score.Text = "Not taken yet";
                    }
                    else
                    {
                        Label_test_score.Text = reader["test_score"].ToString();
                    }
                    
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                conn.Close();
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);

            }
        }


    }
}