﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebAppAssesmentTool.st.login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Home</title>

    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/jumbotron.css" rel="stylesheet" />

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <a class="navbar-brand" target="_blank" href="https://www.hs-mittweida.de/">Hochschule Mittweida</a>
            <div id="navbar" class="navbar-collapse collapse">
                <form class="navbar-form navbar-right" runat="server" id="form1">
                    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
                        <LayoutTemplate>
                            <asp:TextBox ID="UserName" class="form-control" runat="server" placeholder="Email Address" TextMode="Email" required=""></asp:TextBox>
                            <asp:TextBox ID="Password" class="form-control" runat="server" placeholder="Password" required="" TextMode="Password"></asp:TextBox>
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn btn-success" Text="Sign In" ValidationGroup="Login1" />
                            <a href="st/register.aspx">
                                <button type="button" class="btn btn-link">Register</button>
                            </a>
                            <span style="color: red">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False">  
                                </asp:Literal>
                            </span>
                        </LayoutTemplate>
                    </asp:Login>
                </form>
                <form id="form2" class="navbar-form navbar-right" visible="false" runat="server">
                    <ul class="nav navbar-nav navbar-form navbar-right">
                        <li><a href="~/login.aspx" runat="server">Home</a></li>
                        <li><a href="~/st/info.aspx" runat="server">Take the Test</a></li>
                        <li>
                            <asp:LoginStatus runat="server" ID="LoginStatus2" CssClass=" btn btn-default btn-sm glyphicon glyphicon-log-out" />
                        </li>
                    </ul>
                </form>
            </div>
            <!--/.navbar-collapse -->
        </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container">
            <h2>Welcome to Hochschule Mittweida online assesment tool </h2>
            <p>This is an online assesment tool for Hochschule Mittweida, if it's your first visit here please create an account so you can be able to take the test. </p>
            <p id ="registerBtn" runat="server" visible="true"><a class="btn btn-primary btn-lg" href="st/register.aspx" role="button">Register Here &raquo;</a></p>
        </div>
    </div>

    <%--<div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
        </div>

        <hr>

        <footer>
            <p>&copy; 2016 HS Mittweida</p>
        </footer>
    </div>--%>
    <!-- /container -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
