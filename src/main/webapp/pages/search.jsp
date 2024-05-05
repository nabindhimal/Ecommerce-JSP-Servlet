<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <style>
        /* Add your CSS styles here */
        /* Example styles */
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
            border: 1px solid #ccc;
            padding: 10px;
        }
        img {
            max-width: 100px;
            max-height: 100px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Search Results</h1>

        <%-- Retrieve search results from request attribute --%>
        <% ArrayList<Product> searchResults = (ArrayList<Product>) request.getAttribute("searchResults"); %>

        <%-- Check if search results are not null and not empty --%>
        <% if (searchResults != null && !searchResults.isEmpty()) { %>
            <%-- Display search results using JSTL forEach --%>
            <ul>
                <c:forEach var="product" items="${searchResults}">
                    <li>
                       <%--  <img src="../images/${product.productImage}" alt="${product.productImage}">
                         <img src="../images/${product.productImage} %>" alt="${product.name}"> --%>
                         <img src="${pageContext.request.contextPath}/images/${product.getProductImage()}" alt="${product.getName()}">
                        <h2>${product.getName()}</h2>
                        <p>Code: ${product.getCode()}</p>
                        <p>Brand: ${product.getBrand()}</p>
                        <p>Price: Rs.${product.getPrice()}</p>
                        <p>Size: ${product.getSize()}</p>
                        <p>Description: ${product.getDescription()}</p>
                        <p>Stock: ${product.getStock()}</p>
                        <p>Type: ${product.getType()}</p>
                    </li>
                </c:forEach>
            </ul>
        <% } else { %>
            <%-- No search results found --%>
            <p>No search results found.</p>
        <% } %>
    </div>
</body>
</html>

<%@include file="footor.jsp" %>
