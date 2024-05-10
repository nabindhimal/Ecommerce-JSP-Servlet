<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page isErrorPage="true"%>

<%
String protocol = request.getScheme();
String serverName = request.getServerName();
int portNumber = request.getServerPort();
String contextPath = request.getContextPath();
String url = protocol + "://" + serverName + (portNumber == 80 || portNumber == 443 ? "" : ":" + portNumber)
		+ contextPath + "/pages/homepage.jsp";
%>

<!DOCTYPE html>
<html>
<head>
<title>Success Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/url_error.css">
</head>
<body>
	<h1>Success Message</h1>
	<%
	// Retrieve the value of the "message" parameter from the URL
	String message = request.getParameter("message");
	if (message != null && !message.isEmpty()) {
	%>
	<p>
		Message:
		<%=message%></p>
	<%
	} else {
	%>
	<p>No message provided.</p>
	<%
	}
	%>
	<button onclick="window.location.href='<%=url%>'">Go to
		Homepage</button>
</body>
</html>