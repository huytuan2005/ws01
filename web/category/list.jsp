<%-- 
    Document   : list
    Created on : Oct 15, 2026, 3:40:15 PM
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
        <title>List Category</title>
    </head>
    <body>
        <%@include file="../navbar.jsp" %>
        <div class="container mt-3">
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Type Id</th>    
                        <th>Category Name</th>
                        <th>Memo</th>
                        <th colspan="2" class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ca" items="${list}" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${ca.typeId}</td>
                            <td>${ca.categoryName}</td>
                            <td>${ca.memo}</td>
                            <td>
                                <a href="CategoryController?action=update&typeId=${ca.typeId}"
                                   class="btn btn-primary">
                                    Update
                                </a>
                            </td>
                            <td>
                                <form action="CategoryController"
                                      method="post"
                                      onsubmit="return confirm('Are you sure you want to delete this category?');">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="typeId" value="${ca.typeId}">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty list}">
                        <tr>
                            <td colspan="6" class="text-center">
                                No categories found.
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
