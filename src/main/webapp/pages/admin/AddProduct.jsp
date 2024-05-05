<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheet/AddPro.css">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css"
	rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>


	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<div id="new_car_reg_content">
		<div id="new_car_reg_title">
			<h3>Add Product Portal</h3>
		</div>

		<div id="new_car_reg_semi_title">
			<h3>
				<i class="ri-tv-line"></i> Add New Products
			</h3>
		</div>

		<form method="post" action="AdminHome.jsp"
			enctype="multipart/form-data">

			<div class="form-group">
				<div class="row">
					<div class="col">
						<input type="text" id="product_name" name="product_name"
							placeholder="Product Name" required>
					</div>
					<div class="col">
						<input type="text" id="product_code" name="product_code"
							placeholder="Product Code" required>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<input type="text" id="product_brand" name="phone_number"
							placeholder="Product Brand" required>
					</div>
					<div class="col">
						<input type="text" id="product_description"
							name="product_description" placeholder="Product Description"
							required>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<input type="text" id="product_price" name="product_price"
							placeholder="Product Price" required>
					</div>
					<div class="col">
						<input type="text" id="product_quantity" name="product_quantity"
							placeholder="Product Quantity" required>
					</div>
				</div>

				<div id="form-group">
					<div class="row">
						<div class="col">
							<br>
							<center>
								<div class="card-header text-primary">Product Image:</div>
							</center>
							<input type="file" name="product_image" required="required">
						</div>
					</div>
				</div>

				<div class="form-group-btn">
					<button type="submit" class="btn btn-primary btn-lg btn-block">
						Add</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html> --%>

<%@ page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="style.css">
</head>

 <%
    // Check if the user is logged in
    User userObj = (User) session.getAttribute("loggedUser");
    if (userObj == null) {
        response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect to access error page
    } else {
        User user = (User) userObj;
        if (!"admin".equals(user.getUserName()) || !"admin@admin.com".equals(user.getEmail())) {
            response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect to access error page
        }
    }
%>
<body>
    <jsp:include page="AdminHeader.jsp"></jsp:include>
    <main>
        <h2>Add Product</h2>
        <form action="${pageContext.request.contextPath}/AddProductServlet" method="post" enctype="multipart/form-data">
            <label for="code">Code:</label><br>
            <input type="text" id="code" name="code"><br>
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name"><br>
            <label for="price">Price:</label><br>
            <input type="text" id="price" name="price"><br>
            <label for="brand">Brand:</label><br>
            <input type="text" id="brand" name="brand"><br>
            <label for="type">Type:</label><br>
            <select id="type" name="type">
                <option value="smart">Smart</option>
                <option value="regular">Regular</option>
            </select><br>
            <label for="productImage">Product Image:</label><br>
            <input type="file" id="productImage" name="productImage"><br>
            <label for="stock">Stock:</label><br>
            <input type="text" id="stock" name="stock"><br>
            <label for="size">Size:</label><br>
            <input type="text" id="size" name="size"><br>
            <label for="description">Description:</label><br>
            <textarea id="description" name="description"></textarea><br>
            <input type="submit" value="Submit">
        </form>
    </main>
</body>
</html>