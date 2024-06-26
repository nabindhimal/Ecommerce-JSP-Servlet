
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="model.dao.ProductDao, model.Product, controller.db.ConnectionProvider, model.User"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/product-details.css">
</head>
<body>
	<div class="container">
		<h1>Product Details</h1>

		<div class="product-details">
			<%
			ProductDao productDao = new ProductDao(ConnectionProvider.getConnection()); // Instantiate your ProductDao
			String productCode = request.getParameter("code"); 
			Product product = productDao.getProduct(productCode);

			if (product != null) {
			%>
			<div class="product-info">
				<div class="image-container">
					<img src="../images/<%=product.getProductImage()%>"
						alt="${product.name}">
				</div>
				<div class="text-container">
					<h2><%=product.getName()%></h2>
					<p>
						<strong>Brand:</strong>
						<%=product.getBrand()%></p>
					<p>
						<strong>Price:</strong> Rs.<%=product.getPrice()%></p>
					<p>
						<strong>Size:</strong>
						<%=product.getSize()%></p>
					<p>
						<strong>Stock:</strong>
						<%=product.getStock()%></p>
					<p>
						<strong>Type:</strong>
						<%=product.getType()%></p>
					<p>
						<strong>Description:</strong>
						<%=product.getDescription()%></p>
				</div>
			</div>

			<%-- Check if the user is logged in --%>
			<%
			User user = (User) session.getAttribute("loggedUser");
			if (user == null) {
			%>
			<p class="login-info">
				Please <a href="${pageContext.request.contextPath}/pages/login.jsp">login</a>
				to add this item to your cart.
			</p>
			<%
			} else {
			%>
			<form action="<%=request.getContextPath()%>/addToCart" method="post">
				<input type="hidden" name="productCode"
					value="<%=product.getCode()%>"> <label for="quantity">Quantity:</label>
				<input type="number" id="quantity" name="quantity" value="1" min="1">
				<button type="submit" name="addToCart">Add to Cart</button>
			</form>
			<%
			}
			%>

			<%
			} else {
			%>
			<p class="no-product">No product found.</p>
			<%
			}
			%>
		</div>
	</div>
</body>
<%@ include file="footor.jsp"%>
</html>
