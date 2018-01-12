<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User list</title>
</head>
<body>

<table>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Roles</th>
        <th>Update</th>
    </tr>

    <c:forEach var="user" items="${users}">
        <c:url var="updateLink" value="/admin/update">
            <c:param name="userId" value="${user.id}"/>
        </c:url>
        <tr>
            <td> ${user.name}</td>
            <td> ${user.email}</td>
            <td> ${user.phone}</td>
            <td> ${user.roles}</td>
            <td><a href="${updateLink}">Update</a> </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
