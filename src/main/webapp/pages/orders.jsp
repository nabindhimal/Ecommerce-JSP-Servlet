
<%@ include file="header.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Order"%>
<%@ page import="model.Cart"%>
<%@ page import="model.Product"%>
<%@ page import="model.dao.OrderDao"%>
<%@ page import="controller.db.ConnectionProvider"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Orders</title>
<link rel="stylesheet" type="text/css" href="../css/homepage.css">
</head>
<body>
	<%
	if (userObj == null) {
		response.sendRedirect(request.getContextPath() + "/error.jsp?message=Must be logged in to view orders.");
		return;
	}
	%>

	<h1>Orders</h1>
	<%
	String email = userObj.getEmail();
	OrderDao dao = new OrderDao(ConnectionProvider.getConnection());
	List<Order> orderList = dao.getOrders(email);
	%>
	<ul class="prd">

		<%
		float totalSubtotal = 0.0f;
		for (Order orderItem : orderList) {
			Product product = dao.getProductById(orderItem.getProductID());
			if (product != null) {
				float totalPrice = orderItem.getQuantity() * product.getPrice();
				totalSubtotal += totalPrice;
		%>

		<li class="prdl"><img src="../images/<%=product.getProductImage()%>"
			alt="<%=product.getName()%>">
			<h2><%=product.getName()%></h2> <br>
			<p>
				Quantity:
				<%=orderItem.getQuantity()%></p>
			<p>
				Total Price: Rs.<%=totalPrice%></p>
			<p>
				Status:
				<%=orderItem.getStatus()%></p></li>

		<%
		} else {
		%>
		<li>Orders</li>
		<%
		}
		}
		%>

		<p>
			Total Subtotal: Rs.<%=totalSubtotal%></p>

	</ul>
</body>
<%@ include file="footor.jsp"%>
</html>
