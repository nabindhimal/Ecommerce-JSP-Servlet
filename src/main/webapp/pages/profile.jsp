<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<%@ include file="header.jsp"%>
<%
// Check if the user is logged in
User user = (User) session.getAttribute("loggedUser");
if (user == null) {
	response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect to access error page
} else {
	String username = user.getUserName();
	String address = user.getAddress();
	String email = user.getEmail();
	String phoneNumber = user.getPhoneNumber();
%>

<!DOCTYPE html>
<html>
<head>
<title>Profile Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/profile.css">
</head>
<body>

	<h2>Profile Information</h2>

	<table>
		<tbody>
			<tr>
				<td>Username:</td>
				<td><%=username%></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><%=address%></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><%=email%></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><%=phoneNumber%></td>
			</tr>
		</tbody>
	</table>


	<p>
		<a href="${pageContext.request.contextPath}/pages/edit_profile.jsp">Edit
			Profile</a> <a
			href="${pageContext.request.contextPath}/pages/change_password.jsp">Change
			Password</a> <a
			href="${pageContext.request.contextPath}/DeleteAccountServlet">Delete
			Account</a>
	</p>
	<%@ include file="footor.jsp"%>
</body>
</html>

<%
}
%>




