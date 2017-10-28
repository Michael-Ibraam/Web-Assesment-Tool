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
using Telerik.Web.UI;

namespace WebAppAssesmentTool.cp.tests
{
    public partial class add : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Add Test";
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
                String test_name = textBox_test_name.Text.Trim();
                Boolean active = CheckBox_active.Checked;
                LinkedList<string> collection = new LinkedList<string>();
                foreach (ButtonListItem item in RadCheckBoxList1.Items)
                {
                    if (item.Selected)
                    {
                        collection.AddLast(item.Value);
                    }
                }
                if (test_name == "" || test_name == null || collection.Count < 1)
                {
                    Response.Write("<script>alert('Incomplete Data')</script>");
                    return;
                }
                else
                {
                    if(testFound(test_name))
                    {
                        Response.Write("<script>alert('Test name already used, please choose another name')</script>");
                        return;
                    }
                    else
                    {
                        string query = "insert into tests (test_name,test_active) OUTPUT INSERTED.test_id values(@test_name,@active) ";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@test_name", test_name);
                        if (active)
                        {
                            if (activeFound())
                            {
                                Response.Write("<script>alert('There is already an active test, please disable the current active test first.')</script>");
                                return;
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@active", "1");
                            }
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@active", "0");

                        }
                        conn.Open();
                        Int32 test_id = Convert.ToInt32(cmd.ExecuteScalar());
                        for (var i = 0; i < collection.Count; i++)
                        {
                            query = "insert into tests_questions (test_id,question_id) values (@test_id,@question_id) ";
                            cmd = new SqlCommand(query, conn);
                            cmd.Parameters.AddWithValue("@test_id", test_id);
                            cmd.Parameters.AddWithValue("@question_id", collection.ElementAt(i));
                            cmd.ExecuteNonQuery();

                        }
                        Response.Write("<script>alert('Test Created Successfully')</script>");
                    }
                    

                }
                textBox_test_name.Text = "";
                RadCheckBoxList1.DataBind();
                CheckBox_active.Checked = false;
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
        private Boolean testFound(string testname)
        {
            try
            {
                conn.Open();
                string query = "select  * from tests where test_name=" + testname;
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


    }
}