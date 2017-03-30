<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="WebAppAssesmentTool.cp.tests.add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" align="center">

        <h3>Add Test</h3>

        <div>
            <fieldset>
                <table style="display:flexbox;">
                    <tr>
                        <td>
                            <asp:Label ID="Label_test_name" runat="server" Text="Test Name: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="textBox_test_name" runat="server" Width="100%" placeholder="Please write a name for the test"  required=""></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label_active" runat="server" Text="Active: "></asp:Label>

                        </td>
                        <td>

                            <asp:CheckBox ID="CheckBox_active" runat="server" />
                        </td>
                    </tr>

                    <tr>
                        <td valign="top">
                            <asp:Label ID="Label_questions" runat="server" Text="Please select questions for the test: "></asp:Label>
                        </td>
                        <td>
                            <telerik:RadCheckBoxList Width="600px" AutoPostBack="false" ID="RadCheckBoxList1" DataSourceID="SqlDataSource_get_all_questions" runat="server">
                                <DataBindings DataTextField="text" DataValueField="question_id" />
                            </telerik:RadCheckBoxList>

                            <asp:SqlDataSource ID="SqlDataSource_get_all_questions" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT [question_id], [text] FROM [questions]"></asp:SqlDataSource>
                        </td>
                    </tr>

                </table>

            </fieldset>

            <asp:Button ID="Button1_submit" CssClass="Button1_submit" OnClick="RadButton_submit_Click" runat="server" Text="Submit" />

        </div>
    </asp:Panel>

</asp:Content>
