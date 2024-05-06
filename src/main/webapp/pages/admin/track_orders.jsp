
<%@ include file="AdminHeader.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Product"%>
<%@ page import="model.Order"%>
<%@ page import="model.dao.OrderDao"%>
<%@ page import="controller.db.ConnectionProvider"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>ViewProduct</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homepage.css">

</head>
<body>

	<%
	// Check if the user is logged in
	userObj = (User) session.getAttribute("loggedUser");
	if (userObj == null) {
		response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect to access error page
	} else {
		User user = (User) userObj;
		if (!"admin".equals(user.getUserName()) || !"admin@admin.com".equals(user.getEmail())) {
			response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect to access error page
		}
	}
	%>


	<h1>Track Orders</h1>

	<%
	OrderDao dao = new OrderDao(ConnectionProvider.getConnection());
	List<Order> orderList = dao.getOrdersForAdmin();
	%>
	<ul class="prd">


		<%
		float totalSubtotal = 0.0f;
		for (Order orderItem : orderList) {
			Product product = dao.getProductById(orderItem.getProductID());
			if (product != null) { // Add null check for the product object
				float totalPrice = orderItem.getQuantity() * product.getPrice();
				totalSubtotal += totalPrice;
		%>

		<li class="prdl"><img src="../../images/<%=product.getProductImage()%>"
			alt="<%=product.getName()%>">
			<h2><%=product.getName()%></h2> <br>
			<p>
				User:
				<%=orderItem.getUserID()%></p>

			<p>
				Quantity:
				<%=orderItem.getQuantity()%></p>
			<p>
				Total Price: Rs.<%=totalPrice%></p>

			<p>
				Status:
				<%=orderItem.getStatus()%>
			</p>
			<form action="<%=request.getContextPath()%>/DeliverServlet"
				method="post" style="display: inline;">
				<input type="hidden" name="productCode"
					value="<%=orderItem.getProductID()%>"> <input type="hidden"
					name="email" value="<%=orderItem.getUserID()%>"> <input
					type="submit" value="Deliver">
			</form></li>

		<%
		} // End of if statement for null check
		} // End of for loop
		%>

		<p>
			Total Subtotal: Rs.<%=totalSubtotal%></p>



	</ul>


</body>
</html>
