<%@ page import="model.User"%>
<%
User userObj = (User) session.getAttribute("loggedUser");
if (userObj != null && ("admin".equals(userObj.getUserName()) || "admin@admin.com".equals(userObj.getEmail()))) {
	response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect admin to access error page
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/header.css">
</head>
<body>
	<div class="all-home">
		<nav>
			<div class="nav-bar">
				<div class="home-icon">
					<a class="links" href="${pageContext.request.contextPath}/pages/homepage.jsp">
						<i class="ri-home-4-fill"></i>
					</a>
				</div>

				<div class="search-bar">
					<form action="${pageContext.request.contextPath}/search"
						method="GET">
						<input type="text" class="search-input" name="query"
							placeholder="Search"> <select name="searchType">
							<option value="name">Name</option>
							<option value="price">Price</option>
						</select>
						<button type="submit">Search</button>
					</form>
				</div>

				<div class="cart-button">
					<a class="links" href="${pageContext.request.contextPath}/pages/cart.jsp"> <i
						class="ri-shopping-cart-2-fill"></i>
					</a>
				</div>

				<div class="about-button">
					<a class="links" href="${pageContext.request.contextPath}/pages/about.jsp">
						About Us </a>
				</div>

				<div class="order-button">
					<a class="links" href="${pageContext.request.contextPath}/pages/orders.jsp">
						Orders </a>
				</div>

				<div class="profile-menu">
					<%
					if (userObj == null) {
					%>
					<a class="links" href="${pageContext.request.contextPath}/pages/login.jsp">
						<i class="ri-login-circle-line"></i>
					</a>
					<%
					} else {
					%>
					<a class="links" href="${pageContext.request.contextPath}/pages/profile.jsp">
						<i class="ri-user-3-fill"></i>
					</a>
					<%
					}
					%>
				</div>

				<div class="logout-button">
					<%
					if (userObj != null) {
					%>
					<a class="links" href="<%=request.getContextPath()%>/LogoutServlet"> <i
						class="ri-logout-box-line"></i>
					</a>
					<%
					}
					%>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>
