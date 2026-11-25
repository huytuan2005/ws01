<%-- 
    Document   : edit
    Created on : Oct 15, 2026, 3:37:25 PM
    Author     : phuct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
    <%@ include file="../navbar.jsp" %>
    <div class="container mt-4">

        <c:if test="${empty account}">
            <div class="alert alert-danger">
                Account not found.
            </div>
        </c:if>

        <c:if test="${not empty account}">
            <form action="AccountController"
                  method="post">

                <input type="hidden" name="updateController" value="udc">

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Account
                    </label>
                    <div class="col-md-10">
                        <input type="text" name="account"
                               class="form-control"
                               value=${account.account}
                               readonly>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Password
                    </label>
                    <div class="col-md-10">
                        <input type="text" name="pass"
                               class="form-control"
                               value="${account.pass}">
                       
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Last name
                    </label>
                    <div class="col-md-10">
                        <input type="text" name="lastName"
                               class="form-control"
                               value="<c:out value='${account.lastName}'/>"
                               required>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        First name
                    </label>
                    <div class="col-md-10">
                        <input type="text" name="firstName"
                               class="form-control"
                               value="<c:out value='${account.firstName}'/>"
                               required>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Phone number
                    </label>
                    <div class="col-md-10">
                        <input type="tel" name="phone"
                               class="form-control"
                               value="<c:out value='${account.phone}'/>">
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Birthday
                    </label>
                    <div class="col-md-10">
                        <input type="date" name="birthday"
                               class="form-control"
                               value="<fmt:formatDate value='${account.birthday}' pattern='yyyy-MM-dd'/>">
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Gender
                    </label>
                    <div class="col-md-10">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio"
                                   name="gender" value="true"
                                   ${account.gender ? 'checked' : ''}>
                            <label class="form-check-label">Male</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio"
                                   name="gender" value="false"
                                   ${not account.gender ? 'checked' : ''}>
                            <label class="form-check-label">Female</label>
                        </div>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Role in system
                    </label>
                    <div class="col-md-10">
                        <select name="roleInSystem" class="form-select" required>
                            <option value="1"
                                ${account.roleInSystem == 1 ? 'selected' : ''}>
                                Administrator
                            </option>
                            <option value="2"
                                ${account.roleInSystem == 2 ? 'selected' : ''}>
                                Manager
                            </option>
                            <option value="3"
                                ${account.roleInSystem == 3 ? 'selected' : ''}>
                                Product Staff
                            </option>
                            <option value="4"
                                ${account.roleInSystem == 4 ? 'selected' : ''}>
                                Category Staff
                            </option>
                            <option value="5"
                                ${account.roleInSystem == 5 ? 'selected' : ''}>
                                Viewer
                            </option>
                        </select>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Status
                    </label>
                    <div class="col-md-10">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox"
                                   name="isUse" value="true"
                                   ${account.isUse ? 'checked' : ''}>
                            <label class="form-check-label">Is active</label>
                        </div>
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
