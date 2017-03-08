<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="viewScore.aspx.cs" Inherits="WebAppAssesmentTool.st.viewScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-4">
    </div>

    <div class="col-md-4">
        <table align="center">
            <tr>
                <td>
                    <asp:Label ID="Label1" Font-Bold="true" runat="server" Text="First Name: "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label_first_name" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" Font-Bold="true" runat="server" Text="Last Name: "></asp:Label>

                </td>
                <td>
                    <asp:Label ID="Label_last_name" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" Font-Bold="true" runat="server" Text="Email: "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label_email" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" Font-Bold="true" runat="server" Text="Test Score:  "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label_test_score" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div class="col-md-4">
    </div>



</asp:Content>
