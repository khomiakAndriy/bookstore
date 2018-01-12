<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h3>HOME</h3>

<a href="${pageContext.request.contextPath}/users">Show all users</a>
<br/>
<a href="${pageContext.request.contextPath}/addUser">Add user</a>

<br/>

<form:form action="${pageContext.request.contextPath}/logout" method="POST">
    <input type="submit" value="Logout"/>

</form:form>
</body>
</html>
