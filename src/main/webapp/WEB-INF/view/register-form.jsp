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
    <title>Register user</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>


<div class="container">
    <form:form action="${pageContext.request.contextPath}/saveUser" modelAttribute="user" method="post">
        <form:hidden path="id"/>

        <div class="form-group">
            <label>Name:</label>
            <form:input path="name" cssClass="form-control"/>
            <form:errors path="name" cssStyle="color: red"/>
        </div>
        <div class="form-group">
            <label>Password:</label>
            <form:password path="password" cssClass="form-control"/>
            <form:errors path="password" cssStyle="color: red"/>
        </div>
        <div class="form-group">
           <label>Email:</label>
           <form:input path="email" cssClass="form-control"/>
           <form:errors path="email" cssStyle="color: red"/>
        </div>
        <div class="form-group">
           <label>Phone:</label>
           <form:input path="phone" cssClass="form-control"/>
           <form:errors path="phone" cssStyle="color: red"/>
        </div>
        <div class="form-group">
           <label>Address:</label>
           <form:input path="address" cssClass="form-control"/>
           <form:errors path="address" cssStyle="color: red"/>
        </div>
        <tr>
           <label></label>
            <td><input type="submit" value="Save"/></td>
        </tr>
    </form:form>
</div>
</body>
</html>
