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
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik;
using Telerik.Web.UI;


namespace WebAppAssesmentTool
{
    public partial class index : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        LinkedList<string> question_id_list = new LinkedList<string>();
        LinkedList<string> answer_id_list = new LinkedList<string>();
        Int32 score = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                Page.Title = "Test";
                Boolean b = Roles.IsUserInRole(this.Page.User.Identity.Name, "applicant");
                if (!this.Page.User.Identity.IsAuthenticated || !b)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }

                if (!isTestTaken(this.Page.User.Identity.Name))
                {
                    viewTest();
                }
                else
                {
                    var message = new JavaScriptSerializer().Serialize("You can't take the test more than 1 time");
                    var script = string.Format("alert({0});", message);
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);
                    Button1_submit.Visible = false;
                    Response.Redirect("/st/info.aspx");
                }
            }
            catch (Exception ex)
            {
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);
            }

        }

        private Boolean isTestTaken(String email)
        {
            try
            {
                string query = "select test_score from applicants where email=@email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                conn.Open();
                String testScore = cmd.ExecuteScalar().ToString();
                conn.Close();

                if (testScore == null || testScore=="")
                {
                    return false;
                }
                return true;

            }
            catch (Exception ex)
            {
                conn.Close();
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);
                return true;


            }
        }

        protected void viewTest()
        {
            try
            {
                conn.Open();
                SqlCommand cmd1 = new SqlCommand("selectActiveTestQuestions", conn);
                cmd1.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd1.ExecuteReader();
                int index = 1;
                while (reader.Read())
                {
                   
                    var button = new HtmlGenericControl("button");
                    button.Attributes.Add("class", "accordion");
                    button.Attributes.Add("type", "button");
                    var bold = new HtmlGenericControl("b");
                    bold.InnerText = index + ". "+ reader["text"].ToString();
                    button.Controls.Add(bold);

                    RadRadioButtonList radioList = new RadRadioButtonList();
                    SqlDataSource_radioList.SelectParameters[0].DefaultValue = reader["question_id"].ToString();
                    question_id_list.AddLast(reader["question_id"].ToString());
                    radioList.DataSource = SqlDataSource_radioList;
                    radioList.AutoPostBack = false;
                    SqlDataSource_radioList.DataBind();
                    radioList.DataBindings.DataTextField = "answer_text";
                    radioList.DataBindings.DataValueField = "answer_id";
                    radioList.ID = "Radio" + index;
                    radioList.DataBind();


                    var divHead = new HtmlGenericControl("div");
                    divHead.Attributes.Add("class", "panel");
                    divHead.Controls.Add(radioList);

                    accordion.Controls.Add(button);
                    accordion.Controls.Add(divHead);

                    index++;

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

        private void LoadControls()
        {
            var tmpRBL = new RadioButtonList();
            tmpRBL.ID = "x";

            for (int i = 1; i <= 5; i++)
            {
                var tmpItem = new ListItem(i.ToString(), i.ToString());
                tmpRBL.Items.Add(tmpItem);
            }
            tmpRBL.DataBind();
            accordion.Controls.Add(tmpRBL);
        }

        protected void GetControlList<T>(ControlCollection controlCollection, List<T> resultCollection)
            where T : Control
        {
            foreach (Control control in controlCollection)
            {
                //if (control.GetType() == typeof(T))
                if (control is T) // This is cleaner
                    resultCollection.Add((T)control);

                if (control.HasControls())
                    GetControlList(control.Controls, resultCollection);
            }
        }
        protected void Button1_submit_Click(object sender, EventArgs e)
        {
            try
            {
                List<RadRadioButtonList> allControls = new List<RadRadioButtonList>();
                GetControlList<RadRadioButtonList>(Page.Controls, allControls);
                for (int i = 0; i < allControls.Count; i++)
                {
                    int j = i + 1;
                    RadRadioButtonList radioButton = (RadRadioButtonList)accordion.FindControl("Radio" + j);
                    String answer_value = radioButton.SelectedValue;
                    if (answer_value == "" || answer_value == null)
                    {
                        RadNotification1.Text = "One or more questions is not answered";
                        RadNotification1.Show();
                        return;
                    }
                    else
                    {
                        answer_id_list.AddLast(answer_value);
                    }
                }


                calculateScore();
            }
            catch (Exception ex)
            {
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);
            }
        }

        private void calculateScore()
        {
            try
            {

                string query = "select correct_answer from questions where question_id=@question_id";
                SqlCommand cmd = new SqlCommand(query, conn);
                int i = 0;
                while (i < question_id_list.Count)
                {
                    conn.Open();
                    if (!cmd.Parameters.Contains("@question_id"))
                    {
                        cmd.Parameters.AddWithValue("@question_id", question_id_list.ElementAt(i));
                    }
                    else
                    {
                        cmd.Parameters["@question_id"].Value = question_id_list.ElementAt(i);
                    }

                    string correct_answer_id = cmd.ExecuteScalar().ToString();
                    if (answer_id_list.Count > 0)
                    {
                        if ( answer_id_list.Contains(correct_answer_id))
                        {
                            score++;
                        }
                    }
                    i++;
                    conn.Close();

                }
                double scorePercentage = (double) score / question_id_list.Count;
                int finalScore = (int)(Math.Round(scorePercentage * 100));
                string update_score_query = "update  applicants set test_score = @test_score where email =@email";
                cmd.CommandText = update_score_query;
                cmd.Parameters.AddWithValue("test_score", finalScore);
                cmd.Parameters.AddWithValue("@email", this.Page.User.Identity.Name);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("../st/viewScore.aspx", false);
            }
            catch (Exception ex)
            {
                RadNotification1.Text = ex.Message;
                RadNotification1.Show();
                //var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                //var script = string.Format("alert({0});", message);
                //ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);
            }
        }
    }
}