<%@ Page Title="" Language="C#" MasterPageFile="~/cp/cp_master.Master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="WebAppAssesmentTool.cp.admins.add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3>Add Admin</h3>

    <div align="center">
        <fieldset>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label_first_name" runat="server" Text="First Name: ">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox_first_name" required="" class="form-control" TextMode="SingleLine"  placeholder="First Name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label_last_name" runat="server" Text="Last Name: "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox_last_name" required="" class="form-control" TextMode="SingleLine"  placeholder="Last Name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label_email" runat="server" Text="Email: "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox_email" required="" class="form-control"  TextMode="Email" placeholder="Email" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label_password" runat="server" Text="Password: "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox_password" required="" class="form-control" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>


        </fieldset>

        <asp:Button ID="Button1_submit" CssClass="Button1_submit" OnClick="Button1_submit_Click" runat="server" Text="Submit" />

    </div>
</asp:Content>
