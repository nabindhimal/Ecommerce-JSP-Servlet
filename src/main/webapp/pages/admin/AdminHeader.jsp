<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/AdminHeader.css">

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
	<nav class="nav-bar">
		<div class="sys-logo">
			<a href="homepage.jsp"> <img
				src="<%=request.getContextPath()%>/images/logo.jpeg" height="60px"
				width="100px">
			</a>
		</div>

		<div class="nav-links">
			<a href="./AddProduct.jsp">Add Product</a> <a
				href="./view_product.jsp">View Product</a> <a
				href="./manage_product.jsp">Manage Product</a> <a
				href="./track_orders.jsp">Track Orders</a>
		</div>

		<div class="profile-menu">
			<button class="logout-button"
				onclick="location.href='<%=request.getContextPath()%>/LogoutServlet'">
				Logout <i class="ri-logout-box-line"></i>
			</button>
		</div>
	</nav>
</body>
</html>





