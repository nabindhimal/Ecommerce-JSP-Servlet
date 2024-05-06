<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/search.css">

</head>
<body>
	<div class="container">
		<h1>Search Results</h1>
		<c:if test="${not empty searchResults}">
			<ul>
				<c:forEach var="product" items="${searchResults}">
					<li><img
						src="${pageContext.request.contextPath}/images/${product.getProductImage()}"
						alt="${product.getName()}">
						<h2>${product.getName()}</h2>
						<p>Code: ${product.getCode()}</p>
						<p>Brand: ${product.getBrand()}</p>
						<p>Price: Rs.${product.getPrice()}</p>
						<p>Size: ${product.getSize()}</p>
						<p>Description: ${product.getDescription()}</p>
						<p>Stock: ${product.getStock()}</p>
						<p>Type: ${product.getType()}</p></li>
				</c:forEach>
			</ul>
		</c:if>

		<c:if test="${empty searchResults}">
			<p>No search results found.</p>
		</c:if>
	</div>
</body>
</html>

<%@include file="footor.jsp"%>
