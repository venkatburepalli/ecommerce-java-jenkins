<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>E-Commerce App</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        a { text-decoration: none; }
        .button { padding: 10px 16px; background: #333; color: white; border-radius: 4px; }
    </style>
</head>
<body>
    <h1>Welcome to My E-Commerce Store</h1>
    <p>This application is deployed on Apache Tomcat.</p>
    <a class="button" href="${pageContext.request.contextPath}/products">
        View Products
    </a>
</body>
</html>
