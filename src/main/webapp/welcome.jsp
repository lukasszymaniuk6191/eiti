<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<!-- saved from url=(0053)https://v4-alpha.getbootstrap.com/examples/dashboard/ -->
<html lang="en" ng-app="EitiWelcome">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style id="stndz-style"></style>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <title>EITI</title>
    <!-- Bootstrap core CSS -->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./resources/css/dashboard.css" rel="stylesheet">
    <%--Contacts--%>
    <link href="./resources/css/eiti/welcome.css" rel="stylesheet">

</head>

<body>
<nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
    <button class="navbar-toggler navbar-toggler-right hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">${user.name}</a>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Settings</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Help</a>
            </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-sm-3 col-md-2 hidden-xs-down bg-faded sidebar">
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Overview <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Reports</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Analytics</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Export</a>
                </li>
            </ul>

            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Nav item</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Nav item again</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">One more nav</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Another nav item</a>
                </li>
            </ul>

            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">Nav item again</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://v4-alpha.getbootstrap.com/examples/dashboard/#">One more nav</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link" onclick="document.forms['logoutForm'].submit()">Logout</a>
                </li>
            </ul>
        </nav>


        <main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
            <div class="row">
                <div class="one col-sm-9 col-md-9">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <form id="logoutForm" method="POST" action="${contextPath}/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </c:if>
                    <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
                        <div ng-controller="eitiWelcomeCtrl">

                            <div class="popup-box chat-popup">
                                <div class="popup-head">
                                    <div class="popup-head-left">xxx</div>
                                    <div class="popup-head-right"><a href="#">&#10005;</a></div>
                                    <div style="clear: both"></div>
                                </div>
                                <div class="popup-messages"></div>
                            </div>

                        </div>
                </div>
                <div class="two col-sm-3 col-md-3 hidden-xs-down bg-faded sidebar-contacts">
                    <div ng-controller="eitiWelcomeCtrl">

                        <div class="list-group" ng-repeat="x in users">
                            <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">{{ x.name + ' ' + x.lastname }}</h5>
                                    <small  <%--class="text-muted"--%> ng-style="isTheUserAvailable(x)">{{x.avilable}}</small>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>




   <%-- <div class="col-6 col-md-3 sidebar-offcanvas" id="sidebar">
        <div class="list-group">
            <a href="#" class="list-group-item active">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
        </div>
    </div><!--/span---%>

    </div>
</div>

<%-- Bootstrap core JavaScript
================================================== --%>
<script type="text/javascript" src="/resources/bower_components/angular/angular.min.js"></script>
<%--<script type="text/javascript" src="/resources/js/angular/angular.min.js"></script>--%>
<script type="text/javascript" src="/resources/js/eiti/welcome.js"></script>

<!-- Placed at the end of the document so the pages load faster -->
<script src="./resources/js/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="./resources/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="./resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<%--<script src="./resources/js/bootstrap.min.js"></script>--%>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="./resources/js/ie10-viewport-bug-workaround.js"></script>



</body></html>