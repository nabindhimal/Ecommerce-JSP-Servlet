<%@ include file="header.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Product"%>
<%@ page import="model.dao.ProductDao"%>
<%@ page import="controller.db.ConnectionProvider"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Homepage</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/homepage.css">
</head>
<body>
	<div class="content-wrapper">

		<h1>Home Page</h1>
		<%
		ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
		List<Product> productList = new ArrayList<>();
		productList = dao.viewProduct();
		request.setAttribute("productList", productList);
		%>
		<ul class="prd">
			<c:forEach var="product" items="${productList}">
				<li class="prdl"><img src="../images/${product.productImage}"
					alt="${product.name}">
					<h2>${product.name}</h2> <br>
					<p>Brand: ${product.brand}</p>
					<p>Price: Rs.${product.price}</p>
					<p>Size: ${product.size}</p> <a class="links"
					href="productDetails.jsp?code=${product.code}">View Details</a></li>
			</c:forEach>
		</ul>
	</div>
	<%@ include file="footor.jsp"%>
</body>
</html>



































