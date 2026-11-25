<%-- 
    Document   : create
    Created on : Oct 15, 2026, 3:40:42 PM
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
        <title>Create Product</title>
    </head>
    <body>
        <%@ include file="../navbar.jsp" %>

        <div class="container mt-4">
            <form action="ProductController" method="post">
                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">Product Id</label>
                    <div class="col-md-10">
                        <input type="text" name="productId" class="form-control"
                               placeholder="Enter Product Id" required>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">Product Name</label>
                    <div class="col-md-10">
                        <input type="text" name="productName" class="form-control"
                               placeholder="Enter Product Name" required>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">Product Image</label>
                    <div class="col-md-10">
                        <input type="text" name="productImage" class="form-control"
                               placeholder="Last name" required>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">Brief</label>
                    <div class="col-md-10">
                        <input type="text" name="brief" class="form-control"
                               placeholder="Enter Brief" required>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">
                        Type Name
                    </label>

                    <div class="col-md-10">
                        <select name="typeId" class="form-select" required>
                            <c:forEach var="ca" items="${categories}">
                                <option value="${ca.typeId}">
                                    ${ca.categoryName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">Unit</label>
                    <div class="col-md-10">
                        <input type="text" name="unit" class="form-control"
                               placeholder="Enter unit" required>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">Price</label>
                    <div class="col-md-10">
                        <input type="number" name="price" class="form-control"
                               placeholder="Enter price" required>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-2 col-form-label text-md-end">Discount</label>
                    <div class="col-md-10">
                        <input type="number" name="discount" class="form-control"
                               placeholder="Enter discount" required>
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
