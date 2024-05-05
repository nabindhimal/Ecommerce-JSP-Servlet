<%-- <%@ page import="model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link
        href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css"
        rel="stylesheet" />
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/css/AdminHeader.css">

    <!-- <title>Insert title here</title> -->
</head>
<body>
<div class="all-home">
    <nav>
        <div class="nav-bar">
            <div class="home-icon">
                <a href="homepage.jsp"> <i class="ri-home-4-fill"></i> </a>
            </div>

            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Search">
            </div>

            <div class="cart-button">
                <a href="cart.jsp"> <i class="ri-shopping-cart-2-fill"></i> </a>
            </div>

            <div class="about-button">
                <a href="about.jsp"> About Us </a>
            </div>

            <div class="profile-menu">
                <%
                    User userObj = (User) session.getAttribute("loggedUser");
                    if (userObj == null) {
                %>
                    <a href="login.jsp"> <i class="ri-login-circle-line"></i> </a>
                <%
                    } else {
                        User user = (User) userObj;
                        if("admin".equals(user.getUserName()) || "admin@admin.com".equals(user.getEmail())) {response.sendRedirect(request.getContextPath() + "/access_error.jsp"); }
                        if (!"admin".equals(user.getUserName()) || !"admin@admin.com".equals(user.getEmail())) {
                %>
                    <a href="profile.jsp"> <i class="ri-user-3-fill"></i> </a>
                <%
                        }
                    }
                %>
            </div>

            <div class="logout-button">
                <%
                    userObj = (User) session.getAttribute("loggedUser");
                    if (userObj != null) {
                %>
                    <a href="<%=request.getContextPath()%>/LogoutServlet"> <i class="ri-logout-box-line"></i> </a>
                <%
                    }
                %>
            </div>

        </div>
    </nav>
</div>
</body>
</html>











 --%>
















<%-- 
<%@ page import="model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link
        href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css"
        rel="stylesheet" />
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/css/AdminHeader.css">

    <title>Insert title here</title>
</head>
<body>
<div class="all-home">
    <nav>
        <div class="nav-bar">
            <div class="home-icon">
                <a href="homepage.jsp"> <i class="ri-home-4-fill"></i> </a>
            </div>

            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Search">
            </div>

            <div class="cart-button">
                <a href="cart.jsp"> <i class="ri-shopping-cart-2-fill"></i> </a>
            </div>

            <div class="about-button">
                <a href="about.jsp"> About Us </a>
            </div>

            <div class="profile-menu">
                <%
                    User userObj = (User) session.getAttribute("loggedUser");
                    if (userObj == null) {
                %>
                    <a href="login.jsp"> <i class="ri-login-circle-line"></i> </a>
                <%
                    } else {
                        User user = (User) userObj;
                        if (!"admin".equals(user.getUserName()) || !"admin@admin.com".equals(user.getEmail())) {
                %>
                    <a href="profile.jsp"> <i class="ri-user-3-fill"></i> </a>
                <%
                        }
                    }
                %>
            </div>

            <div class="logout-button">
                <%
                       userObj = (User) session.getAttribute("loggedUser");
                    if (userObj != null) {
                %>
                    <a href="logout.jsp"> <i class="ri-logout-box-line"></i> </a>
                <%
                    }
                %>
            </div>

        </div>
    </nav>
</div>
</body>
</html> --%>
















































<%-- <%@ page import="model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/AdminHeader.css">
    <title>My Website</title>
</head>
<body>
<div class="all-home">
    <nav>
        <div class="nav-bar">
            <div class="home-icon">
                <a href="${pageContext.request.contextPath}/pages/homepage.jsp"> <i class="ri-home-4-fill"></i> </a>
            </div>

            <div class="search-bar">
                <form action="${pageContext.request.contextPath}/search" method="GET">
                    <input type="text" class="search-input" name="query" placeholder="Search">
                    <select name="searchType">
                        <option value="name">Name</option>
                        <option value="price">Price</option>
                    </select>
                    <button type="submit">Search</button>
                </form>
            </div>

            <div class="cart-button">
                <a href="${pageContext.request.contextPath}/pages/cart.jsp"> <i class="ri-shopping-cart-2-fill"></i> </a>
            </div>

            <div class="about-button">
                <a href="${pageContext.request.contextPath}/pages/about.jsp"> About Us </a>
            </div>

            <div class="profile-menu">
                <% 
                    User userObj = (User) session.getAttribute("loggedUser");
                    if (userObj == null) {
                %>
                    <a href="${pageContext.request.contextPath}/pages/login.jsp"> <i class="ri-login-circle-line"></i> </a>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/pages/profile.jsp"> <i class="ri-user-3-fill"></i> </a>
                <% } %>
            </div>

            <div class="logout-button">
                <% 
                    userObj = (User) session.getAttribute("loggedUser");
                    if (userObj != null) {
                %>
                    <a href="<%=request.getContextPath()%>/LogoutServlet"> <i class="ri-logout-box-line"></i> </a>
                <% } %>
            </div>
        </div>
    </nav>
