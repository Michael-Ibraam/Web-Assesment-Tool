<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="delete.aspx.cs" Inherits="WebAppAssesmentTool.cp.admins.delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Delete Admin</h3>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadGrid OnDeleteCommand="RadGrid1_DeleteCommand" ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="admin_id" DataSourceID="SqlDataSource1">
            <Columns>

                <telerik:GridBoundColumn DataField="last_name" FilterControlAltText="Filter last_name column" HeaderText="last_name" SortExpression="last_name" UniqueName="last_name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="first_name" FilterControlAltText="Filter first_name column" HeaderText="first_name" SortExpression="first_name" UniqueName="first_name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="email" SortExpression="email" UniqueName="email">
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this row or record?"
                    CommandName="Delete" Text="Delete">
                </telerik:GridButtonColumn>

            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT [admin_id], [last_name], [first_name], [email] FROM [admin] WHERE ([admin_id] &lt;&gt; @admin_id)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="admin_id" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
