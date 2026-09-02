<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.practice.ecommerce.model.Product" %>

<%
    List<Product> products =
            (List<Product>) request.getAttribute("products");
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Products - My E-Commerce Store</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f3f3f3;
            color: #111;
        }

        /* ================= HEADER ================= */

        .header {
            height: 65px;
            background: #131921;
            color: white;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 40px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .nav {
            display: flex;
            gap: 25px;
        }

        .nav a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        .nav a:hover {
            color: #ff9900;
        }

        /* ================= LAYOUT ================= */

        .page {
            display: flex;
            max-width: 1500px;
            margin: auto;
            padding: 25px;
            gap: 25px;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            width: 220px;
            background: white;
            padding: 20px;

            border-radius: 8px;

            height: fit-content;

            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .sidebar h3 {
            margin-top: 0;
            font-size: 20px;
        }

        .category {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
            cursor: pointer;
        }

        .category:hover {
            color: #e47911;
        }

        /* ================= PRODUCT SECTION ================= */

        .product-section {
            flex: 1;
        }

        .title {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .title h1 {
            margin: 0;
            font-size: 30px;
        }

        .title p {
            color: #666;
            margin-bottom: 0;
        }

        /* ================= PRODUCT GRID ================= */

        .products {

            display: grid;

            grid-template-columns:
                repeat(4, minmax(200px, 1fr));

            gap: 20px;
        }

        /* ================= PRODUCT CARD ================= */

        .product-card {

            background: white;

            border-radius: 8px;

            overflow: hidden;

            padding-bottom: 18px;

            transition: 0.25s;

            box-shadow:
                0 2px 8px rgba(0,0,0,0.10);

        }

        .product-card:hover {

            transform: translateY(-5px);

            box-shadow:
                0 7px 20px rgba(0,0,0,0.18);

        }

        /* ================= IMAGE ================= */

        .image-box {

            width: 100%;
            height: 230px;

            background: white;

            display: flex;
            align-items: center;
            justify-content: center;

            overflow: hidden;
        }

        .image-box img {

            width: 100%;
            height: 100%;

            object-fit: contain;

            transition: transform 0.3s;

        }

        .product-card:hover .image-box img {

            transform: scale(1.06);

        }

        /* ================= DETAILS ================= */

        .details {

            padding: 15px;
        }

        .product-name {

            font-size: 19px;
            font-weight: bold;

            margin-bottom: 8px;
        }

        .description {

            color: #555;

            font-size: 14px;

            line-height: 1.4;

            height: 40px;

            overflow: hidden;
        }

        /* ================= RATING ================= */

        .rating {

            margin-top: 10px;

            color: #ff9900;

            font-size: 15px;
        }

        .rating-number {

            color: #555;
            margin-left: 5px;
        }

        /* ================= PRICE ================= */

        .price {

            font-size: 25px;

            font-weight: bold;

            margin-top: 12px;

            color: #111;
        }

        /* ================= DISCOUNT ================= */

        .discount {

            display: inline-block;

            background: #cc0c39;

            color: white;

            padding: 5px 8px;

            font-size: 12px;

            margin-top: 8px;

            border-radius: 3px;

        }

        /* ================= ADD CART ================= */

        .cart-form {

            margin-top: 15px;
        }

        .add-cart {

            width: 100%;

            border: none;

            border-radius: 20px;

            padding: 12px;

            background: #ffd814;

            color: #111;

            font-size: 15px;

            font-weight: bold;

            cursor: pointer;

        }

        .add-cart:hover {

            background: #f7ca00;

        }

        /* ================= FOOTER ================= */

        .footer {

            background: #131921;

            color: white;

            text-align: center;

            padding: 25px;

            margin-top: 30px;

        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1100px) {

            .products {

                grid-template-columns:
                    repeat(3, 1fr);

            }

        }

        @media (max-width: 800px) {

            .page {

                flex-direction: column;

            }

            .sidebar {

                width: 100%;
            }

            .products {

                grid-template-columns:
                    repeat(2, 1fr);

            }

        }

        @media (max-width: 500px) {

            .header {

                padding: 0 15px;
            }

            .logo {

                font-size: 18px;
            }

            .products {

                grid-template-columns:
                    1fr;

            }

        }

    </style>

</head>


<body>


<!-- ================= HEADER ================= -->

<header class="header">

    <div class="logo">

        🛍️ My E-Commerce Store

    </div>


    <nav class="nav">

        <a href="${pageContext.request.contextPath}/">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/products">
            Products
        </a>

        <a href="${pageContext.request.contextPath}/cart">
            🛒 View Cart
        </a>

    </nav>

</header>



<!-- ================= PAGE ================= -->

<div class="page">


    <!-- ================= SIDEBAR ================= -->

    <aside class="sidebar">

        <h3>Category</h3>

        <div class="category">
            Electronics
        </div>

        <div class="category">
            Laptops
        </div>

        <div class="category">
            Smartphones
        </div>

        <div class="category">
            Headphones
        </div>

        <div class="category">
            Computer Accessories
        </div>

        <div class="category">
            Cables
        </div>

        <br>

        <h3>Customer Reviews</h3>

        <div>
            ⭐⭐⭐⭐⭐
        </div>

        <div style="margin-top:10px;">
            ⭐⭐⭐⭐☆
        </div>

    </aside>



    <!-- ================= PRODUCTS ================= -->

    <main class="product-section">


        <div class="title">

            <h1>Our Products</h1>

            <p>
                Explore our latest electronics and accessories
            </p>

        </div>



        <div class="products">


            <%

                if (products != null) {

                    for (Product product : products) {

            %>


            <!-- PRODUCT CARD -->

            <div class="product-card">


                <!-- IMAGE -->

                <div class="image-box">

                    <img

                        src="<%= product.getImageUrl() %>"

                        alt="<%= product.getName() %>"

                        onerror="this.src='https://placehold.co/600x400?text=Product+Image';"

                    >

                </div>



                <!-- DETAILS -->

                <div class="details">


                    <div class="product-name">

                        <%= product.getName() %>

                    </div>



                    <div class="description">

                        <%= product.getDescription() %>

                    </div>



                    <!-- RATING -->

                    <div class="rating">

                        ⭐⭐⭐⭐⭐

                        <span class="rating-number">

                            <%= product.getRating() %>

                        </span>

                    </div>



                    <!-- DISCOUNT -->

                    <div class="discount">

                        Limited time deal

                    </div>



                    <!-- PRICE -->

                    <div class="price">

                        ₹<%= String.format(
                                "%,.0f",
                                product.getPrice()
                            ) %>

                    </div>



                    <!-- ADD CART -->

                    <form

                        class="cart-form"

                        action="${pageContext.request.contextPath}/cart"

                        method="post"

                    >

                        <input

                            type="hidden"

                            name="productId"

                            value="<%= product.getId() %>"

                        >


                        <input

                            type="hidden"

                            name="action"

                            value="add"

                        >


                        <button

                            type="submit"

                            class="add-cart"

                        >

                            🛒 Add to Cart

                        </button>

                    </form>


                </div>


            </div>


            <%

                    }

                }

            %>


        </div>


    </main>


</div>



<!-- ================= FOOTER ================= -->

<footer class="footer">

    My E-Commerce Store © 2026

</footer>


</body>

</html>
