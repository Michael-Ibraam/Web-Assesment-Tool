<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="viewAll.aspx.cs" Inherits="WebAppAssesmentTool.cp.questions.View_All" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>View All Questions</h3>
    <asp:Panel ID="Panel1" runat="server">
        <table align="center">
            <tr>
                <td>

                    <telerik:RadGrid
                        ID="RadGrid1"
                        runat="server"
                        AllowFilteringByColumn="True"
                        AllowPaging="True"
                        AllowSorting="True"
                        DataSourceID="SqlDataSource_get_all_questions"
                        CellSpacing="-1"
                        GridLines="None">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings>
                            <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                        </ClientSettings>
                        <MasterTableView DataSourceID="SqlDataSource_get_all_questions" DataKeyNames="question_id">
                            <Columns>

                                <telerik:GridBoundColumn DataField="text" FilterControlAltText="Filter text column" HeaderText="text" SortExpression="text" UniqueName="text">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="correct_answer" DataType="System.Decimal" FilterControlAltText="Filter correct_answer column" HeaderText="correct answer" SortExpression="correct_answer" UniqueName="correct_answer">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:SqlDataSource ID="SqlDataSource_get_all_questions" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT * FROM [questions]"></asp:SqlDataSource>
</asp:Content>
