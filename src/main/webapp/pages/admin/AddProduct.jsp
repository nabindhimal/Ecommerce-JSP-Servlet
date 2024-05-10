<%@ page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/addProduct.css">

</head>

<%
// Check if the user is logged in
User userObj = (User) session.getAttribute("loggedUser");
if (userObj == null) {
	response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect to access error page
} else {
	User user = (User) userObj;
	if (!"admin".equals(user.getUserName()) || !"admin@admin.com".equals(user.getEmail())) {
		response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect to access error page
	}
}
%>
<body>
	<jsp:include page="AdminHeader.jsp"></jsp:include>
	<main>
		<h2 style="text-align: center;">Add Product</h2>


		<form action="${pageContext.request.contextPath}/AddProductServlet"
			method="post" enctype="multipart/form-data">
			<label for="code">Code:</label><br> <input type="text" id="code"
				name="code"><br> <label for="name">Name:</label><br>
			<input type="text" id="name" name="name"><br> <label
				for="price">Price:</label><br> <input type="text" id="price"
				name="price"><br> <label for="brand">Brand:</label><br>
			<input type="text" id="brand" name="brand"><br> <label
				for="type">Type:</label><br> <select id="type" name="type">
				<option value="smart">Smart</option>
				<option value="regular">Regular</option>
			</select><br> <label for="stock">Stock:</label><br> <input
				type="text" id="stock" name="stock"><br> <label
				for="size">Size:</label><br> <input type="text" id="size"
				name="size"><br> <label for="description">Description:</label><br>
			<textarea id="description" name="description"></textarea>
			<br> <label for="productImage">Product Image:</label><br> <input
				type="file" id="productImage" name="productImage"><br>
			<input type="submit" value="Submit">
		</form>

	</main>
</body>
</html>