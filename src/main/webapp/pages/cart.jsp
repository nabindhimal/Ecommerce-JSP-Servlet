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
<%@ page import="model.Cart"%>
<%@ page import="model.Product"%>
<!-- Import Product class -->
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
		response.sendRedirect(request.getContextPath() + "/error.jsp?message=Must be logged in to view cart.");
		return;
	}
	%>

	<h1>Cart Page</h1>
	<%
	String email = userObj.getEmail();
	CartDao dao = new CartDao(ConnectionProvider.getConnection());
	List<Cart> cartList = dao.getFromCart(email);
	/*  request.setAttribute("cartList", cartList); */
	%>
	<ul>
		<%--   <c:forEach var="cart" items="${cartList}">
        Fetch product details for each cart item
        <%
            Product product = dao.getProductById(cart.getProductID()); // Assuming method getProductById exists
            float totalPrice = cart.getQuantity() * product.getPrice();
        %>
        <li>
            <img src="../images/${product.getProductImage()}" alt="${product.getName()}">
            <h2>${product.getProductID()}</h2> <br>
            <p>Quantity: ${cart.getQuantity()}</p>
            <p>Total Price: ${totalPrice}</p>
            <form action="" method="post" style="display: inline;">
                <input type="hidden" name="productCode" value="${product.getCode()}">
                <input type="submit" value="Order">
            </form>
            <form action="${pageContext.request.contextPath}/RemoveFromCartServlet" method="post" style="display: inline;">
                <input type="hidden" name="productCode" value="${cart.getProductID()}">
                <input type="submit" value="Remove">
            </form>
        </li>
    </c:forEach> --%>

		<%--   <c:forEach var="cartItem" items="${cartList}">
    <c:set var="product" value="${dao.getProductById(cartItem.productID)}" />
    <c:set var="totalPrice" value="${cartItem.quantity * product.price}" />
    
    <li>
        <img src="../images/${product.productImage}" alt="${product.name}">
        <h2>${cartItem.productID}</h2> <br>
        <p>Quantity: ${cartItem.quantity}</p>
        <p>Total Price: ${totalPrice}</p>
        <form action="" method="post" style="display: inline;">
            <input type="hidden" name="productCode" value="${product.code}">
            <input type="submit" value="Order">
        </form>
        <form action="${pageContext.request.contextPath}/RemoveFromCartServlet" method="post" style="display: inline;">
            <input type="hidden" name="productCode" value="${cartItem.productID}">
            <input type="submit" value="Remove">
        </form>
    </li>
</c:forEach> --%>


		<%-- <%
    CartDao dao = new CartDao(ConnectionProvider.getConnection());
    List<Cart> cartList = dao.getFromCart(userObj.getEmail());
%>

<%
    for (Cart cartItem : cartList) {
        Product product = dao.getProductById(cartItem.getProductID());
        float totalPrice = cartItem.getQuantity() * product.getPrice();
%>

    <li>
        <img src="../images/<%= product.getProductImage() %>" alt="<%= product.getName() %>">
        <h2><%= product.getName() %></h2> <br>
        <p>Quantity: <%= cartItem.getQuantity() %></p>
        <p>Total Price: Rs.<%= totalPrice %></p>
        <form action="" method="post" style="display: inline;">
            <input type="hidden" name="productCode" value="<%= product.getCode() %>">
            <input type="submit" value="Order">
        </form>
        <form action="<%= request.getContextPath() %>/RemoveFromCartServlet" method="post" style="display: inline;">
            <input type="hidden" name="productCode" value="<%= cartItem.getProductID() %>">
            <input type="submit" value="Remove">
        </form>
    </li>

<%
    }
%> --%>

		<%
		float totalSubtotal = 0.0f;
		for (Cart cartItem : cartList) {
			Product product = dao.getProductById(cartItem.getProductID());
			float totalPrice = cartItem.getQuantity() * product.getPrice();
			totalSubtotal += totalPrice;
		%>

		<li><img src="../images/<%=product.getProductImage()%>"
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















