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
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

    <title>Book info</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<h2 style="text-align: center; margin-top: 30px">${book.title}</h2>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <img src="${pageContext.request.contextPath}/resources/img/${book.id}.jpg" height="300" width="auto">
        </div>
        <div class="col-md-8">
            <c:if test="${bookAdded}">
                <div style="text-align: center">
                    <h4 style="color: green"><i class="fas fa-check"></i> Book added to cart</h4>
                </div>
            </c:if>

            <p><b>Author: </b>${book.author}</p>
            <p><b>ISBN: </b>${book.isbn}</p>
            <p><b>Price: </b>${book.price}</p>
            <p style="text-align: justify"><b>Description: </b>${book.description}</p>

            <sec:authorize access="isAuthenticated()">
                <div style="text-align: right">
                    <form:form action="${pageContext.request.contextPath}/shoppingCart/addBook/${book.id}" method="get">
                        <input name="qty" placeholder="Enter quantity" value="1" style="width: 35px; text-align: center"/>
                        <input type="submit" value="Order book" class="btn btn-success"/>
                    </form:form>
                </div>
            </sec:authorize>

            <sec:authorize access="!isAuthenticated()">
                <a href="${pageContext.request.contextPath}/showLoginPage">
                    <p>If you want to buy this book you should login!</p>
                </a>
            </sec:authorize>

            <a href="${pageContext.request.contextPath}/">
                <p>Go to home page</p>
            </a>
        </div>
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
