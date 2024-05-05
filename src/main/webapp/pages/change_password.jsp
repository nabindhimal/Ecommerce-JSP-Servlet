<%@ include file="header.jsp" %>
<%@ page import="model.User" %>
<%@ page import="model.dao.ProductDao" %>
<%@ page import="controller.db.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
   
</head>
<body>
    <h1>Change Password</h1>

    <%-- Retrieve User --%>
    
    <%
    // Check if the user is logged in
    User user = (User) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect to access error page
    } 
    
%> 
    
  

  
    <form action="${pageContext.request.contextPath}/ChangePasswordServlet" method="post" >
        <input type="hidden" name="email" value="<%=user.getEmail()%>"><br> 
        <label for="password">New Password:</label><br>
        <input type="password" id="password" name="password" required ><br>

        <%-- Price field --%>
        <label for="retypePassword">Retype Password:</label><br>
        <input type="password" id="retypePassword" name="retypePassword"><br>

      
        <%-- Submit button --%>
        <input type="submit" value="Update">
    </form>
    <%@ include file="footor.jsp" %>
</body>
</html>
