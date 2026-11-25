<%-- 
    Document   : list
    Created on : Oct 15, 2026, 3:40:56 PM
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
        <title>List Product</title>
    </head>
    <body>
         <%@include file="../navbar.jsp" %>
        <div class="container-fluid mt-3 px-4">
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover align-middle w-100" style="table-layout: fixed">
                <colgroup>
                     <col style="width: 3%">   <!-- # -->
                        <col style="width: 8%">   <!-- Product Id -->
                        <col style="width: 10%">  <!-- Product Name -->
                        <col style="width: 11%">  <!-- Image url -->
                        <col style="width: 19%">  <!-- Brief -->
                        <col style="width: 7%">   <!-- Posted Day -->
                        <col style="width: 4%">   <!-- Type Id -->
                        <col style="width: 7%">   <!-- Account -->
                        <col style="width: 4%">   <!-- Unit -->
                        <col style="width: 7%">   <!-- Price -->
                        <col style="width: 8%">   <!-- Discount -->
                        <col style="width: 7%">   <!-- Update -->
                        <col style="width: 7%">   <!-- Delete -->
                </colgroup>
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Product Id</th>
                        <th>Product Name</th>
                        <th>Product Image(url)</th>
                        <th>Brief</th>
                        <th >Posted Day</th>
                        <th>Type Id</th>
                        <th>Account</th>
                        <th>Unit</th>
                        <th>Price</th>
                        <th>Discount(%)</th>
                        <th colspan="2" class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${list}" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td class="text-break">${product.productId}</td>
                            <td class="text-break">${product.productName}</td>
                            <td class="text-break">${product.productImage}</td>
                            <td class="text-break">${product.getBrief}</td>
                            <td>${product.postDate}</td>
                            <td>${product.typeId}</td>
                            <td class="text-break">${product.account}</td>
                            <td class="text-break">${product.unit}</td>
                            <td >${product.price}</td>
                            <td>${product.discount}</td>
                            <td>
                                <a href="ProductController?action=update&productId=${product.productId}"
                                   class="btn btn-primary">
                                    Update
                                </a>
                            </td>
                            <td>
                                <form action="ProductController"
                                      method="post"
                                      onsubmit="return confirm('Are you sure you want to delete this product?');">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="productId" value="${product.productId}">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty list}">
                        <tr>
                            <td colspan="12" class="text-center">
                                No products found.  
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
