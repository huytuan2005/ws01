<%-- 
    Document   : edit
    Created on : Oct 15, 2026, 3:40:09 PM
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
        <title>Update Category</title>
    </head>
    <body>
        <%@ include file="../navbar.jsp" %>
        <div class="container mt-4">

        <c:if test="${empty ca}">
            <div class="alert alert-danger">
                Category not found
            </div>
        </c:if>

        <c:if test="${not empty ca}">
            <form action="CategoryController"
                  method="post">

                <input type="hidden" name="updateController" value="udc">

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Type Id
                    </label>
                    <div class="col-md-10">
                        <input type="text" name="typeId"
                               class="form-control"
                               value=${ca.typeId}
                               readonly>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Category Name
                    </label>
                    <div class="col-md-10">
                        <input type="text" name="categoryName"
                               class="form-control"
                               value="${ca.categoryName}">
                       
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Memo
                    </label>
                    <div class="col-md-10">
                        <input type="text" name="memo"
                               class="form-control"
                               value="${ca.memo}"
                               required>
                    </div>
                </div>
                               
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-10">
                        <button type="submit" class="btn btn-primary" name="action" value="update">
                            Update
                        </button>

                        <a href="AccountController?action=list"
                           class="btn btn-secondary">
                            Cancel
                        </a>
                    </div>
                </div>
            </form>
        </c:if>
    </div>
    </body>
</html>
