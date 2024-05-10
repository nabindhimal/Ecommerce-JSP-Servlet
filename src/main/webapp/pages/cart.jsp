<%@ include file="header.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Cart"%>
<%@ page import="model.Product"%>
<!-- Import Product class -->
<%@ page import="model.dao.CartDao"%>
<%@ page import="controller.db.ConnectionProvider"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
<link rel="stylesheet" type="text/css" href="../css/homepage.css">
</head>
<body>
	<%
	if (userObj == null) {
		response.sendRedirect(request.getContextPath() + "/error.jsp?message=Must be logged in to view cart.");
		return;
	}
	%>

	<h1>Cart Page</h1>
	<%
	String email = userObj.getEmail();
	CartDao dao = new CartDao(ConnectionProvider.getConnection());
	List<Cart> cartList = dao.getFromCart(email);
	%>
	<ul class="prd">
		<%
		float totalSubtotal = 0.0f;
		for (Cart cartItem : cartList) {
			Product product = dao.getProductById(cartItem.getProductID());
			float totalPrice = cartItem.getQuantity() * product.getPrice();
			totalSubtotal += totalPrice;
		%>

		<li class="prdl"><img
			src="../images/<%=product.getProductImage()%>"
			alt="<%=product.getName()%>">
			<h2><%=product.getName()%></h2> <br>
			<p>
				Quantity:
				<%=cartItem.getQuantity()%></p>
			<p>
				Total Price: Rs.<%=totalPrice%></p>
			<form action="<%=request.getContextPath()%>/OrderServlet"
				method="post" style="display: inline;">
				<input type="hidden" name="productCode"
					value="<%=cartItem.getProductID()%>"> <input type="submit"
					value="Order">
			</form>


			<form id="removeForm<%=cartItem.getProductID()%>"
				action="<%=request.getContextPath()%>/RemoveFromCartServlet"
				method="post" style="display: inline;">
				<input type="hidden" name="productCode"
					value="<%=cartItem.getProductID()%>"> <input type="submit"
					value="Remove" onclick="return confirmRemove()">
			</form> <script>
				function confirmRemove() {
					return confirm("Are you sure you want to remove this item from the cart?");
				}
			</script></li>


		<form action="<%=request.getContextPath()%>/OrderAllServlet"
			method="post">
			<input type="submit" value="Order All">
		</form>

		<%
		}
		%>

		<p>
			Total Subtotal: Rs.<%=totalSubtotal%></p>



	</ul>
</body>
<%@ include file="footor.jsp"%>
</html>















