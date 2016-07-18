<%--
  Created by IntelliJ IDEA.
  User: yue
  Date: 7/18/16
  Time: 3:00 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Timelines Application</title>

    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>-->
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <!--
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
    -->
    <!--Import bootstrap-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <asset:stylesheet src="bootstrap/bootstrap.css"/>
    <asset:stylesheet src="bootstrap/bootstrap-theme.css"/>
    <asset:stylesheet src="styles.css"/>

    <link rel="stylesheet" href="@routes.Assets.at("lib/leaflet/leaflet.css")" />

    <link rel="shortcut icon" type="image/png" href="@routes.Assets.at("images/clock.png")">

    <script type="text/javascript" src="@routes.Assets.at("javascripts/bootstrap.min.js")"></script>
    <script data-main="@routes.Assets.at("javascripts/main.js")" type="text/javascript" src="@routes.Assets.at("lib/requirejs/require.js")"></script>


    <script src="https://cdn.firebase.com/js/client/2.3.2/firebase.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.0.0/lodash.min.js"></script>

</head>

<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>

<header>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="@routes.Timelines.index()">Timelines</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a data-toggle="modal" data-target="#notification"><i class="material-icons">mail_outline</i></a></li>
                    <li><a data-toggle="modal" data-target="#exampleModal"><i class="material-icons">border_color</i></a></li>
                    <li><a href="#menu-toggle" id="menu-toggle"><i class="material-icons">format_list_bulleted</i></a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

</header>

<!-- first section - Home -->
<div id="home" class="home">
    <div class="text-vcenter">
        <h1>Timelines</h1>

        <div class="StreamsHero-buttonContainer">
            <a class="Button StreamsSignUp js-nav js-signup" data-component="hero" data-element="buttons" href="@routes.SignUp.index()">Sign up</a>
            <a class="Button StreamsSignUp js-nav js-signup" data-component="hero" data-element="buttons" href="@routes.SignUp.index()">Login</a>
            <!--<button class="Button StreamsLogin js-login" type="submit" data-toggle="modal" data-target="#loginModal">Log In</button>-->
        </div>
    </div>
</div>
<!-- /first section -->

<ul class="nav nav-pills nav-justified">
    <li role="presentation" class="active"><a href="@routes.Timelines.index()">Home</a></li>
    <li role="presentation"><a href="@routes.Profile.user_profile()">Profile</a></li>
    <li role="presentation"><a href="#">Friends</a></li>
    <li role="presentation"><a href="@routes.Stats.index()">Stats</a></li>
</ul>
<div id="br-line"></div>

<div class="container">
    <div data-bind="if: disconnected">

        <div class="row" id="feed-group">

            @for(item<-things){
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <img src="@routes.Assets.at("images/clock.png")" alt="..." style="height:30px;weight:30px;">
                    <div class="caption">
                        <h3>@item.getAuthor()</h3>
                        <p>@item.getText()</p>
                        <p id="icons-group"><i class="material-icons">favorite</i> <i class="material-icons">comment</i></p>
                    </div>
                </div>
            </div>
            }

        </div>
        <!--
        <button class="btn btn-primary" data-bind="click: submitEmail">Connect</button>
        -->
    </div>

    <div data-bind="if: connecting">
        <span data-bind="text: connecting"></span>
    </div>

    <div class="row maps" data-bind="ifnot: disconnected">
        <!--<div data-bind="css: {'col-md-12': mockGps() == null, 'col-md-8': mockGps() != null}" id="map"></div>-->
        <!--<div class="mockGpsContainer col-md-4">-->
        <!--<div id="mockGps"></div>-->
        <!--</div>-->
    </div>

</div> <!--End of container-->

<!--
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="/login" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">User Login</h4>
                </div>
                <div class="modal-body">
                        <div class="form-group">
                            <div class="right-inner-addon">
                                <i class="fa fa-envelope"></i>
                                <input class="form-control input-lg" placeholder="Email Address" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="right-inner-addon">
                                <i class="fa fa-key"></i>
                                <input class="form-control input-lg" placeholder="Password" type="password">
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <a href="#">Forgot password? </a>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Login</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    -->
<!--New Post Modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <form action="/app/entry" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                    <h4 class="modal-title" id="exampleModalLabel">Oops</h4>
                </div>
                <div id="postModal" class="modal-body">

                    <p>You must login first!</p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!--End of New Post Modal-->
</body>
</html>