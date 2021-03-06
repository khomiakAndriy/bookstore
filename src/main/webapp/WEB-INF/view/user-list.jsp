<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>User list</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div class="container" style="margin-top: 15px">
    <div class="table-responsive">

        <table id="usersTable" class="table table-striped table-hover">
            <thead style="background-color: dimgrey">
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Roles</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="user" items="${users}">
                <c:url var="updateLink" value="/admin/update">
                    <c:param name="userId" value="${user.id}"/>
                </c:url>
                <c:url var="deleteLink" value="/admin/delete">
                    <c:param name="userId" value="${user.id}"/>
                </c:url>
                <tr>
                    <td> ${user.name}</td>
                    <td> ${user.email}</td>
                    <td> ${user.phone}</td>
                    <td> ${user.roles}</td>
                    <td><a href="${updateLink}">Update</a></td>
                    <td><a href="${deleteLink}">Delete</a></td>
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
        $("#usersTable").DataTable({
            "lengthMenu": [[5, 10, 15, 20, -1], [5, 10, 15, 20, "All"]],
//            "ordering": true,
            stateSave: true
        });
    });
</script>
</body>
</html>
