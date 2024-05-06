<%@ include file="AdminHeader.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Product"%>
<%@ page import="model.dao.ProductDao"%>
<%@ page import="controller.db.ConnectionProvider"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>ViewProduct</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/homepage.css">
</head>
<body>

	<h1>Manage Products</h1>
	<%
	ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
	List<Product> productList = dao.viewProduct();
	request.setAttribute("productList", productList);
	%>
	<ul class="prd">
		<c:forEach var="product" items="${productList}">
			<li class="prdl"><img src="../../images/${product.productImage}"
				alt="${product.name}">
				<h2>${product.name}</h2> <br>
				<p>Code: ${product.code}</p>
				<p>Brand: ${product.brand}</p>
				<p>Price: Rs.${product.price}</p>
				<p>Size: ${product.size}</p>
				<p>Description: ${product.description}</p>
				<p>Stock: ${product.stock}</p>
				<p>Type: ${product.type}</p>
				<form action="edit_product.jsp" method="post"
					style="display: inline;">
					<input type="hidden" name="productCode" value="${product.code}">
					<input type="submit" value="Edit">
				</form>
				<form
					action="${pageContext.request.contextPath}/RemoveProductServlet"
					method="post" style="display: inline;"
					onsubmit="return confirmRemove()">
					<input type="hidden" name="productCode" value="${product.code}">
					<input type="submit" value="Remove">
				</form> <script>
					function confirmRemove() {
						return confirm("Are you sure you want to remove this product?");
					}
				</script></li>
		</c:forEach>
	</ul>

</body>
</html>







