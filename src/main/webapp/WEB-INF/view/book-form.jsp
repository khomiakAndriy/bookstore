<!doctype html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <title>Book form</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div style="text-align: center">
    <h3>Book form</h3>
</div>

<div class="container">
    <form:form action="${pageContext.request.contextPath}/admin/book/saveBook?${_csrf.parameterName}=${_csrf.token}"
               enctype="multipart/form-data"
               modelAttribute="book" method="post">
        <form:hidden path="id"/>

        <div class="form-group">
            <label>Book title</label>
            <form:input path="title" cssClass="form-control"/>
            <form:errors path="title" cssStyle="color: red"/>
        </div>

        <div class="form-group">
            <label>Book author</label>
            <form:input path="author" cssClass="form-control"/>
            <form:errors path="author" cssStyle="color: red"/>
        </div>

        <div class="form-group">
            <label>ISBN</label>
            <form:input path="isbn" cssClass="form-control"/>
            <form:errors path="isbn" cssStyle="color: red"/>
        </div>

        <div class="form-group">
            <label>Description</label>
            <form:textarea path="description" cssClass="form-control"/>
            <form:errors path="description" cssStyle="color: red"/>
        </div>


        <div class="form-group">
            <label>Price</label>
            <form:input path="price" cssClass="form-control"/>
            <form:errors path="price" cssStyle="color: red"/>
        </div>

        <div class="form-group">
            <label>Book image</label>

            <form:input type="file" path="bookImage" class="form-control-file" aria-describedby="fileHelp"/>
            <small id="fileHelp" class="form-text text-muted">Select jpd file (must be 300*300 px size)</small>
        </div>

        <input type="submit" value="Save" class="btn btn-primary"/>
    </form:form>
</div>
</body>
</html>
