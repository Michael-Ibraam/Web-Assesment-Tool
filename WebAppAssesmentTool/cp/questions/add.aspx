<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="WebAppAssesmentTool.cp.questions.add" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function OnClientItemChecking(sender, args) {
            if (sender.get_checkedItems().length == 4 && (args.get_item().get_checked() == false)) {
                alert("count exceeded");
                args.set_cancel(true);
            }
        }

        var index = 2;
      
        function addAnswer() {
            var table = document.getElementById("<%=mytable.ClientID%>");
            var row = table.insertRow(table.rows.length);
            row.id = index;

            var cell1 = row.insertCell(0);
            var label = document.createElement("Label");
            label.innerText = "Answer Text";
            cell1.appendChild(label);

            var cell2 = row.insertCell(1);
            var textarea = document.createElement("textarea");
            textarea.id = "textarea" + index;
            textarea.cols = "80";
            textarea.rows = "4";
            textarea.required = "required";
            textarea.setAttribute("runat", "server");
            cell2.appendChild(textarea);

            var cell3 = row.insertCell(2);
            var del_button = document.createElement("button");
            del_button.className = "btn btn-danger btn-md";
            //del_button.textContent = "Delete";
            del_button.onclick = function () {
                this.parentNode.parentNode.innerHTML = "";
                return false
            };
            var span = document.createElement("span");
            span.className = "glyphicon glyphicon-remove";
            span.innerHTML = "Delete";
            del_button.appendChild(span);
            cell3.appendChild(del_button);
            index++;
        }

        function submitClient() {

            var textArray = [];
            var table = document.getElementById("<%=mytable.ClientID%>");
            textArray[0] = table.rows[0].cells[1].children[0].value;
            textArray[1] = table.rows[1].cells[1].children[0].value;
            for (var i = 3; i < table.rows.length; i++) {

                if (table.rows[i].innerHTML == "") {
                } else {
                    textArray[i - 1] = table.rows[i].cells[1].children[0].value;
                }
            }

            PageMethods.submit(textArray, OnSuccess, OnError);
        }

        function OnSuccess() {
            alert("Question Added Successfully");
            location.reload();

        }
        function OnError(error) {
            alert("error : " + error.get_message());
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <p style="text-align: center">
`x = (-b +- sqrt(b^2-4ac))/(2a) `
\[x = (-b +- \sqrt[3]{b^2-4ac})/(2a).\]
\[\frac{2}{3}\]
    
    </p>--%>
    <%--  <asp:Panel ID="Panel1" runat="server" align="center">
    </asp:Panel>--%>

    <h3>Add Question</h3>
    <div>
        <fieldset>
            <table id="mytable" runat="server" align="center">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Question Body: "></asp:Label>
                    </td>
                    <td>
                        <textarea id="TextArea_question" runat="server" required="required" cols="80" rows="4"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Correct Answer: "></asp:Label>
                    </td>
                    <td>
                        <textarea id="TextArea_correct_answer" runat="server" required="required" cols="80" rows="4"></textarea>
                    </td>
                </tr>

                <tr>
                    <td>
<%--                        <telerik:RadButton ID="RadButton1" AutoPostBack="false" CssClass="glyphicon glyphicon-plus" OnClientClicked="addAnswer" runat="server" Text="Add other answers">

                        </telerik:RadButton>--%>

                        <button onclick="addAnswer()" class="btn btn-info btn-md">
                            <span class="glyphicon glyphicon-plus"></span>Add answer 

                        </button>

                    </td>
                </tr>

                <%--               <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Correct Answer: "></asp:Label>
                    </td>
                    <td>

                        <telerik:RadComboBox ID="RadComboBox_answers" runat="server" DataSourceID="comboBox_all_answers" DataTextField="answer_text" DataValueField="answer_id" EmptyMessage="Please select answer" Skin="Default" AutoPostBack="true" ExpandDirection="Down" EnableScreenBoundaryDetection="true" Width="300px" OnSelectedIndexChanged="RadComboBox_answers_SelectedIndexChanged">
                        </telerik:RadComboBox>
                    </td>

                </tr>
              <tr>
                    <td>
                        <asp:Label ID="Label_incorrect_answers" runat="server" Text="Please select incorrect answers: "></asp:Label>
                        <br />
                        <asp:Label ID="Label_note" runat="server" Font-Size="Small" ForeColor="red" Text="(you must select only 4 answers)"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadComboBox EnableScreenBoundaryDetection="true" ExpandDirection="Down" Width="300px" ID="RadComboBox_incorrect_answers" runat="server" CheckBoxes="True" DataSourceID="comboBox_all_answers" DataTextField="answer_text" DataValueField="answer_id" EmptyMessage="Please select only 4 answers" OnClientItemChecking="OnClientItemChecking" Skin="Default"></telerik:RadComboBox>
                    </td>
                </tr>--%>
            </table>
        </fieldset>

        <asp:Button ID="Button_submit" OnClientClick="submitClient();return false;" CssClass="Button1_submit" runat="server" Text="Submit" />
    </div>
    <asp:SqlDataSource ID="comboBox_all_answers" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT [answer_id], [answer_text] FROM [answers] where question_id is null"></asp:SqlDataSource>

</asp:Content>