</div>
</body>
</html> --%>



<%-- 
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/AdminHeader.css">
    <title>My Website</title>
</head>
<body>
<div class="all-home">
    <nav>
        <div class="nav-bar">
            <div class="home-icon">
                <a href="${pageContext.request.contextPath}/pages/homepage.jsp"> <i class="ri-home-4-fill"></i> </a>
            </div>

            <div class="search-bar">
                <form action="${pageContext.request.contextPath}/search" method="GET">
                    <input type="text" class="search-input" name="query" placeholder="Search">
                    <select name="searchType">
                        <option value="name">Name</option>
                        <option value="price">Price</option>
                    </select>
                    <button type="submit">Search</button>
                </form>
            </div>

            <div class="cart-button">
                <a href="${pageContext.request.contextPath}/pages/cart.jsp"> <i class="ri-shopping-cart-2-fill"></i> </a>
            </div>

            <div class="about-button">
                <a href="${pageContext.request.contextPath}/pages/about.jsp"> About Us </a>
            </div>

            <div class="profile-menu">
                <% 
                    User userObj = (User) session.getAttribute("loggedUser");
                    if (userObj == null) {
                %>
                    <a href="${pageContext.request.contextPath}/pages/login.jsp"> <i class="ri-login-circle-line"></i> </a>
                <% } else if (!"admin".equals(userObj.getUserName()) || !"admin@admin.com".equals(userObj.getEmail())) { %>
                    <a href="${pageContext.request.contextPath}/pages/profile.jsp"> <i class="ri-user-3-fill"></i> </a>
                <% } %>
            </div>

            <div class="logout-button">
                <% 
                    userObj = (User) session.getAttribute("loggedUser");
                    if (userObj != null && !"admin".equals(userObj.getUserName()) && !"admin@admin.com".equals(userObj.getEmail())) {
                %>
                    <a href="<%=request.getContextPath()%>/LogoutServlet"> <i class="ri-logout-box-line"></i> </a>
                <% } %>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
 --%>

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 <%@ page import="model.User" %>
<%
    User userObj = (User) session.getAttribute("loggedUser");
    if (userObj != null && ("admin".equals(userObj.getUserName()) || "admin@admin.com".equals(userObj.getEmail()))) {
        response.sendRedirect(request.getContextPath() + "/access_error.jsp"); // Redirect admin to access error page
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/AdminHeader.css">
    <title>My Website</title>
</head>
<body>
<div class="all-home">
    <nav>
        <div class="nav-bar">
            <div class="home-icon">
                <a href="${pageContext.request.contextPath}/pages/homepage.jsp"> H<i class="ri-home-4-fill"></i> </a>
            </div>

            <div class="search-bar">
                <form action="${pageContext.request.contextPath}/search" method="GET">
                    <input type="text" class="search-input" name="query" placeholder="Search">
                    <select name="searchType">
                        <option value="name">Name</option>
                        <option value="price">Price</option>
                    </select>
                    <button type="submit">Search</button>
                </form>
            </div>

            <div class="cart-button">
                <a href="${pageContext.request.contextPath}/pages/cart.jsp"> C<i class="ri-shopping-cart-2-fill"></i> </a>
            </div>

            <div class="about-button">
                <a href="${pageContext.request.contextPath}/pages/about.jsp"> About Us </a>
            </div>
            
             <div class="order-button">
                <a href="${pageContext.request.contextPath}/pages/orders.jsp"> Orders </a>
            </div>

            <div class="profile-menu">
                <% 
                    if (userObj == null) {
                %>
                    <a href="${pageContext.request.contextPath}/pages/login.jsp"> LI<i class="ri-login-circle-line"></i> </a>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/pages/profile.jsp"> P<i class="ri-user-3-fill"></i> </a>
                <% } %>
            </div>

            <div class="logout-button">
                <% 
                    if (userObj != null) {
                %>
                    <a href="<%=request.getContextPath()%>/LogoutServlet"> LO<i class="ri-logout-box-line"></i> </a>
                <% } %>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
 