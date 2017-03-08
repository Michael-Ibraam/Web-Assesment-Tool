using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssesmentTool.cp.admins
{
    public partial class add : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Add Admin";
                Boolean b = Roles.IsUserInRole(this.Page.User.Identity.Name, "admin");
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
        }

        protected void Button1_submit_Click(object sender, EventArgs e)
        {
            try
            {
                string first_name = TextBox_first_name.Text.Trim();
                string last_name = TextBox_last_name.Text.Trim();
                string email = TextBox_email.Text.Trim();
                string password = TextBox_password.Text.Trim();
                if (first_name == null || last_name == "" || email == "" || password == "")
                {
                    Response.Write("<script>alert('Incomplete Data ')</script>");
                    return;
                }
                else
                {
                    Boolean email_found = checkEmail(email);
                    if (email_found)
                    {
                        Response.Write("<script>alert('Email already registered ')</script>");
                        return;

                    }else
                    {
                        conn.Open();
                        string query = "INSERT INTO admin (first_name,last_name,email,password) VALUES (@first_name, @last_name,@email,@password)";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@first_name", first_name);
                        cmd.Parameters.AddWithValue("@last_name", last_name);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@password", password);

                        int userId = Convert.ToInt32(cmd.ExecuteNonQuery());
                        if (userId >= 1)
                        {
                            if (!Roles.RoleExists("admin"))
                            {
                                Roles.CreateRole("admin");
                            }
                            Roles.AddUserToRole(email, "admin");
                            TextBox_password.Text = "";
                            TextBox_last_name.Text = "";
                            TextBox_first_name.Text = "";
                            TextBox_email.Text = "";
                            Response.Write("<script>alert('Admin user added successfully')</script>");

                        }
                        else
                        {
                            Response.Write("<script>alert('Error')</script>");

                        }
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

        private Boolean checkEmail(string email)
        {
            try
            {
                conn.Open();
                string query = "select * from admin, applicants where admin.email=@email or applicants.email=@email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                int userId = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();
                if (userId > 0)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                conn.Close();
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);
                return false;

            }
        }
    }
}