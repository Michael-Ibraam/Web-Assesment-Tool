<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="admin_panel.aspx.cs" Inherits="WebAppAssesmentTool.cp.admin_panel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Instructions for Help</h3>
    <ul>
        <li>First start with creating questions, this can be achieved by choosing <b>Questions -> Add </b>from the menu above.
        </li>
        <li>Each question has to have at least one answer, you can add or remove answers as many as you wish.
        </li>

        <li>Each question has only one correct answer.
        </li>
        <li>To write mathematical equations and symbols use the same syntax as Latex, you can find more information by following latex guide  
           <a target="_blank" href="https://en.wikibooks.org/wiki/LaTeX/Mathematics">here</a>

        </li>
        <li>Deleting a question will also delete all its corresponding answers.
        </li>

        <li>You can't delete the correct answer for a question, 
        </li>

        <li>After the successful creation of questions now you can create a test, select the questions you want to include in the test, this can achieved by choosing <b>Tests -> Add </b>from the menu above.
        </li>

        <li>Test active property means that applicant will take this test.
        </li>

        <li>You can have same question included in different tests.
        </li>

        <li>You can create many tests, but you can only have 1 active test at a time.
        </li>
    </ul>
</asp:Content>
