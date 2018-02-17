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
    <title>Order confirmation</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
    <div style="text-align: center; margin-top: 5px; margin-bottom: 5px">
        <h4>Please check information and add order address</h4>
    </div>
    <table class="table table-striped table-hover">
        <thead style="background-color: dimgrey">
        <tr>
            <th>Book</th>
            <th style="text-align: center">Book author</th>
            <th style="text-align: center">Quantity</th>
            <th style="text-align: center">Price</th>
            <th style="text-align: center">Amount</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cartItem" items="${cartItems}">
            <tr>
                <td>${cartItem.book.title}</td>
                <td>${cartItem.book.author}</td>
                <td style="text-align: center">${cartItem.qty}</td>
                <td style="text-align: center">${cartItem.book.price}</td>
                <td style="text-align: center">${cartItem.amount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <p>Total amount of shopping cart is: <b>$ ${totalAmount}</b></p>
    <a href="${pageContext.request.contextPath}/shoppingCart/">Make changes to my order</a>

    <form:form action="${pageContext.request.contextPath}/order/createOrder/">
        <div class="form-group" style="margin-top: 5px">
            <label>Address: </label>
            <input class="form-control" name="address" placeholder="Enter order address" required >
        </div>
        <input type="submit" value="Submit order" class="btn btn-success"/>
    </form:form>
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
