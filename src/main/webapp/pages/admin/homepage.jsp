
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body>
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

	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<h1 style="color: green; font-size: 24px; text-align: center;">Welcome
		to admin dashboard !!</h1>
</body>
</html>

































<!-- Add the navigation bar here -->
<!-- <nav>
    <ul>
        <li><a href="admin_dashboard.jsp">Admin Homepage</a></li>
        <li><a href="add_product.jsp">Add Product</a></li>
        <li><a href="view_products.jsp">View Products</a></li>
        <li><a href="manage_products.jsp">Manage Products</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</nav> -->

<!-- Add the rest of the content for the admin dashboard here -->
<!-- <h2>Welcome, Admin!</h2>

</body>
</html> -->