<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="viewAll.aspx.cs" Inherits="WebAppAssesmentTool.cp.answers.viewAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>View All Answers</h3>
    <table>
        <tr>
            <td>
                <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource_get_all_answers" AutoGenerateColumns="False">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <ClientSettings>
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    </ClientSettings>

                    <MasterTableView DataSourceID="SqlDataSource_get_all_answers">
                        <Columns>

                            <telerik:GridBoundColumn DataField="answer_text" FilterControlAltText="Filter answer_text column" HeaderText="answer text" SortExpression="answer_text" UniqueName="answer_text">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="text" FilterControlAltText="Filter text column" HeaderText="question text" SortExpression="text" UniqueName="text">
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSource_get_all_answers" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="select answers.answer_text, questions.text from answers, questions where questions.question_id=answers.question_id"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
