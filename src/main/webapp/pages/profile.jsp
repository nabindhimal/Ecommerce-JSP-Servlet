<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<%@ page import="model.dao.UserDao"%>


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
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Profile Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/profile.css">
</head>
<body>
	<h1>Elite Screens</h1>
	<h2>Profile Information</h2>
	<tab	<tr>
			<td>Username:</td>
			<td><p>${user.UserName}</p></td>
		</tr>
		<tr>
			<td>Address:</td>
			<td>${address}</td>
		</tr>
		<tr>
			<td>Email:</td>
			<td>Phone Number:</td>
			
		</tr>
	</table>
	
	
	<tab{pageContext.request.contextPath}/editProfile">Edit
			Profile</a> <a href="${pageContext.request.contextPath}/changePassword">Change
			Password</a> <a href="${pageContext.request.contextPath}/deleteAccount">Delete
			Account</a>
	</p>
	<p>
		<a href="${pageContext.request.contextPath}/logout">Log Out</a>
	</p>
	<%@ include file="footor.jsp"%>
</body>

</html> --%>





























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

	<%--     <table>
        <thead>
            <tr>
                <th>Username:</th>
                <th>Address:</th>
                <th>Email:</th>
                <th>Phone Number:</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= username %></td>
                <td><%= address %></td>
                <td><%= email %></td>
                <td><%= phoneNumber %></td>
            </tr>
        </tbody>
    </table> --%>


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
			Profile</a> <a href="${pageContext.request.contextPath}/pages/change_password.jsp">Change
			Password</a> <a href="${pageContext.request.contextPath}/DeleteAccountServlet">Delete
			Account</a>
	</p>
	<%@ include file="footor.jsp"%>
</body>
</html>

<%
}
%>




