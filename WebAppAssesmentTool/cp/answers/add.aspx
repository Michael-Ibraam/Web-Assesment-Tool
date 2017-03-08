<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="WebAppAssesmentTool.cp.answers.add" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function validationFunction(source, args) {

            if (args.Value == "") {
                args.IsValid = false;
            } else {
                args.IsValid = true;
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" align="center">

     
        <h3>Add Answer</h3>
        <div>
            <fieldset>
                <asp:Label ID="Label1" runat="server" Text="Answer Text: "></asp:Label>
                <telerik:RadTextBox CausesValidation="true" ID="RadTextBox_answer_text" runat="server"  EmptyMessage="Please write the answer here" LabelWidth="64px" Resize="Both" Skin="Default" TextMode="MultiLine" Height="100px" Width="300px"></telerik:RadTextBox>
                <asp:RequiredFieldValidator
                    EnableClientScript="true"
                    ID="TextBoxRequiredFieldValidator"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="RadTextBox_answer_text"
                    ErrorMessage="Can not be empty!"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </fieldset>

            <asp:Button ID="Button1_submit" CssClass="Button1_submit" OnClick="RadButton_submit_Click" runat="server" Text="Submit" />

        </div>

    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource_get_all_questions" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT [question_id], [text] FROM [questions]"></asp:SqlDataSource>

</asp:Content>
