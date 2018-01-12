<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: CGMD
  Date: 10.01.2018
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register user</title>
</head>
<body>
<h3>Save user</h3>

<form:form action="${pageContext.request.contextPath}/saveUser" modelAttribute="user" method="post">
    <form:hidden path="id"/>
    <table>
        <tbody>
        <tr>
            <td><label>Name:</label></td>
            <td><form:input path="name"/></td>
            <td><form:errors path="name" cssStyle="color: red"/></td>
        </tr>
        <tr>
            <td><label>Password:</label></td>
            <td><form:input path="password"/></td>
            <td><form:errors path="password" cssStyle="color: red"/></td>
        </tr>
        <tr>
            <td><label>Email</label></td>
            <td><form:input path="email"/></td>
            <td><form:errors path="email" cssStyle="color: red"/></td>
        </tr>
        <tr>
            <td><label>Phone:</label></td>
            <td><form:input path="phone"/></td>
            <td><form:errors path="phone" cssStyle="color: red"/></td>
        </tr>
        <tr>
            <td><label>Address:</label></td>
            <td><form:input path="address"/></td>
            <td><form:errors path="address" cssStyle="color: red"/></td>
        </tr>
        <tr>
            <td><label></label></td>
            <td><input type="submit" value="Save"/></td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>
