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


namespace WebAppAssesmentTool
{
    public partial class login : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            try
            {
                string email = Login1.UserName;
                string password = Login1.Password;
                conn.Open();
                string query = "select * from admin where email = @email and  password = @password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                int userId = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();
                switch (userId)
                {
                    case 0:
                        Login1.FailureText = "Username and/or password is incorrect.";
                        break;
                    default:
                        if (!Roles.RoleExists("admin"))
                        {
                            Roles.CreateRole("admin");
                        }
                    //    Roles.AddUserToRole(Login1.UserName, "admin");
                        FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
                        break;
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
    }
}