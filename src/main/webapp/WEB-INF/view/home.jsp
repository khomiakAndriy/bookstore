<!doctype html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <title>Home</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<c:if test="${emptyBookList}">
    <h2>Sorry!</h2>
</c:if>
<c:if test="${!emptyBookList}">
    <div class="container">
        <c:forEach var="book" items="${bookList}">
            <div class="row" style="margin-top: 25px">
                <div class="col-md-3">
                    <img src="${pageContext.request.contextPath}/resources/img/${book.id}.jpg" height="225" width="auto">
                </div>
                <div class="col-md-7">
                    <p><strong>${book.title}</strong></p>
                    <p><strong>${book.author}</strong></p>
                    <p><strong>$ ${book.price}</strong></p>
                    <div style="text-align: justify">
                            ${fn:substring(book.description, 0, 350)}
                    </div>
                </div>
                <div class="col-md-2">
                    <a href="${pageContext.request.contextPath}/book/info/${book.id}" class="btn btn-default" role="button">Show details</a>
                </div>
            </div>
        </c:forEach>
    </div>
</c:if>

<br/>

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
