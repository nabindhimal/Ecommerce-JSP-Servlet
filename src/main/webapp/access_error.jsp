<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Access Error Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/url_error.css">
</head>
<body>
	<h1>Access Error</h1>
	<p>Permission Denied!</p>
	<button onclick="window.location.href='<%=url%>'">Go to
		Homepage</button>
</body>
</html>