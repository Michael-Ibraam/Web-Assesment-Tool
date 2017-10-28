<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebAppAssesmentTool.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        button.accordion {
            background-color: #eee;
            color: #444;
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
        $(document).ready(function () {
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


        });
    </script>


    <script>

        function Clicking(sender, args) {
            var radioList = document.getElementsByName('radioList');
            var radNotification1  = $find("<%= RadNotification1.ClientID %>");

            for (var i = 0; i < radioList.length; i++) {
                var radio = radioList[i].control;
                if (radio.get_selectedIndex() == -1)
                {
                    radNotification1.show();
                    args.set_cancel(true);
                    break;
                }
                args.set_cancel(false);
            }
            //args.set_cancel(!window.confirm("Are you sure you want to submit the page?"));
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="accordion" runat="server">
    </div>


    <asp:Label runat="server" ID="Label1" />

<%--        <asp:Button ID="Button1_submit" OnClientClick="Clicking(sender, args)"  CssClass="Button1_submit"  runat="server" Text="Submit" />--%>
    
    <telerik:RadButton Height="70" Width="100%" Skin="" RenderMode="Lightweight" ID="radbtn" runat="server" Text="Submit" OnClientClicking="Clicking" OnClick="Button1_submit_Click" CssClass="btn-success" Font-Size="Large">
    </telerik:RadButton>


    <asp:SqlDataSource ID="SqlDataSource_radioList" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT [answer_id], [answer_text] FROM [answers] WHERE ([question_id] = @question_id) ORDER BY NEWID() ">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="question_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" Text="One or more questions is not answered" runat="server" Animation="Slide" CloseButtonToolTip="Close" TitleIcon="warning" ContentIcon="warning" Title="Warning" AnimationDuration="500" Position="BottomRight" ShowCloseButton="true" EnableRoundedCorners="true" EnableShadow="true"></telerik:RadNotification>

</asp:Content>
