<html>
<head>
    <title>Login page</title>
    <asset:javascript src="angular.js" />


    <asset:stylesheet src="bootstrap/bootstrap.css"/>
    <asset:stylesheet src="bootstrap-material-design/material.css"/>
    <asset:stylesheet src="bootstrap-material-design/ripples.css"/>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">

    <!--Import stylesheet for Leaflet to work-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/leaflet.css" />
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>

<nav class="navbar navbar-default" role="navigation" style="background-color: #59CEEF;">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#not-google-plus-nav">
                <span class="sr-only">Toggle Navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!--
            <a class="navbar-brand" href="/">
                <asset:image src="medialistener-logo-1680x405.png" style="height:100%;"/>
            </a>-->
        </div> <!-- ./navbar-header -->

        <div class="collapse navbar-collapse" id="not-google-plus-nav">
            <ul class="nav navbar-nav pull-right">
                <li><a href="/login">Login</a></li>
                <li><a href="/register">Register</a></li>
            </ul>
        </div> <!-- /.collapse.navbar-collapse -->
    </div> <!-- /.container-fluid -->
</nav>

        <h3 style="font-family:Comic Sans Ms;text-align="center";font-size:20pt;
    color:#00FF00;> Login Page</h1>


        <g:form name="myForm" url="[action:'redirectUserProfile',controller:'Login']">
            <div class="form-group">
                <div class="col-sm-4">
                    Username &nbsp;   <input type="text" name="userName" value="${userName}"/> <br><br>
                    Password &nbsp; <input type="password" name="pswrd"/> <br><br>

                    <div class="col-sm-8">
                        <g:actionSubmit class="btn btn-success" action="redirectUserProfile" value="Login"/>
                        <button class="btn btn-warning" onclick="reset"> Reset </button>
                    </div>
                </div>
            </div>

        </g:form>




</body>
</html>