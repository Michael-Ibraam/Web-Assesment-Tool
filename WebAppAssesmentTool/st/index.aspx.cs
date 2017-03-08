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

namespace WebAppAssesmentTool
{
    public partial class index : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        Hashtable hashtable_question_answer = new Hashtable();
        LinkedList<string> question_id_list = new LinkedList<string>();
        LinkedList<string> answer_id_list = new LinkedList<string>();
        Int32 score = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Home";
                Boolean b = Roles.IsUserInRole(this.Page.User.Identity.Name, "applicant");
                if (!this.Page.User.Identity.IsAuthenticated || !b)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
                viewTest();
            }
            catch (Exception ex)
            {
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);
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
                hashtable_question_answer = new Hashtable();

                Random ran = new Random();
                var numbers = Enumerable.Range(1, 4).OrderBy(i => ran.Next()).ToList();
                int index = 1;
                while (reader.Read())
                {

                    HtmlAnchor a = new HtmlAnchor();
                    a.Attributes.Add("class", "collapsed");
                    a.Attributes.Add("data-toggle", "collapse");
                    a.Attributes.Add("data-parent", "#accordion");
                    a.Attributes.Add("href", "#collapse" + index);
                    a.Attributes.Add("aria-expanded", "false");
                    a.Attributes.Add("aria-controls", "collapse" + index);
                    a.Attributes.Add("class", "collapsed");
                    var bold = new HtmlGenericControl("b");
                    bold.InnerText = reader["text"].ToString();
                    a.Controls.Add(bold);

                    var h5 = new HtmlGenericControl("h5");
                    h5.Attributes.Add("class", "mb-0");
                    h5.Controls.Add(a);

                    var divHead = new HtmlGenericControl("div");
                    divHead.Attributes.Add("id", "heading" + index);
                    divHead.Attributes.Add("class", "card-header");
                    divHead.Attributes.Add("role", "tab");
                    divHead.Controls.Add(h5);


                    RadioButtonList radioList = new RadioButtonList();
                    SqlDataSource_radioList.SelectParameters[0].DefaultValue = reader["question_id"].ToString();
                    question_id_list.AddLast(reader["question_id"].ToString());
                    radioList.DataSource = SqlDataSource_radioList;
                    SqlDataSource_radioList.DataBind();
                    radioList.DataTextField = "answer_text";
                    radioList.DataValueField = "answer_id";
                    radioList.DataBind();



                    var divAnswers = new HtmlGenericControl("div");
                    divAnswers.Attributes.Add("class", "card-block");
                    divAnswers.Controls.Add(radioList);

                    var divCollapse = new HtmlGenericControl("div");
                    divCollapse.Attributes.Add("id", "collapse" + index);
                    divCollapse.Attributes.Add("class", "collapse");
                    divCollapse.Attributes.Add("role", "tabpanel");
                    divCollapse.Attributes.Add("aria-labelledby", "heading" + index);
                    divCollapse.Controls.Add(divAnswers);

                    var divCard = new HtmlGenericControl("div");
                    divCard.Attributes.Add("class", "card");
                    divCard.Controls.Add(divHead);
                    divCard.Controls.Add(divCollapse);

                    accordion.Controls.Add(divCard);
                    index++;

                    //Label Label_question_text = new Label();
                    //Label_question_text.Text = reader["text"].ToString();
                    //Label_question_text.Font.Bold = true;

                    //accordion.Controls.Add(Label_question_text);
                    //accordion.Controls.Add(new LiteralControl("<br />"));


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
                List<RadioButtonList> allControls = new List<RadioButtonList>();
                GetControlList<RadioButtonList>(Page.Controls, allControls);
                foreach (var item in allControls)
                {
                    String answer_value = item.SelectedValue;
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
                    if (correct_answer_id == answer_id_list.ElementAt(i))
                    {
                        score++;
                    }
                    i++;
                    conn.Close();
                }
                int finalScore = score;
                string update_score_query = "update  applicants set test_score = @test_score where email =@email";
                cmd.CommandText = update_score_query;
                cmd.Parameters.AddWithValue("test_score", score);
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