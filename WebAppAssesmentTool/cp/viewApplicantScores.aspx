<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="viewApplicantScores.aspx.cs" Inherits="WebAppAssesmentTool.cp.viewApplicantScores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>View Applicants Data</h3>
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <MasterTableView  AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <telerik:GridBoundColumn DataField="first_name" FilterControlAltText="Filter first_name column" HeaderText="first_name" SortExpression="first_name" UniqueName="first_name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="last_name" FilterControlAltText="Filter last_name column" HeaderText="last_name" SortExpression="last_name" UniqueName="last_name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="email" SortExpression="email" UniqueName="email">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="country" FilterControlAltText="Filter country column" HeaderText="country" SortExpression="country" UniqueName="country">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="date_of_birth" DataType="System.DateTime" FilterControlAltText="Filter date_of_birth column" HeaderText="date_of_birth" SortExpression="date_of_birth" UniqueName="date_of_birth">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="test_score" DataType="System.Decimal" FilterControlAltText="Filter test_score column" HeaderText="test_score" SortExpression="test_score" UniqueName="test_score">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT [first_name], [last_name], [email], [country], [date_of_birth],  [test_score] FROM [applicants]"></asp:SqlDataSource>
</asp:Content>
