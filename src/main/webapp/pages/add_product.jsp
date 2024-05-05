<%@ page import="model.User" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%

 // HttpSession session = request.getSession(); 

  User loggedUser = (User) session.getAttribute("loggedUser");


  if (loggedUser == null) {

    response.sendRedirect(request.getContextPath() + "/access_error.jsp");

    return;

  }


  String userName = loggedUser.getUserName();

  String email = loggedUser.getEmail();


  if (!"admin".equals(userName) && !"admin@mail.com".equals(email)) {

    response.sendRedirect(request.getContextPath() + "/accessError.jsp");

    return;

  }

%>

<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/addProduct.css">
</head>
<body>

	<h2>Add Product</h2>

	<form action="../AddProductServlet" method="post" enctype="multipart/form-data">
	 <input type="hidden" name="uploadDir" value="/uploads">
		<label for="code">Code:</label><br> <input type="text" id="code"
			name="code"><br> <label for="name">Name:</label><br>
		<input type="text" id="name" name="name"><br> <label
			for="price">Price:</label><br> <input type="text" id="price"
			name="price"><br> <label for="brand">Brand:</label><br>
		<input type="text" id="brand" name="brand"><br> <label
			for="productImage">Product Image:</label><br> <input type="file"
			id="productImage" name="productImage"><br> <label
			for="stock">Stock:</label><br> <input type="text" id="stock"
			name="stock"><br> <label for="size">Size:</label><br>
		<input type="text" id="size" name="size"><br> <label
			for="description">Description:</label><br>
		<textarea id="description" name="description"></textarea>
		<br> <input type="submit" value="Submit">
	</form>

</body>
</html>








