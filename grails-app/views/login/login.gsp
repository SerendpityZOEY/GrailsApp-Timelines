<html>
<head>
    <title>Login page</title>

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
    <asset:javascript src="angular.js" />

    <asset:stylesheet src="bootstrap/bootstrap.css"/>
    <asset:stylesheet src="bootstrap/bootstrap-theme.css"/>
    <asset:stylesheet src="styles.css"/>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>

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

<div class="row">
    <div class="col-md-8">
        <h3 class="text-center">How to Use</h3>
        <p id="how-to-use">
            <b>Description:</b> This is a personal journaling web app that allows a user to view life events and
        changes as time series graphs. Users can make quick entries to track life events, thoughts, and
        mood using tags, images, and text. These entries can also be shared with other users.
            <br><b>Description:</b> This is a personal journaling web app that allows a user to view life events and
        changes as time series graphs. Users can make quick entries to track life events, thoughts, and
        mood using tags, images, and text. These entries can also be shared with other users.
            <br><b>Description:</b> This is a personal journaling web app that allows a user to view life events and
        changes as time series graphs. Users can make quick entries to track life events, thoughts, and
        mood using tags, images, and text. These entries can also be shared with other users.
            <br><b>Description:</b> This is a personal journaling web app that allows a user to view life events and
        changes as time series graphs. Users can make quick entries to track life events, thoughts, and
        mood using tags, images, and text. These entries can also be shared with other users.
        </p>
    </div>

    <div class="col-md-4 col-lg-pull-1">
        <br>
        <!-- Nav tabs -->
        <div class="text-center">
            <div class="btn-group">
                <a href="#new" role="tab" data-toggle="tab" class="big btn btn-default"><i class="fa fa-plus"></i> New User</a>
                <a href="#user" role="tab" data-toggle="tab" class="big btn btn-primary"><i class="fa fa-user"></i> I have account</a>
            </div>
        </div>
        <p class="click2select">Click to select</p>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="new">
                <br>
                <g:form name="myForm1" url="[action:'redirectUserProfile',controller:'Login']">
                    <fieldset>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="right-inner-addon">
                                        <i class="fa fa-user"></i>
                                        <input class="form-control input-lg" placeholder="First Name" name="first-name" type="text">
                                    </div><!-- /input-group -->
                                </div><!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="right-inner-addon">
                                        <i class="fa fa-user"></i>
                                        <input class="form-control input-lg" placeholder="Last Name" name="last-name" type="text">
                                    </div><!-- /input-group -->
                                </div><!-- /.col-lg-6 -->
                            </div><!-- /.row -->
                        </div>

                        <div class="form-group">
                            <div class="right-inner-addon">
                                <i class="fa fa-envelope"></i>
                                <input class="form-control input-lg" placeholder="Email Address" name="email" type="text">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="right-inner-addon">
                                <i class="fa fa-key"></i>
                                <input class="form-control input-lg" placeholder="Password" name="password" type="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="right-inner-addon">
                                <i class="fa fa-key"></i>
                                <input class="form-control input-lg" placeholder="Confirm Password" id="" name="password-confirm" type="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="right-inner-addon">
                                <i class="fa fa-calendar"></i>
                                <input class="form-control input-lg" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
                            </div>
                        </div>
                    </fieldset>
                    <div class=" text-center">
                        <button class="btn btn-success" value="signup">Sign Up</button>
                    </div>
                </g:form>
            </div>

        <div class="tab-pane fade" id="user">
        <g:form name="myForm" url="[action:'redirectUserProfile',controller:'Login']">
            <fieldset>
                <div class="form-group">
                    <div class="right-inner-addon">
                        <i class="fa fa-envelope"></i>
                        <input class="form-control input-lg" name="username" placeholder="Username" type="text" value="${userName}"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="right-inner-addon">
                        <i class="fa fa-key"></i>
                        <input class="form-control input-lg" name="pswrd" placeholder="Password" type="password"/>
                    </div>
                </div>
            </fieldset>
            <br>
            <div class=" text-center">
                <g:actionSubmit class="btn btn-success" action="redirectUserProfile" value="Login"/>
            </div>
        </g:form>
        </div>
    </div>

</div>





</body>
</html>