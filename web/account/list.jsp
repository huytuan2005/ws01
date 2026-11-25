<%-- 
    Document   : list
    Created on : Oct 15, 2026, 3:35:23 PM
    Author     : phuct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <title>List Account</title>
    </head>
    <body>
        <%@include file="../navbar.jsp" %>
        <div class="container mt-3">
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Account</th>
                        <th>Password</th>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Birthday</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Is Use</th>
                        <th>Role</th>
                        <th colspan="2" class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ac" items="${list}" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${ac.account}</td>
                            <td>${ac.pass}</td>
                            <td>${ac.lastName}</td>
                            <td>${ac.firstName}</td>
                            <td>${ac.birthday}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${ac.gender}">Male</c:when>
                                    <c:otherwise>Female</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${ac.phone}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${ac.isUse}">Active</c:when>
                                    <c:otherwise>InActive</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${ac.roleInSystem}</td>
                            <td>
                                <a href="AccountController?action=update&account=${ac.account}"
                                   class="btn btn-primary">
                                    Update
                                </a>
                            </td>
                            <td>
                                <form action="AccountController"
                                      method="post"
                                      onsubmit="return confirm('Are you sure you want to delete this account?');">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="account" value="${ac.account}">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty list}">
                        <tr>
                            <td colspan="12" class="text-center">
                                No accounts found.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
            <p>${error}</p>
            <p>${success}</p>
        </div>
    </div>
    </body>
</html>
