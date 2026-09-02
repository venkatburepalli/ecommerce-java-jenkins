<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.practice.ecommerce.model.Product" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { border-collapse: collapse; width: 70%; }
        th, td { border: 1px solid #ccc; padding: 12px; text-align: left; }
        th { background: #eee; }
        button { padding: 7px 12px; }
        .top { margin-bottom: 20px; }
    </style>
</head>
<body>
    <div class="top">
        <a href="${pageContext.request.contextPath}/">Home</a> |
        <a href="${pageContext.request.contextPath}/cart">View Cart</a>
    </div>

    <h1>Products</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Product</th>
            <th>Price</th>
            <th>Action</th>
        </tr>

        <% for (Product product : products) { %>
        <tr>
            <td><%= product.getId() %></td>
            <td><%= product.getName() %></td>
            <td>₹<%= String.format("%.2f", product.getPrice()) %></td>
            <td>
                <form action="${pageContext.request.contextPath}/cart" method="post">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <button type="submit">Add to Cart</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
