<%@ include file="AdminHeader.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="model.dao.ProductDao" %>
<%@ page import="controller.db.ConnectionProvider" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>ViewProduct</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homepage.css">
	
</head>
<body>

<%-- <%
    // Check if the user is logged in
    userObj = (User) session.getAttribute("loggedUser");
    if (userObj == null) {
        response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect to access error page
    } else {
        User user = (User) userObj;
        if (!"admin".equals(user.getUserName()) || !"admin@admin.com".equals(user.getEmail())) {
            response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect to access error page
        }
    }
%>  --%>


	<h1>Products Page</h1>
	<%
		ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
		List<Product> productList = new ArrayList<>();
		productList = dao.viewProduct();
		request.setAttribute("productList", productList);
	%>
	<ul class="prd">
		<c:forEach var="product" items="${productList}">
			<li class="prdl">
				<img src="../../images/${product.productImage}" alt="${product.name}">
				<h2>${product.name}</h2>
				<br>
				<p>Code: ${product.code}</p>
				<p>Brand: ${product.brand}</p>
				<p>Price: Rs.${product.price}</p>
				<p>Size: ${product.size}</p>
				<p>Description: ${product.description}</p>
				<p>Stock: ${product.stock}</p>
				<p>Type: ${product.type}</p>
			</li>
		</c:forEach>
	</ul>
	
	
</body>
</html>

