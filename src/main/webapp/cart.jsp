<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.Map" %>

<%@ page import="com.practice.ecommerce.model.CartItem" %>

<%
    Map<Integer, CartItem> cart =
            (Map<Integer, CartItem>)
                    request.getAttribute("cart");

    double total = 0;
%>

<!DOCTYPE html>

<html>

<head>

    <title>Shopping Cart</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }

        table {
            border-collapse: collapse;
            width: 90%;
        }

        th,
        td {
            border: 1px solid #ccc;
            padding: 12px;
        }

        th {
            background: #eee;
        }

        button {
            padding: 6px 10px;
            cursor: pointer;
        }

        .quantity {
            width: 60px;
            padding: 6px;
            text-align: center;
        }

        .empty {
            font-size: 18px;
            margin-top: 20px;
        }

        .home {
            display: inline-block;
            margin-top: 10px;
        }

    </style>

</head>

<body>

<h1>Shopping Cart</h1>


<% if (cart == null || cart.isEmpty()) { %>


    <div class="empty">

        <p>
            No product is selected.
        </p>

        <a
            class="home"
            href="${pageContext.request.contextPath}/">

            Go to Home Page

        </a>

    </div>


<% } else { %>


    <table>

        <tr>

            <th>
                Select
            </th>

            <th>
                Product
            </th>

            <th>
                Price
            </th>

            <th>
                Quantity
            </th>

            <th>
                Subtotal
            </th>

            <th>
                Remove
            </th>

        </tr>


        <% for (CartItem item : cart.values()) {

            total += item.getSubtotal();

        %>


        <tr>

            <!-- Product selection -->

            <td>

                <input
                    type="checkbox"
                    class="product-check"
                    checked
                >

            </td>


            <!-- Product name -->

            <td>

                <%= item.getProduct().getName() %>

            </td>


            <!-- Product price -->

            <td>

                ₹<%= String.format(
                        "%.2f",
                        item.getProduct().getPrice()
                    ) %>

            </td>


            <!-- Quantity -->

            <td>

                <form
                    action="${pageContext.request.contextPath}/cart"
                    method="post"
                    style="display:inline;"
                >

                    <input
                        type="hidden"
                        name="productId"
                        value="<%= item.getProduct().getId() %>"
                    >

                    <input
                        type="hidden"
                        name="action"
                        value="update"
                    >


                    <!-- Decrease -->

                    <button
                        type="submit"
                        name="quantity"
                        value="<%= Math.max(
                                0,
                                item.getQuantity() - 1
                            ) %>"
                    >

                        −

                    </button>


                    <!-- Quantity input -->

                    <input
                        class="quantity"
                        type="number"
                        name="quantity"
                        value="<%= item.getQuantity() %>"
                        min="0"
                        onchange="this.form.submit()"
                    >


                    <!-- Increase -->

                    <button
                        type="submit"
                        name="quantity"
                        value="<%= item.getQuantity() + 1 %>"
                    >

                        +

                    </button>

                </form>

            </td>


            <!-- Subtotal -->

            <td>

                ₹<%= String.format(
                        "%.2f",
                        item.getSubtotal()
                    ) %>

            </td>


            <!-- Remove -->

            <td>

                <form
                    action="${pageContext.request.contextPath}/cart"
                    method="post"
                >

                    <input
                        type="hidden"
                        name="productId"
                        value="<%= item.getProduct().getId() %>"
                    >

                    <input
                        type="hidden"
                        name="action"
                        value="remove"
                    >

                    <button type="submit">

                        Remove

                    </button>

                </form>

            </td>

        </tr>


        <% } %>


        <!-- Total -->

        <tr>

            <th colspan="4">

                Cart Total

            </th>

            <th colspan="2">

                ₹<%= String.format(
                        "%.2f",
                        total
                    ) %>

            </th>

        </tr>

    </table>


    <p>

        <a
            href="${pageContext.request.contextPath}/products">

            ← Continue Shopping

        </a>

    </p>


    <script>

        const checkboxes =
            document.querySelectorAll(
                ".product-check"
            );


        checkboxes.forEach(function (checkbox) {

            checkbox.addEventListener(
                "change",
                function () {

                    let selected = false;


                    checkboxes.forEach(
                        function (item) {

                            if (item.checked) {

                                selected = true;

                            }

                        }
                    );


                    /*
                     * If no products are selected,
                     * show the empty message.
                     */

                    if (!selected) {

                        document.body.innerHTML =

                            '<div style="' +
                            'font-family:Arial;' +
                            'margin:40px;">' +

                            '<h1>Shopping Cart</h1>' +

                            '<p>' +
                            'No product is selected.' +
                            '</p>' +

                            '<a href="' +
                            '${pageContext.request.contextPath}/' +
                            '">' +

                            'Go to Home Page' +

                            '</a>' +

                            '</div>';

                    }

                }
            );

        });

    </script>


<% } %>

</body>

</html>
