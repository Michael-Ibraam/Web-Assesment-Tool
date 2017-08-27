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
            <h3>Register</h3>
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
<%--                            <asp:TextBox ID="TextBox_country" name="country" TextMode="SingleLine" placeholder="Country" required="" runat="server"></asp:TextBox>--%>
                            <telerik:RadComboBox EmptyMessage="Please Select" ID="ddlCountry" runat="server" Skin="Default" AllowCustomText="true" MarkFirstMatch="true">
                                <Items>
                                    <telerik:RadComboBoxItem Value="" Text="Please Select" />
                                    <telerik:RadComboBoxItem Value="AF" Text="Afghanistan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AL" Text="Albania"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="DZ" Text="Algeria"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AS" Text="American Samoa"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AD" Text="Andorra"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AO" Text="Angola"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AI" Text="Anguilla"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AQ" Text="Antarctica"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AG" Text="Antigua And Barbuda"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AR" Text="Argentina"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AM" Text="Armenia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AW" Text="Aruba"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AU" Text="Australia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AT" Text="Austria"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AZ" Text="Azerbaijan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BS" Text="Bahamas"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BH" Text="Bahrain"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BD" Text="Bangladesh"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BB" Text="Barbados"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BY" Text="Belarus"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BE" Text="Belgium"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BZ" Text="Belize"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BJ" Text="Benin"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BM" Text="Bermuda"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BT" Text="Bhutan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BO" Text="Bolivia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BA" Text="Bosnia And Herzegowina"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BW" Text="Botswana"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BV" Text="Bouvet Island"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BR" Text="Brazil"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="IO" Text="British Indian Ocean Territory"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BN" Text="Brunei Darussalam"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BG" Text="Bulgaria"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BF" Text="Burkina Faso"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="BI" Text="Burundi"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KH" Text="Cambodia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CM" Text="Cameroon"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CA" Text="Canada"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CV" Text="Cape Verde"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KY" Text="Cayman Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CF" Text="Central African Republic"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TD" Text="Chad"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CL" Text="Chile"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CN" Text="China"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CX" Text="Christmas Island"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CC" Text="Cocos (Keeling) Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CO" Text="Colombia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KM" Text="Comoros"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CG" Text="Congo"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CK" Text="Cook Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CR" Text="Costa Rica"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CI" Text="Cote D’Ivoire"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="HR" Text="Croatia (Local Name: Hrvatska)"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CU" Text="Cuba"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CY" Text="Cyprus"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CZ" Text="Czech Republic"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="DK" Text="Denmark"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="DJ" Text="Djibouti"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="DM" Text="Dominica"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="DO" Text="Dominican Republic"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TP" Text="East Timor"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="EC" Text="Ecuador"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="EG" Text="Egypt"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SV" Text="El Salvador"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GQ" Text="Equatorial Guinea"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ER" Text="Eritrea"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="EE" Text="Estonia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ET" Text="Ethiopia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="FK" Text="Falkland Islands (Malvinas)"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="FO" Text="Faroe Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="FJ" Text="Fiji"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="FI" Text="Finland"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="FR" Text="France"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GF" Text="French Guiana"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PF" Text="French Polynesia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TF" Text="French Southern Territories"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GA" Text="Gabon"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GM" Text="Gambia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GE" Text="Georgia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="DE" Text="Germany"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GH" Text="Ghana"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GI" Text="Gibraltar"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GR" Text="Greece"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GL" Text="Greenland"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GD" Text="Grenada"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GP" Text="Guadeloupe"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GU" Text="Guam"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GT" Text="Guatemala"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GN" Text="Guinea"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GW" Text="Guinea-Bissau"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GY" Text="Guyana"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="HT" Text="Haiti"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="HM" Text="Heard And Mc Donald Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="VA" Text="Holy See (Vatican City State)"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="HN" Text="Honduras"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="HK" Text="Hong Kong"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="HU" Text="Hungary"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="IS" Text="Ice Land"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="IN" Text="India"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ID" Text="Indonesia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="IR" Text="Iran (Islamic Republic Of)"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="IQ" Text="Iraq"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="IE" Text="Ireland"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="IL" Text="Israel"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="IT" Text="Italy"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="JM" Text="Jamaica"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="JP" Text="Japan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="JO" Text="Jordan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KZ" Text="Kazakhstan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KE" Text="Kenya"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KI" Text="Kiribati"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KP" Text="Korea, Dem People’S Republic"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KR" Text="Korea, Republic Of"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KW" Text="Kuwait"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KG" Text="Kyrgyzstan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LA" Text="Lao People’S Dem Republic"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LV" Text="Latvia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LB" Text="Lebanon"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LS" Text="Lesotho"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LR" Text="Liberia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LY" Text="Libyan Arab Jamahiriya"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LI" Text="Liechtenstein"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LT" Text="Lithuania"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LU" Text="Luxembourg"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MO" Text="Macau"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MK" Text="Macedonia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MG" Text="Madagascar"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MW" Text="Malawi"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MY" Text="Malaysia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MV" Text="Maldives"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ML" Text="Mali"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MT" Text="Malta"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MH" Text="Marshall Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MQ" Text="Martinique"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MR" Text="Mauritania"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MU" Text="Mauritius"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="YT" Text="Mayotte"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MX" Text="Mexico"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="FM" Text="Micronesia, Federated States"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MD" Text="Moldova, Republic Of"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ME" Text="Montenegro"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MC" Text="Monaco"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MN" Text="Mongolia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MS" Text="Montserrat"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MA" Text="Morocco"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MZ" Text="Mozambique"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MM" Text="Myanmar"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NA" Text="Namibia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NR" Text="Nauru"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NP" Text="Nepal"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NL" Text="Netherlands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AN" Text="Netherlands Ant Illes"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NC" Text="New Caledonia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NZ" Text="New Zealand"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NI" Text="Nicaragua"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NE" Text="Niger"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NG" Text="Nigeria"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NU" Text="Niue"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NF" Text="Norfolk Island"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="MP" Text="Northern Mariana Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="NO" Text="Norway"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="OM" Text="Oman"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PK" Text="Pakistan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PW" Text="Palau"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PA" Text="Panama"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PG" Text="Papua New Guinea"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PY" Text="Paraguay"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PE" Text="Peru"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PH" Text="Philippines"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PN" Text="Pitcairn"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PL" Text="Poland"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PT" Text="Portugal"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PR" Text="Puerto Rico"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="QA" Text="Qatar"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="RE" Text="Reunion"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="RO" Text="Romania"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="RU" Text="Russian Federation"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="RW" Text="Rwanda"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="KN" Text="Saint K Itts And Nevis"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LC" Text="Saint Lucia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="VC" Text="Saint Vincent, The Grenadines"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="WS" Text="Samoa"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SM" Text="San Marino"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ST" Text="Sao Tome And Principe"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SA" Text="Saudi Arabia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SN" Text="Senegal"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="RS" Text="Serbia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SC" Text="Seychelles"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SL" Text="Sierra Leone"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SG" Text="Singapore"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SK" Text="Slovakia (Slovak Republic)"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SI" Text="Slovenia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SB" Text="Solomon Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SO" Text="Somalia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ZA" Text="South Africa"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GS" Text="South Georgia , S Sandwich Is."></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ES" Text="Spain"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="LK" Text="Sri Lanka"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SH" Text="St. Helena"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="PM" Text="St. Pierre And Miquelon"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SD" Text="Sudan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SR" Text="Suriname"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SJ" Text="Svalbard, Jan Mayen Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SZ" Text="Swaziland"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SE" Text="Sweden"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="CH" Text="Switzerland"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="SY" Text="Syrian Arab Republic"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TW" Text="Taiwan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TJ" Text="Tajikistan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TZ" Text="Tanzania, United Republic Of"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TH" Text="Thailand"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TG" Text="Togo"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TK" Text="Tokelau"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TO" Text="Tonga"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TT" Text="Trinidad And Tobago"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TN" Text="Tunisia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TR" Text="Turkey"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TM" Text="Turkmenistan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TC" Text="Turks And Caicos Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="TV" Text="Tuvalu"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="UG" Text="Uganda"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="UA" Text="Ukraine"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="AE" Text="United Arab Emirates"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="GB" Text="United Kingdom"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="US" Text="United States"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="UM" Text="United States Minor Is."></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="UY" Text="Uruguay"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="UZ" Text="Uzbekistan"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="VU" Text="Vanuatu"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="VE" Text="Venezuela"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="VN" Text="Viet Nam"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="VG" Text="Virgin Islands (British)"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="VI" Text="Virgin Islands (U.S.)"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="WF" Text="Wallis And Futuna Islands"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="EH" Text="Western Sahara"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="YE" Text="Yemen"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ZR" Text="Zaire"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ZM" Text="Zambia"></telerik:RadComboBoxItem>
                                    <telerik:RadComboBoxItem Value="ZW" Text="Zimbabwe"></telerik:RadComboBoxItem>
                                </Items>
                            </telerik:RadComboBox>

                        </td>
                    </tr>
                </table>
                <telerik:RadNotification ID="RadNotification1" runat="server"></telerik:RadNotification>
            </fieldset>

        </div>
        <%-- <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>--%>
    </div>

    <div align="center">


        <asp:Button ID="Button1_submit" CssClass="Button1_submit" OnClick="RadButton_submit_Click" runat="server" Text="Submit" />

    </div>


</asp:Content>
