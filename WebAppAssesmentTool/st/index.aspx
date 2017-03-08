<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebAppAssesmentTool.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div id="accordion" role="tablist" aria-multiselectable="true" runat="server">

<%--            <div class="card">
                <div id="heading1" class="card-header" role="tab" >
                    <h5 class="mb-0">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false" aria-controls="collapse1">Collapsible Group Item #2
                        </a>
                    </h5>
                </div>

                <div id="collapse1" class="collapse" role="tabpanel" aria-labelledby="heading1">
                    <div class="card-block">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="headingThree">
                    <h5 class="mb-0">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Collapsible Group Item #3
                        </a>
                    </h5>
                </div>
                <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="card-block">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>--%>
        </div>


    <asp:Button ID="Button1_submit" CssClass="Button1_submit" OnClick="Button1_submit_Click" runat="server" Text="Submit" />

    <asp:SqlDataSource ID="SqlDataSource_radioList" runat="server" ConnectionString="<%$ ConnectionStrings:math_media_project_dbConnectionString %>" SelectCommand="SELECT [answer_id], [answer_text] FROM [answers] WHERE ([question_id] = @question_id) ORDER BY NEWID() ">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="question_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Slide" CloseButtonToolTip="Close" TitleIcon="warning" ContentIcon="warning" Title="Warning" AnimationDuration="500" Position="BottomRight" ShowCloseButton="true" EnableRoundedCorners="true" EnableShadow="true"></telerik:RadNotification>

</asp:Content>
