<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebAppAssesmentTool.st.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../css/main.css" />
    <script>
        function myFunction() {
            var x = document.getElementById("<%=radTextBox_password.ClientID %>");
            var y = document.getElementById("<%=radTextBox_retypePassword.ClientID%>");
            var z = document.getElementById("<%=TextBox_active.ClientID%>");


            if (x.value == y.value) {
                z.value = "Matching Password";
            }
            else {
                z.value = "Non-Matching Password";
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>
    <div class="row">
        
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
        <h1>Sign Up</h1>
        <fieldset>
            <table>
                <tr>
                    <td>
                        <label for="TextBox_first_name">First Name:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox_first_name" name="first_name" TextMode="SingleLine" placeholder="First Name" required="" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="TextBox_last_name">Last Name:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox_last_name" name="last_name" TextMode="SingleLine" placeholder="Last Name" required="" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="TextBox_email">Email:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox_email" name="email" TextMode="Email" placeholder="Email" required="" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="TextBox_password">Password:</label></td>
                    <td>
                        <telerik:RadTextBox required="required" PasswordStrengthSettings-ShowIndicator="true" ID="radTextBox_password" runat="server" TextMode="Password" ClientEvents-OnValueChanged="myFunction"></telerik:RadTextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="TextBox_retypePassword">Retype Password:</label></td>
                    <td>
                        <telerik:RadTextBox ID="radTextBox_retypePassword" required="required" TextMode="Password" runat="server" ClientEvents-OnValueChanged="myFunction"></telerik:RadTextBox>

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="TextBox_active" Text="Not Matching" TextMode="SingleLine" Enabled="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="TextBox_birth_date">Birth Date:</label></td>
                    <td>
                        <asp:TextBox ID="TextBox_birth_date" name="birth_date" TextMode="Date" placeholder="Birth Date" required="" runat="server">

                        </asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <label for="TextBox_country">Country:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox_country" name="country" TextMode="SingleLine" placeholder="Country" required="" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <telerik:RadNotification ID="RadNotification1" runat="server"></telerik:RadNotification>
        </fieldset>        

        </div>
        <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
    </div>

    <div align="center">


        <asp:Button ID="Button1_submit" CssClass="Button1_submit" OnClick="RadButton_submit_Click" runat="server" Text="Submit" />

    </div>


</asp:Content>
