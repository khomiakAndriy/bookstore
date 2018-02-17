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
    <title>Book list</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div class="container" style="margin-top: 15px">
    <div class="table-responsive">

        <a href="${pageContext.request.contextPath}/admin/book/addBook" class="btn btn-default"
           style="margin-bottom: 20px; margin-left: 135px" role="button">Add new book</a>

        <table id="booksTable" class="table table-striped table-hover">
            <thead style="background-color: dimgrey">
            <tr>
                <th>Title</th>
                <th>Aurhor</th>
                <th>ISBN</th>
                <th>Price</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="book" items="${books}">
                <c:url var="updateLink" value="/admin/book/update">
                    <c:param name="bookId" value="${book.id}"/>
                </c:url>
                <c:url var="deleteLink" value="/admin/book/delete">
                    <c:param name="bookId" value="${book.id}"/>
                </c:url>
                <tr>
                    <td> ${book.title}</td>
                    <td> ${book.author}</td>
                    <td> ${book.isbn}</td>
                    <td> $ ${book.price}</td>
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
        $("#booksTable").DataTable({
            "lengthMenu": [[5, 10, 15, 20, -1], [5, 10, 15, 20, "All"]],
//            "ordering": false,
            stateSave: true
        });
    });
</script>
</body>
</html>
