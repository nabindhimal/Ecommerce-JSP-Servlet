<%@ include file="AdminHeader.jsp" %>
<%@ page import="model.Product" %>
<%@ page import="model.dao.ProductDao" %>
<%@ page import="controller.db.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <!-- Add any necessary stylesheets or scripts -->
</head>
<body>
    <h1>Edit Product</h1>

    <%-- Retrieve product details based on product code --%>
    <% 
        String productCode = request.getParameter("productCode");
        ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
        Product product = dao.getProduct(productCode);
    %>

    <%-- Display the image of the product --%>
    <img src="../../images/<%=product.getProductImage()%>" alt="Product Image" width="200">

    <%-- Edit form --%>
    <form action="${pageContext.request.contextPath}/UpdateProductServlet" method="post" >
        <input type="hidden" name="productCode" value="<%=product.getCode()%>"> <%-- Hidden field for product code --%>
        
        <%-- Name field --%>
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="productName" placeholder="<%=product.getName()%>"><br>

        <%-- Price field --%>
        <label for="price">Price:</label><br>
        <input type="text" id="price" name="price" placeholder="<%=product.getPrice()%>"><br>

        <%-- Brand field --%>
        <label for="brand">Brand:</label><br>
        <input type="text" id="brand" name="brand" placeholder="<%=product.getBrand()%>"><br>

        <%-- Type field --%>
        <label for="type">Type:</label><br>
          <select id="type" name="type">
                <option value="smart">Smart</option>
                <option value="regular">Regular</option>
            </select><br>
        <%-- <select id="type" name="type">
            <option value="smart" <%= product.getType().equals("smart") ? "selected" : "" %>>Smart</option>
            <option value="regular" <%= product.getType().equals("regular") ? "selected" : "" %>>Regular</option>
        </select><br> --%>


        <%-- Stock field --%>
        <label for="stock">Stock:</label><br>
        <input type="text" id="stock" name="stock" placeholder="<%=product.getStock()%>"><br>

        <%-- Size field --%>
        <label for="size">Size:</label><br>
        <input type="text" id="size" name="size" placeholder="<%=product.getSize()%>"><br>

        <%-- Description field --%>
        <label for="description">Description:</label><br>
        <textarea id="description" name="description" placeholder="<%=product.getDescription()%>"></textarea><br>

        <%-- Submit button --%>
        <input type="submit" value="Update">
    </form>
</body>
</html>
