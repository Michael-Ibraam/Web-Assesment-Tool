<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="WebAppAssesmentTool.cp.tests.edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Edit/Delete Test</h3>
    <telerik:RadGrid ID="RadGrid1" runat="server" OnDeleteCommand="RadGrid1_DeleteCommand" OnUpdateCommand="RadGrid1_UpdateCommand" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" AutoGenerateEditColumn="True" CellSpacing="-1" DataSourceID="SqlDataSource1" GridLines="Both">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="test_id" DataSourceID="SqlDataSource1">
            <Columns>

                <telerik:GridBoundColumn DataField="test_name" FilterControlAltText="Filter test_name column" HeaderText="test_name" SortExpression="test_name" UniqueName="test_name">
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="test_active" DataType="System.Boolean" FilterControlAltText="Filter test_active column" HeaderText="test_active" SortExpression="test_active" UniqueName="test_active">
                </telerik:GridCheckBoxColumn>
                <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this row or record?"
                    CommandName="Delete" Text="Delete">
                </telerik:GridButtonColumn>

            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT * FROM [Tests]"></asp:SqlDataSource>
</asp:Content>
