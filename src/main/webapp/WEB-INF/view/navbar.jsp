<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container-fluid" style="padding-left: 0px; padding-right: 0px; margin-bottom: 65px">
    <nav class="navbar navbar-toggleable-md fixed-top navbar-light">

        <a class="navbar-brand" href="${pageContext.request.contextPath}/">The bookstore</a>

        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/">Home </a>
            </li>
        </ul>

        <ul class="navbar-nav">
            <sec:authorize access="!isAuthenticated()">
                <li class="nav-item">
                    <a class="btn" href="${pageContext.request.contextPath}/showLoginPage">Log In</a>
                </li>

                <li class="nav-item">
                    <a class="btn" href="${pageContext.request.contextPath}/addUser">Register</a>
                </li>
            </sec:authorize>


            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="btn" href="${pageContext.request.contextPath}/shoppingCart/"><i
                            class="fas fa-shopping-cart"></i> Shopping Cart</a>
                </li>
                <li class="dropdown">
                    <a class="btn" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><i class="far fa-user-circle fa-lg"></i> My profile <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <li class="nav-item">
                                <a class="btn" href="${pageContext.request.contextPath}/admin/">Admin Portal</a>
                            </li>
                        </sec:authorize>

                        <li class="nav-item"><a class="btn" href="${pageContext.request.contextPath}/userInfo">Edit my info</a></li>
                        <li class="nav-item"><a class="btn" href="${pageContext.request.contextPath}/userOrders">My orders</a></li>

                        <li role="separator" class="divider"></li>
                        <li class="nav-item">
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" class="btn btn-warning" value="Log Out">
                            </form:form>
                        </li>
                    </ul>
                </li>
            </sec:authorize>
        </ul>
    </nav>
</div>
