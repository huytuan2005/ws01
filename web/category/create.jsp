<%-- 
    Document   : create
    Created on : Oct 15, 2026, 3:40:03 PM
    Author     : phuct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
    <%@ include file="../navbar.jsp" %>
    <div class="container mt-4">
        
                               
        <form action="CategoryController" method="post">
           
            
            <div class="row mb-3 align-items-center">
                <label class="col-md-2 col-form-label text-md-end">Category Name</label>
                <div class="col-md-10">
                    <input type="text" name="categoryName" class="form-control"
                           placeholder="Enter Category Name" required>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <label class="col-md-2 col-form-label text-md-end">Memo</label>
                <div class="col-md-10">
                    <input type="text" name="memo" class="form-control"
                           placeholder="Enter memo" required>
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
