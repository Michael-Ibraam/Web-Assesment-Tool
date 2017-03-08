<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="delete.aspx.cs" Inherits="WebAppAssesmentTool.cp.answers.delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Delete Answer</h3>
    <telerik:RadGrid
        ID="RadGrid1"
        runat="server"
        AllowFilteringByColumn="True"
        AllowPaging="True"
        AllowSorting="True"
        DataSourceID="SqlDataSource_get_all_answers"
        OnDeleteCommand="RadGrid1_DeleteCommand"
        AutoGenerateColumns="False"
        Skin="Default">

        <MasterTableView DataKeyNames="answer_id" DataSourceID="SqlDataSource_get_all_answers">
            <Columns>

                <telerik:GridBoundColumn DataField="answer_text" FilterControlAltText="Filter answer_text column" HeaderText="answer_text" SortExpression="answer_text" UniqueName="answer_text">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="text" FilterControlAltText="Filter text column" HeaderText="question text" SortExpression="text" UniqueName="text">
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this row or record?"
                    CommandName="Delete" Text="Delete">
                </telerik:GridButtonColumn>

            </Columns>
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSource_get_all_answers" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="select * from answers, questions where questions.question_id=answers.question_id"></asp:SqlDataSource>

</asp:Content>
