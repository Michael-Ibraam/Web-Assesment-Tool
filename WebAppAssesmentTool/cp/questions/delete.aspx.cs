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

namespace WebAppAssesmentTool.cp.questions
{
    public partial class delete : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Delete Question";
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
                string id = item.GetDataKeyValue("question_id").ToString();
                conn.Open();
                string query = "delete from questions where question_id = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                int rows = 0;


                cmd.Parameters.AddWithValue("@id", id);
                rows = cmd.ExecuteNonQuery();

                if (rows >= 1)
                {
                    Response.Write("<script>alert('Question deleted successfully')</script>");

                }
                else
                {
                    Response.Write("<script>alert('Failed to delete')</script>");

                }
            }
            catch (Exception ex)
            {
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);
              
            }
        }
    }
}