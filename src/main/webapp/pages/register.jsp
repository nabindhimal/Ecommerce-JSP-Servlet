<%@page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<link rel="stylesheet" type="text/css" 
href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
	<div class="container">
	
	<%
		String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);
		
		if (errorMessage !=null && !errorMessage.isEmpty()) {
	%>
		<p class="error-message"> <%= errorMessage %> </p>
		<% 
		}
		%>
	
	
		<h1>Registration Form</h1>
		<form action="../RegisterServlet" method="post">
		
			<div class="row">
				<div class="col">
					<label for="username">Username:</label> <input type="text"
						id="username" name="username" required>
				</div>
			</div>
			<div class="row">
				
				<div class="col">
					<label for="email">Email:</label> <input type="email" id="email"
						name="email" required>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="phoneNumber">Phone Number:</label> <input type="tel"
						id="phoneNumber" name="number" required>
				</div>
			<div class="col">
			<label for="address">Address:</label> <input type="text"
						id="address" name="address" required>
			</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="password">Password:</label> <input type="password"
						id="password" name="password" required>
				</div>
				<div class="col">
					<label for="retypePassword">Retype Password:</label> <input
						type="password" id="retypePassword" name="retypePassword" required>
				</div>
			</div>
			<button type="submit">Register</button>
		</form>
		<p style="margin-top: 1rem">
          Already have an account?
          <span
            ><a style="text-decoration: none" href="login.jsp"
              >Sign In</a
            ></span
          >
        </p>
	</div>
</body>
</html>