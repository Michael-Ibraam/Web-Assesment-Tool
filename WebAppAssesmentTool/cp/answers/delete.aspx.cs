using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace WebAppAssesmentTool.cp.answers
{
    public partial class delete : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Delete Answer";
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

        protected void RadGrid1_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                GridDataItem item = e.Item as GridDataItem;
                string id = item.GetDataKeyValue("answer_id").ToString();
                string select_correct = "select * from questions where questions.correct_answer = @id ";
                SqlCommand cmd = new SqlCommand(select_correct, conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                int result = Convert.ToInt32(cmd.ExecuteScalar());
                if(result > 0)
                {
                    Response.Write("<script>alert('You can not delete a correct answer for a question')</script>");
                }
                else
                {
                    string delete_query = "delete from answers where answer_id = @id";
                    cmd.CommandText = delete_query;
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Answer deleted successfully')</script>");
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