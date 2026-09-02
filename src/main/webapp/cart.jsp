<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.practice.ecommerce.model.Product" %>
<%
    List<Product> cart = (List<Product>) request.getAttribute("cart");
    double total = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { border-collapse: collapse; width: 70%; }
        th, td { border: 1px solid #ccc; padding: 12px; }
        th { background: #eee; }
    </style>
</head>
<body>
    <a href="${pageContext.request.contextPath}/products">← Continue Shopping</a>

    <h1>Shopping Cart</h1>

    <% if (cart.isEmpty()) { %>
        <p>Your cart is empty.</p>
    <% } else { %>
        <table>
            <tr>
                <th>Product</th>
                <th>Price</th>
            </tr>

            <% for (Product product : cart) {
                total += product.getPrice();
            %>
            <tr>
                <td><%= product.getName() %></td>
                <td>₹<%= String.format("%.2f", product.getPrice()) %></td>
            </tr>
            <% } %>

            <tr>
                <th>Total</th>
                <th>₹<%= String.format("%.2f", total) %></th>
            </tr>
        </table>
    <% } %>
</body>
</html>
