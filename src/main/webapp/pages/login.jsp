<%@page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css" />
</head>
<body>


	<div class="login-box">
		<h2>Login</h2>
		<form action="../LoginServlet">
			<div class="row">
				<div class="col">
					<label for="email">Email:</label> <input type="text" id="email"
						name="email" required>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="password">Password:</label> <input type="password"
						id="password" name="password" required>
				</div>
			</div>
			<button type="submit" class="login-button">Login</button>
		</form>
		<p style="margin-top: 1rem">
			Create an account! <span><a
				style="text-decoration: none" href="register.jsp">Sign
					Up</a></span>
		</p>

		<%
		String successMessage = (String) request.getAttribute(StringUtils.SUCCESS_MESSAGE);
		String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);

		if (errorMessage != null && !errorMessage.isEmpty()) {
		%>
		<!-- Display error message with a designated style -->
		<p class="error-message"><%=errorMessage%></p>
		<%
		}

		if (successMessage != null && !successMessage.isEmpty()) {
		%>
		<!-- Display success message with a designated style -->
		<p class="success-message"><%=successMessage%></p>
		<%
		}
		%>


	</div>
</body>
</html>








