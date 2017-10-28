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
namespace WebAppAssesmentTool.st
{
    public partial class login : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Boolean isLoggedIn = this.Page.User.Identity.IsAuthenticated;

            if (this.Page.User.Identity.IsAuthenticated)
            {
                form1.Visible = false;
                form2.Visible = true;
                registerBtn.Visible = false;
            }


        }


        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            try
            {
                string email = Login1.UserName;
                string password = Login1.Password;
                if (email != "" || password != "")
                {
                    Boolean admin = checkifAdmin(email, password);
                    Boolean applicant = checkifApplicant(email, password);
                    if (admin)
                    {
                        FormsAuthentication.SetAuthCookie(Login1.UserName, Login1.RememberMeSet);
                        Response.Redirect("/cp/admin_panel.aspx", false);

                    }
                    else
                    {
                        if (applicant)
                        {
                            FormsAuthentication.SetAuthCookie(Login1.UserName, Login1.RememberMeSet);
                            Response.Redirect("/st/info.aspx", false);

                        }
                        else
                        {
                            Login1.FailureText = "Email and/or password is incorrect.";
                        }

                    }


                }
                else
                {
                    Response.Write("<script>alert('Incomplete Data')</script>");

                }

            }
            catch (Exception ex)
            {
                conn.Close();
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);
            }
        }

        private Boolean checkifApplicant(string email, string password)
        {
            try
            {
                conn.Open();
                string query = "select * from APPLICANTS where email = @email and  password = @password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
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

        private Boolean checkifAdmin(string email, string password)
        {
            try
            {

                conn.Open();
                string query = "select * from admin where email = @email and  password = @password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                int userId = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();
                if (userId > 0)
                {
                    if (!Roles.RoleExists("admin"))
                    {
                        Roles.CreateRole("admin");
                    }
                    if (Roles.FindUsersInRole("admin", Login1.UserName).Length <= 0)
                       {
                           
                           Roles.AddUserToRole(Login1.UserName, "admin");
                       }
                    
                    //  Response.Redirect(Login1.UserName,Login1.RememberMeSet);
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