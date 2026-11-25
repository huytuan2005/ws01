<%-- 
    Document   : home.jsp
    Created on : Oct 15, 2026, 11:49:39 AM
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
         
        <title>Home</title>
    </head>
    <body class="container mt-4">
        <%@include file="navbar.jsp" %>
        <div class="row" >
        <c:forEach var="product" items="${products}">
            <div class="col-md-4 col-lg-3 mb-4 mt-4">
                <div class="card h-100">

                    <img src="${pageContext.request.contextPath}${product.productImage}" class="card-img-top" alt="${product.productName}" style="width: 100%; height: 250px; object-fit: contain; padding: 10px;">

                    <div class="card-body d-flex flex-column">
                       <h5 class="card-title" style="min-height: 3rem;">
                            ${product.productName}
                        </h5>

                        <p class="card-text" style="flex-grow: 1;">
                            ${product.getBrief}
                        </p>

                        <p>
                            Price:
                            <strong>
                                <fmt:formatNumber
                                    value="${product.price * (100 - product.discount) / 100}"
                                    type="number"
                                    maxFractionDigits="0"/>
                            </strong>
                        </p>

                        <p class="text-muted">
                            Discount: ${product.discount}%
                        </p>
                        
                    </div>

                </div>
            </div>
        </c:forEach>
    </div>

    <c:if test="${empty products}">
        <p>No products available.</p>   
    </c:if>
    </body>
</html>
