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
namespace WebAppAssesmentTool.cp.tests
{
    public partial class edit : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Edit/Delete";
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

        protected void RadGrid1_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem item = e.Item as GridEditableItem;
                Int32 test_id = Convert.ToInt32(item.GetDataKeyValue("test_id"));
                Hashtable newValues = new Hashtable();
                item.OwnerTableView.ExtractValuesFromItem(newValues, item);
                string test_name = newValues["test_name"].ToString();
                string test_active = newValues["test_active"].ToString();
                if (test_name != "" || test_name != null || test_active != null)
                {
                    string query = "update tests set test_name = @test_name, test_active = @test_active where test_id = @test_id";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@test_name", test_name);
                    cmd.Parameters.AddWithValue("@test_id", test_id);
                    if (test_active == "True")
                    {
                        if (activeFound())
                        {
                            Response.Write("<script>alert('There is already an active test, please disable current active test ')</script>");
                            return;
                        }else
                        {
                            cmd.Parameters.AddWithValue("@test_active", "1");

                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@test_active", "0");
                    }
                    conn.Open();

                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Test updated successfull ')</script>");

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



        private Boolean activeFound()
        {
            try
            {
                conn.Open();
                string query = "select  * from tests where test_active=1";
                SqlCommand cmd = new SqlCommand(query, conn);
                Int32 r = Convert.ToInt32(cmd.ExecuteScalar());
                if (r > 0)
                {
                    conn.Close();
                    return true;
                }
                conn.Close();
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
        protected void RadGrid1_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                GridDataItem item = e.Item as GridDataItem;
                string id = item.GetDataKeyValue("test_id").ToString();
                conn.Open();
                string query = "delete from tests where test_id = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                int rows = 0;

                cmd.Parameters.AddWithValue("@id", id);
                rows = cmd.ExecuteNonQuery();

                if (rows >= 1)
                {
                    Response.Write("<script>alert('Test deleted successfully')</script>");

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