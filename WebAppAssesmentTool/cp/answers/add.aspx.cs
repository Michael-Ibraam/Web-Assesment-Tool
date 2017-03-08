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

namespace WebAppAssesmentTool.cp.answers
{
    public partial class add : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Add Answer";
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

        protected void RadButton_submit_Click(object sender, EventArgs e)
        {
            try
            {
                string text = RadTextBox_answer_text.Text;
                if (text == null || text == "")
                {
                    Response.Write("<script>alert('Please write an answer ')</script>");
                    return;
                }
                else
                {
                    conn.Open();
                    string query = "INSERT INTO answers (answer_text,question_id) VALUES (@text, @id)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@text", text);
                    cmd.Parameters.AddWithValue("@id", DBNull.Value);
                    int result = Convert.ToInt32(cmd.ExecuteNonQuery());
                    if (result >= 1)
                    {
                        Response.Write("<script>alert('Answer added successfully')</script>");
                        RadTextBox_answer_text.Text = "";
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