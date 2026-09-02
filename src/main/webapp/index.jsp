<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

    <title>My E-Commerce Store</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }

        .button {
            display: inline-block;
            padding: 10px 16px;
            background: #333;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 8px;
        }

    </style>

</head>

<body>

    <h1>Welcome to My E-Commerce Store</h1>

    <p>
        Java Maven E-Commerce Application
    </p>

    <a class="button"
       href="${pageContext.request.contextPath}/products">

        View Products

    </a>

    <a class="button"
       href="${pageContext.request.contextPath}/cart">

        View Cart

    </a>

</body>

</html>
