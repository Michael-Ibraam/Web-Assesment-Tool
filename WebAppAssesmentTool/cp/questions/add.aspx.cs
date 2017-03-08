using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebAppAssesmentTool.cp.questions
{
    public partial class add : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["math_media_project_dbConnectionString"].ConnectionString;
        static SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Page.Title = "Add Question";
                Boolean b = Roles.IsUserInRole(this.Page.User.Identity.Name, "admin");
                if (!this.Page.User.Identity.IsAuthenticated || !b)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error'" + ex.Message + ")</script>");
                throw;
            }
        }


        [WebMethod]
        public static void submit(string[] array)
        {

            try
            {
                if (array[0] == null || array[1] == null || array[0] == "" || array[1] == "" ||  Array.IndexOf(array, "" ) >=0 )
                {
                    throw  new System.IO.IOException();
                    	
                }else
                {
                    conn.Open();
                    string query_insert_questions = "INSERT INTO questions (text) OUTPUT INSERTED.question_id VALUES (@text)";
                    SqlCommand cmd = new SqlCommand(query_insert_questions, conn);

                    cmd.Parameters.AddWithValue("@text", array[0]);
                    int question_id = Convert.ToInt32(cmd.ExecuteScalar());
                    string query_insert_correct_answer = "INSERT INTO answers (answer_text,question_id) OUTPUT INSERTED.answer_id VALUES (@answer_text,@question_id)";

                    cmd.CommandText = query_insert_correct_answer;
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@answer_text", array[1]);
                    cmd.Parameters.AddWithValue("@question_id", question_id);
                    int correct_answer = Convert.ToInt32(cmd.ExecuteScalar());
                    string query_update_questions = "update questions SET [correct_answer] = @correct_answer_id where question_id = @question_id";
                    cmd.CommandText = query_update_questions;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@correct_answer_id", correct_answer);
                    cmd.Parameters.AddWithValue("@question_id", question_id);
                    cmd.ExecuteScalar();

                    for (var i = 2; i < array.Length; i++)
                    {
                        if (array[i] == null)
                        {

                        }
                        else
                        {
                            string query_insert_answers = "INSERT INTO answers (answer_text,question_id)  VALUES (@answer_text,@question_id)";
                            cmd.CommandText = query_insert_answers;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@answer_text", array[i]);
                            cmd.Parameters.AddWithValue("@question_id", question_id);
                            cmd.ExecuteScalar();
                        }
                    }
                }
                conn.Close();


            }
            catch (Exception ex)
            {
                conn.Close();
                throw ex; 
            }
        }

        private void success()
        {
            try
            {


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void Button_submit_Click(object sender, EventArgs e)
        {
            try
            {
                int r = mytable.Rows.Count;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        //protected void RadButton_submit_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string text = RadTextBox_question_body.Text.Trim();
        //        string id = RadComboBox_answers.SelectedValue;
        //        int checked_items_count = RadComboBox_incorrect_answers.CheckedItems.Count;
        //        var checked_items = RadComboBox_incorrect_answers.CheckedItems;
        //        if (text == null || text == "" || id == null || id == "" || checked_items_count < 4 || checked_items_count > 4)
        //        {
        //            Response.Write("<script>alert('Incomplete data')</script>");
        //            return;
        //        }
        //        else
        //        {
        //            conn.Open();
        //            string query_insert = "INSERT INTO questions (text,correct_answer) OUTPUT INSERTED.question_id VALUES (@text, @id)";
        //            string query_update = "update  answers set question_id =@question_id  where answer_id in (@id1,@id2,@id3,@id4,@id5)";
        //            SqlCommand cmd = new SqlCommand(query_insert, conn);
        //            cmd.Parameters.AddWithValue("@text", text);
        //            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(id));
        //            int inserted_id = Convert.ToInt32(cmd.ExecuteScalar());
        //            if (inserted_id >= 1)
        //            {
        //                //Response.Write("<script>alert('Question added successfully')</script>");
        //                cmd = new SqlCommand(query_update, conn);
        //                cmd.Parameters.AddWithValue("@question_id", inserted_id);
        //                cmd.Parameters.AddWithValue("@id1", Convert.ToInt32(checked_items[0].Value));
        //                cmd.Parameters.AddWithValue("@id2", Convert.ToInt32(checked_items[1].Value));
        //                cmd.Parameters.AddWithValue("@id3", Convert.ToInt32(checked_items[2].Value));
        //                cmd.Parameters.AddWithValue("@id4", Convert.ToInt32(checked_items[3].Value));
        //                cmd.Parameters.AddWithValue("@id5", Convert.ToInt32(id));
        //                cmd.ExecuteNonQuery();
        //                Response.Write("<script>alert('Question added successfully')</script>");
        //                RadTextBox_question_body.Text = "";
        //                RadComboBox_answers.ClearSelection();
        //                RadComboBox_incorrect_answers.ClearCheckedItems();
        //                RadComboBox_answers.DataBind();
        //                RadComboBox_incorrect_answers.DataBind();
        //            }
        //        }
        //        conn.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        conn.Close();
        //        var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
        //        var script = string.Format("alert({0});", message);
        //        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);

        //        throw;
        //    }
        //}

        //protected void RadComboBox_answers_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        //{
        //    try
        //    {
        //        RadComboBox_incorrect_answers.DataBind();
        //        string correct_answer_id = RadComboBox_answers.SelectedValue;
        //        RadComboBoxItem item = RadComboBox_incorrect_answers.FindItemByValue(correct_answer_id);
        //        item.Remove();
        //    }
        //    catch (Exception ex)
        //    {
        //        var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
        //        var script = string.Format("alert({0});", message);
        //        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);

        //    }
        //}



    }
}