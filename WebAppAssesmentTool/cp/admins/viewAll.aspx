<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="viewAll.aspx.cs" Inherits="WebAppAssesmentTool.cp.admins.viewAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>View All Admin Users</h3>
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="admin_id" DataSourceID="SqlDataSource1">
            <Columns>

                <telerik:GridBoundColumn DataField="first_name" FilterControlAltText="Filter first_name column" HeaderText="first_name" SortExpression="first_name" UniqueName="first_name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="last_name" FilterControlAltText="Filter last_name column" HeaderText="last_name" SortExpression="last_name" UniqueName="last_name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="email" SortExpression="email" UniqueName="email">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT [admin_id], [first_name], [last_name], [email] FROM [admin]"></asp:SqlDataSource>
</asp:Content>
