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

namespace WebAppAssesmentTool.st
{
    public partial class register : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Register";
                Boolean b = Roles.IsUserInRole(this.Page.User.Identity.Name, "applicant");
                if (this.Page.User.Identity.IsAuthenticated || b)
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
                string firstName = TextBox_first_name.Text.Trim();
                string lastName = TextBox_last_name.Text.Trim();
                string email = TextBox_email.Text.Trim();
                string passwrod = radTextBox_password.Text.Trim();
                string birthDate = TextBox_birth_date.Text.Trim();
                string country = TextBox_country.Text.Trim();
                Boolean found = isFound(email);
                if (radTextBox_password.Text.Trim() != radTextBox_retypePassword.Text.Trim())
                {
                    var message = new JavaScriptSerializer().Serialize("Passowrds are not matching");
                    var script = string.Format("alert({0});", message);
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);

                    return;
                }
                if (!found)
                {
                    string query = "insert into applicants (first_name,last_name,email,password,country,date_of_birth) OUTPUT INSERTED.applicant_id  values(@first_name,@last_name,@email,@password,@country,@date_of_birth)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@first_name", firstName);
                    cmd.Parameters.AddWithValue("@last_name", lastName);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", passwrod);
                    cmd.Parameters.AddWithValue("@country", country);
                    cmd.Parameters.AddWithValue("@date_of_birth", birthDate);
                    //cmd.Parameters.AddWithValue("@passport_number", passportNumber);
                    conn.Open();
                    int result = Convert.ToInt32(cmd.ExecuteScalar());
                    conn.Close();
                    if (result >= 0)
                    {
                        if (!Roles.RoleExists("applicant"))
                        {
                            Roles.CreateRole("applicant");
                        }

                        Roles.AddUserToRole(email, "applicant");

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                        "alert('User created successfully'); window.location='" +
                        Request.ApplicationPath + "../login.aspx';", true);

                        //Response.Write("<script>alert('User created successfully')</script>");
                        //Response.Redirect("../login.aspx", false);

                    }
                    else
                    {
                        Response.Write("<script>alert('Error')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Already Registered')</script>");
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

        private bool isFound(string email)
        {
            try
            {
                conn.Open();

                string query = "select * from applicants where email = @email ";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                var result = cmd.ExecuteScalar();
                if (result != null)
                {
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