<%-- 
    Document   : create
    Created on : Oct 15, 2026, 3:37:16 PM
    Author     : phuct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
    <%@ include file="../navbar.jsp" %>

    <div class="container mt-4">

        <form action="AccountController" method="post">
            <div class="row mb-3 align-items-center">
                <label class="col-md-2 col-form-label text-md-end">Account</label>
                <div class="col-md-10">
                    <input type="text" name="account" class="form-control"
                           placeholder="Enter Account" required>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <label class="col-md-2 col-form-label text-md-end">Password</label>
                <div class="col-md-10">
                    <input type="password" name="pass" class="form-control"
                           placeholder="Enter password" required>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <label class="col-md-2 col-form-label text-md-end">Last name</label>
                <div class="col-md-10">
                    <input type="text" name="lastName" class="form-control"
                           placeholder="Last name" required>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <label class="col-md-2 col-form-label text-md-end">First name</label>
                <div class="col-md-10">
                    <input type="text" name="firstName" class="form-control"
                           placeholder="First name" required>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <label class="col-md-2 col-form-label text-md-end">Phone number</label>
                <div class="col-md-10">
                    <input type="tel" name="phone" class="form-control"
                           placeholder="Phone number" required>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <label class="col-md-2 col-form-label text-md-end">Birthday</label>
                <div class="col-md-10">
                    <input type="date" name="birthday" class="form-control" required>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <label class="col-md-2 col-form-label text-md-end">Gender</label>
                <div class="col-md-10">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"
                               name="gender" value="true" checked>
                        <label class="form-check-label">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"
                               name="gender" value="false">
                        <label class="form-check-label">Female</label>
                    </div>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <label class="col-md-2 col-form-label text-md-end">Role in system</label>
                <div class="col-md-10">
                    <select name="roleInSystem" class="form-select" required>
                        <option value="1">Administrator</option>
                        <option value="2">Manager</option>
                        <option value="3">Product Staff</option>
                        <option value="4">Category Staff</option>
                        <option value="5">Viewer</option>
                    </select>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox"
                               name="isUse" value="true">
                        <label class="form-check-label">Is active</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                    <button type="submit" class="btn btn-primary" name="action" value="create" >Submit</button>
                </div>
            </div>

        </form>
    </div>
    </body>
</html>
