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
    <title>ShoppingCart</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div style="text-align: center">
    <p>Your name: <b>${user.name}</b></p>
</div>
<c:if test="${emptyShoppingCart}">
    <p style="text-align: center">Sorry! Your shopping cart is empty! Try to order a book</p>
</c:if>

<div class="container"></div>
<c:if test="${!emptyShoppingCart}">
    <div class="container">
        <table class="table table-striped table-hover">
            <thead style="background-color: dimgrey">
            <tr>
                <th>Book</th>
                <th style="text-align: center">Book author</th>
                <th style="text-align: center">Quantity</th>
                <th style="text-align: center">Price</th>
                <th style="text-align: center">Amount</th>
                <th style="text-align: center">Action</th>
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
                    <td style="text-align: center"><a
                            href="${pageContext.request.contextPath}/shoppingCart/deleteCartItem/${cartItem.id}"
                            class="btn btn-danger" role="button">Delete book</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="row">
            <div class="col-md-10">
                <p>Total amount of shopping cart is: <b>$ ${shoppingCart.totalAmount}</b></p>
            </div>
            <div class="col-md-2">
                <a href="${pageContext.request.contextPath}/order/preOrder/" class="btn btn-primary" role="button">Next <i class="fas fa-angle-right"></i></a>
            </div>
        </div>
    </div>
</c:if>

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
