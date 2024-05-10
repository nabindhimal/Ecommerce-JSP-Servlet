<%@ include file="header.jsp"%>
<%@ page import="model.User"%>
<%@ page import="model.dao.ProductDao"%>
<%@ page import="controller.db.ConnectionProvider"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>

</head>
<body>
	<h1>Edit Profile</h1>

	<%-- Retrieve User --%>
	<%
	User user = (User) session.getAttribute("loggedUser");
	%>


	<form action="${pageContext.request.contextPath}/UpdateProfileServlet"
		method="post">
		<input type="hidden" name="oldEmail" value="<%=user.getEmail()%>"><br>
		<label for="username">Username:</label><br> <input type="text"
			id="username" name="username" placeholder="<%=user.getUserName()%>"><br>

		<%-- Price field --%>
		<label for="email">Email:</label><br> <input type="text"
			id="email" name="email" placeholder="<%=user.getEmail()%>"><br>

		<%-- Brand field --%>
		<label for="address">Address:</label><br> <input type="text"
			id="address" name="address" placeholder="<%=user.getAddress()%>"><br>

		<label for="number">Number:</label><br> <input type="text"
			id="number" name="number" placeholder="<%=user.getPhoneNumber()%>"><br>
		<%-- Submit button --%>
		<input type="submit" value="Update">
	</form>
	<%@ include file="footor.jsp"%>
</body>
</html>
