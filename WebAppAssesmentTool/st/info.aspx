<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="WebAppAssesmentTool.st.info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Navigate() {
            window.location = "index.aspx";

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div>
        <ul>
            <li>You can take the test only 1 time.
            </li>
            <li>Be prepared before the exam
            </li>
            <li>Test score will be shown at the end.
            </li>
            <li>Press Start to start the test.
            </li>

            <li>You can view your test score by clicking  <a href="viewScore.aspx"> Here  </a>
            </li>

        </ul>
        <br />
        <br />

        <asp:Button ID="Button1_submit" OnClick="Button1_submit_Click" CssClass="Button1_submit" runat="server" Text="Start" />
    </div>
</asp:Content>
