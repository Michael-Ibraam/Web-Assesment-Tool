<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebAppAssesmentTool.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
        button.accordion {
            background-color: #b6ff00;
            color: #0026ff;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
        }

        button.accordion.active, button.accordion:hover {
            background-color: #ddd;
        }

        button.accordion:after {
            content: '\002B';
            color: #777;
            font-weight: bold;
            float: right;
            margin-left: 5px;
        }

        button.accordion.active:after {
            content: "\2212";
        }

        div.panel {
            padding: 0 18px;
            background-color: white;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
        }
    </style>
    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].onclick = function () {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                }
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="accordion" role="tablist" aria-multiselectable="true" runat="server">
    

    </div>

    <button class="accordion">Section 1</button>
    <div class="panel">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>

    <asp:Label runat="server" ID="Label1" />

    <asp:Button ID="Button1_submit" CssClass="Button1_submit" OnClick="Button1_submit_Click" runat="server" Text="Submit" />
    <asp:SqlDataSource ID="SqlDataSource_radioList" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT [answer_id], [answer_text] FROM [answers] WHERE ([question_id] = @question_id) ORDER BY NEWID() ">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="question_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Slide" CloseButtonToolTip="Close" TitleIcon="warning" ContentIcon="warning" Title="Warning" AnimationDuration="500" Position="BottomRight" ShowCloseButton="true" EnableRoundedCorners="true" EnableShadow="true"></telerik:RadNotification>

</asp:Content>
