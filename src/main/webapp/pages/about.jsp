<%-- <%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
</head>
<body>
    <div class="about-us-content">
        <h1>About Us</h1>
        <p>We are a team of developers and designers who are passionate about creating innovative and user-friendly e-commerce solutions. Our mission is to provide a seamless shopping experience for our customers, and to help businesses grow online.</p>
        <p>If you have any questions or feedback, please don't hesitate to contact us.</p>
    </div>
    <%@ include file="footor.jsp" %>
</body>
</html> --%>

<%@ include file="header.jsp"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/about_us.css">
</head>
<body>
    <h1>About Us</h1>
    <p>
        Elite Screens is a leading manufacturer and distributor of projection screens and related accessories. We have been in business for over a decade and have established ourselves as a trusted name in the industry.
    </p>
    <p>
        Our mission is to provide high-quality products at affordable prices, backed by exceptional customer service. We offer a wide range of projection screens, including fixed frame, motorized, and portable screens, as well as accessories such as projector mounts and screen cleaning kits.
    </p>
    <p>
        Our team of experts is dedicated to helping our customers find the perfect projection solution for their needs. We pride ourselves on our attention to detail and our commitment to ensuring that every customer is completely satisfied with their purchase.
    </p>
    <p>
        Thank you for choosing Elite Screens. We look forward to serving you!
    </p>

    <!-- Feedback Form -->
    <h2>Feedback Form</h2>
    <form action="${pageContext.request.contextPath}/FeedbackServlet" method="post">
        <label for="email">Your Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="feedback">Your Feedback:</label><br>
        <textarea id="feedback" name="feedback" rows="4" cols="50" required></textarea><br><br>

        <input type="submit" value="Submit Feedback">
    </form>
</body>
<%@ include file="footor.jsp" %>
</html>
