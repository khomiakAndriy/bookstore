<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <title>Orders list</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div class="container" style="margin-top: 15px">
    <div class="table-responsive">

        <table id="ordersTable" class="table table-striped table-hover">
            <thead style="background-color: dimgrey">
            <tr>
                <th>Id</th>
                <th>Date</th>
                <th>User name</th>
                <th style="text-align: center">Amount</th>
                <th style="text-align: center">Status</th>
                <th style="text-align: center">Delete</th>
                <th style="text-align: center">Order info</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td> ${order.id}</td>
                    <td> ${order.dateTime} </td>
                    <td> ${order.user.name}</td>
                    <td style="text-align: center"> ${order.totalAmount}</td>
                    <td style="text-align: center"><a href="${pageContext.request.contextPath}/order/changeStatus/${order.id}">${order.status}</a></td>
                    <td style="text-align: center"><a href="${pageContext.request.contextPath}/order/deleteOrder/${order.id}">Delete</a></td>
                    <td style="text-align: center"><a href="${pageContext.request.contextPath}/order/showOrder/${order.id}">Info</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<script>
    $(document).ready(function () {
        $("#ordersTable").DataTable({
            "lengthMenu": [[5, 10, 15, 20, -1], [5, 10, 15, 20, "All"]],
//            "ordering": true,
            stateSave: true
        });
    });
</script>
</body>
</html>
