<!doctype html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/signin.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <title>Login form</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container" style="margin-top: 65px">
    <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST" class="form-signin">

        <!-- Place for messages: error, alert etc ... -->
        <div class="form-group">
            <div class="col-xs-15">
                <div>
                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                            Invalid username and password.
                        </div>
                    </c:if>

                    <c:if test="${param.logout != null}">
                        <div class="alert alert-success col-xs-offset-1 col-xs-10">
                            You have been logged out.
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <h2 class="form-signin-heading">Please log in</h2>


        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="username" id="inputEmail" class="form-control" placeholder="Email address" required
               autofocus>


        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>

        <%--<div class="checkbox">--%>
        <%--<label>--%>
        <%--<input type="checkbox" value="remember-me"> Remember me--%>
        <%--</label>--%>
        <%--</div>--%>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
    </form:form>

    <div style="text-align: center; margin-top: 50px">
        <p>Admin credentials</p>
        <p>Login - admin@gmail.com</p>
        <p>password - admin</p>
    </div>

</div>


<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
        integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
        integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
        crossorigin="anonymous"></script>
</body>
</html>
