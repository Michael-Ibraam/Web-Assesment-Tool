<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="delete.aspx.cs" Inherits="WebAppAssesmentTool.cp.questions.delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Delete Question</h3>
    <telerik:RadGrid
        ID="RadGrid1"
        runat="server"
        DataSourceID="SqlDataSource_get_all_questions"
        OnDeleteCommand="RadGrid1_DeleteCommand"
        AllowFilteringByColumn="True"
        AllowPaging="True"
        AllowSorting="True" CellSpacing="-1" GridLines="None">

        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

        <MasterTableView
            DataKeyNames="question_id"
            DataSourceID="SqlDataSource_get_all_questions" AutoGenerateColumns="False">
            <CommandItemSettings ShowExportToPdfButton="True" />
            <Columns>


                <telerik:GridBoundColumn DataField="text" FilterControlAltText="Filter text column" HeaderText="text" SortExpression="text" UniqueName="text">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="answer_text" FilterControlAltText="Filter answer_text column" HeaderText="correct answer" SortExpression="answer_text" UniqueName="answer_text">
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this record?"
                    CommandName="Delete" Text="Delete">
                </telerik:GridButtonColumn>

            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource_get_all_questions" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="select questions.question_id, questions.text,answers.answer_text from questions, answers where questions.correct_answer = answers.answer_id"></asp:SqlDataSource>
</asp:Content>
