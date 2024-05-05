<%@ include file="header.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="model.dao.ProductDao" %>
<%@ page import="controller.db.ConnectionProvider" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>Product List</title>
	<link rel="stylesheet" type="text/css" href="../css/homepage.css">
</head>
<body>


	<h1>Home Page</h1>
	<%
		ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
		List<Product> productList = new ArrayList<>();
		productList = dao.viewProduct();
		request.setAttribute("productList", productList);
	%>
	<ul>
		<c:forEach var="product" items="${productList}">
			<li>
				<img src="../images/${product.productImage}" alt="${product.name}">
				<h2>${product.name}</h2>
				<br>
				<p>Brand: ${product.brand}</p>
				<p>Price: Rs.${product.price}</p>
				<p>Size: ${product.size}</p>
				<%-- <p>Description: ${product.description}</p>
				<p>Stock: ${product.stock}</p> --%>
				<a href="productDetails.jsp?code=${product.code}">View Details</a>
			</li>
		</c:forEach>
	</ul>
	</body>
	<%@ include file="footor.jsp" %>
	

</html>


































<%-- <%@ include file="header.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="model.dao.ProductDao" %>
<%@ page import="controller.db.ConnectionProvider" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" type="text/css" href="../css/homepage.css">
</head>
<body>

<h1>Home Page</h1>

<%
    ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
    List<Product> productList = dao.viewProduct();
%>

<ul id="productList">
    <c:forEach var="product" items="${productList}">
        <li>
            <img src="../images/${product.productImage}" alt="${product.name}">
            <h2>${product.name}</h2>
            <br>
            <p>Brand: ${product.brand}</p>
            <p>Price: Rs.${product.price}</p>
            <p>Size: ${product.size}</p>
            <p>Description: ${product.description}</p>
            <p>Stock: ${product.stock}</p>
            <a href="productDetails.jsp?code=${product.code}">View Details</a>
        </li>
    </c:forEach>
</ul>

<div id="pagination"></div>

<script>
    const products = document.querySelectorAll('#productList li');
    const itemsPerPage = 6;
    const pagination = document.getElementById('pagination');

    function displayItems(items, startIndex, endIndex) {
        items.forEach((item, index) => {
            if (index >= startIndex && index < endIndex) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });
    }

    function setupPagination() {
        const pageCount = Math.ceil(products.length / itemsPerPage);
        for (let i = 1; i <= pageCount; i++) {
            const button = document.createElement('button');
            button.textContent = i;
            button.addEventListener('click', () => {
                const startIndex = (i - 1) * itemsPerPage;
                const endIndex = i * itemsPerPage;
                displayItems(products, startIndex, endIndex);
            });
            pagination.appendChild(button);
        }
    }

    // Initially display the first page
    displayItems(products, 0, itemsPerPage);
    setupPagination();
</script>

<%@ include file="footor.jsp" %>

</body>
</html> --%>
