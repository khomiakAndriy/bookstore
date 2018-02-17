<!doctype html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <title>Success</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div style="text-align: center; margin-top: 20px">
    <h3>Order info</h3>
    <p>Order № <b>${order.id}</b></p>
    <c:if test="${adminPage}">
        <p>User name: <b>${order.user.name}</b></p>
    </c:if>
    <p>
        Order date: <b><fmt:formatDate pattern="yyyy-MM-dd" value="${localDateTimeFormat.parse(order.dateTime)}"/></b>
    </p>
    <p>Order status: <b>${order.status}</b></p>
    <p>Order address: <b>${order.shippingAddress}</b></p>
    <p>Order sum: <b>$ ${order.totalAmount}</b></p>
    <c:if test="${!adminPage}">
        <p>Your order will be checked in few hours. Thank you for your visit.</p>
    </c:if>
    <c:if test="${adminPage}">
        <a href="${pageContext.request.contextPath}/admin/orders">Back to all orders</a>
    </c:if>



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
