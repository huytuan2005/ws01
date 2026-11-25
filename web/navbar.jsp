<%-- 
    Document   : home.jsp
    Created on : Oct 15, 2026, 10:32:56 AM
    Author     : phuct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <nav class="navbar navbar-expand-lg navbar-light bg-light border rounded">
    <div class="container-fluid">
        <span class="navbar-text">
            Welcome to <strong> ${sessionScope.userLoggedIn.account} </strong>[${sessionScope.userLoggedIn.lastName}${sessionScope.userLoggedIn.firstName}]
        </span>

        <ul class="navbar-nav me-auto">

            <li class="nav-item">
                <a class="nav-link active"
                   href="HomeController">
                    Home
                </a>
            </li>

            <c:if test="${sessionScope.userLoggedIn.roleInSystem == 1|| sessionScope.userLoggedIn.roleInSystem == 2}">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Accounts</a>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" href="AccountController?action=list">Account List</a>
                        </li>
                        <c:if test="${sessionScope.userLoggedIn.roleInSystem == 1}">
                            <li>
                                <a class="dropdown-item"href="AccountController?action=create">Create Account</a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:if>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle"
                   href="#"
                   role="button"
                   data-bs-toggle="dropdown">
                    Categories
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item"
                           href="CategoryController?action=list">
                            Category List
                        </a>
                    </li>

                    <c:if test="${sessionScope.userLoggedIn.roleInSystem == 1|| sessionScope.userLoggedIn.roleInSystem == 2 || sessionScope.userLoggedIn.roleInSystem == 4}">
                        <li>
                            <a class="dropdown-item"
                               href="CategoryController?action=create">
                                Create Category
                            </a>
                        </li>
                    </c:if>
                </ul>
            </li>

       
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle"
                   href="#"
                   role="button"
                   data-bs-toggle="dropdown">
                    Products
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item"
                           href="ProductController?action=list">
                            Product List
                        </a>
                    </li>

                    <c:if test="${sessionScope.userLoggedIn.roleInSystem == 1|| sessionScope.userLoggedIn.roleInSystem == 2|| sessionScope.userLoggedIn.roleInSystem == 3}">
                        <li>
                            <a class="dropdown-item"
                               href="ProductController?action=create">
                                Create Product
                            </a>
                        </li>
                    </c:if>
                </ul>
            </li>

        </ul>
        <c:choose>
        <c:when test="${sessionScope.userLoggedIn.gender}">
            <img src="${pageContext.request.contextPath}/images/img_avatar1.png"

                 width="35" height="35"
                 style="border-radius: 50%; object-fit: cover; margin-right: 10px;">
        </c:when>
        <c:otherwise>
            <img src="${pageContext.request.contextPath}/images/img_avatar2.png"
                 width="35" height="35"
                 style="border-radius: 50%; object-fit: cover; margin-right: 10px;">
        </c:otherwise>
    </c:choose>
        <a class="btn btn-outline-secondary btn-sm" href="LogoutController">Logout</a>
    </div>
</nav>
