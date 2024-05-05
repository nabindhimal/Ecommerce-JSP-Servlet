<%-- <%@ include file="header.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Cart"%>
<%@ page import="model.dao.CartDao"%>
<%@ page import="controller.db.ConnectionProvider"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Product List</title>
<link rel="stylesheet" type="text/css" href="../css/homepage.css">
</head>
<body>
	<%
	if (userObj == null) {
		response.sendRedirect(request.getContextPath() + "/cart_access_error.jsp");
		return;
	}
	%>

	<h1>Cart Page</h1>
	<%
	String email = userObj.getEmail();
	CartDao dao = new CartDao(ConnectionProvider.getConnection());
	List<Cart> cartList = new ArrayList<>();
	cartList = dao.getFromCart(email);
	request.setAttribute("cartList", cartList);
	%>
	<ul>
		<c:forEach var="cart" items="${cartList}">
			<li>
				<img src="../images/${product.productImage}" alt="${product.name}">
				<h2>${cart.productID}</h2> <br>
				<p>Quantity: ${cart.quantity}</p>
				<form action="" method="post"
					style="display: inline;">
					<input type="hidden" name="productCode" value="${product.code}">
					<input type="submit" value="Order">
				</form>
				<form
					action="${pageContext.request.contextPath}/RemoveFromCartServlet"
					method="post" style="display: inline;">
					<input type="hidden" name="productCode" value="${cart.productID}">
					<input type="hidden" name="email" value="${email}">
					<input type="submit" value="Remove">
				</form>
			</li>
		</c:forEach>
	</ul>
</body>
<%@ include file="footor.jsp"%>


</html>








 --%>

















<%@ include file="header.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Order"%>
<%@ page import="model.Cart" %>
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
	/*  request.setAttribute("cartList", cartList); */
	%>
	<ul>
	

		<%
		float totalSubtotal = 0.0f;
		for (Order orderItem : orderList) {
			Product product = dao.getProductById(orderItem.getProductID());
			float totalPrice = orderItem.getQuantity() * product.getPrice();
			totalSubtotal += totalPrice;
		%>

		<li><img src="../images/<%=product.getProductImage()%>"
			alt="<%=product.getName()%>">
			<h2><%=product.getName()%></h2> <br>
			<p>
				Quantity:
				<%=orderItem.getQuantity()%></p>
			<p>
				Total Price: Rs.<%=totalPrice%></p>
				
				<p>Status: <%=orderItem.getStatus() %> </p>
			</li>

		<%
		}
		%>

		<p>
			Total Subtotal: Rs.<%=totalSubtotal%></p>



	</ul>
</body>
<%@ include file="footor.jsp"%>
</html>















