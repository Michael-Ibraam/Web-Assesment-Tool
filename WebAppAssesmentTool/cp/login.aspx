<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebAppAssesmentTool.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Login ID="Login1"
                runat="server"
                BackColor="#EFF3FB"
                BorderColor="#B5C7DE"
                BorderPadding="4"
                BorderStyle="Solid"
                BorderWidth="1px"
                Font-Names="Verdana"
                Font-Size="0.8em"
                ForeColor="#333333"
                OnAuthenticate="Login1_Authenticate"
                UserNameRequiredErrorMessage="User Name is required"
                PasswordRequiredErrorMessage="Password is required"
                InstructionText="Please enter your email address and password in the corresponding fields for login"
                UserNameLabelText="Email:">

                <LoginButtonStyle
                    BackColor="White"
                    BorderColor="#507CD1"
                    BorderStyle="Solid"
                    BorderWidth="1px"
                    Font-Names="Verdana"
                    Font-Size="0.8em"
                    ForeColor="#284E98" />

                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <TextBoxStyle Font-Size="0.8em" />

                <TitleTextStyle
                    BackColor="#507CD1"
                    Font-Bold="True"
                    Font-Size="0.9em"
                    ForeColor="White" />

                <ValidatorTextStyle ForeColor="Red" />

            </asp:Login>


        </div>
    </form>
</body>
</html>
