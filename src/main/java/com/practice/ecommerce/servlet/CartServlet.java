package com.practice.ecommerce.servlet;

import com.practice.ecommerce.model.CartItem;
import com.practice.ecommerce.model.Product;
import com.practice.ecommerce.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private final ProductService productService =
            new ProductService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Map<Integer, CartItem> cart =
                getCart(request.getSession());

        request.setAttribute("cart", cart);

        request.getRequestDispatcher(
                "/cart.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();

        Map<Integer, CartItem> cart =
                getCart(session);

        String action =
                request.getParameter("action");

        try {

            int productId =
                    Integer.parseInt(
                            request.getParameter("productId")
                    );

            Product product =
                    productService.getProductById(productId);

            if (product == null) {
                response.sendRedirect(
                        request.getContextPath()
                                + "/products"
                );
                return;
            }

            /*
             * ADD PRODUCT
             *
             * If product is not already in cart:
             * quantity = 1
             *
             * If product already exists:
             * quantity + 1
             */
            if ("add".equals(action)) {

                CartItem item =
                        cart.get(productId);

                if (item == null) {

                    cart.put(
                            productId,
                            new CartItem(product, 1)
                    );

                } else {

                    item.setQuantity(
                            item.getQuantity() + 1
                    );
                }
            }

            /*
             * UPDATE QUANTITY
             */
            else if ("update".equals(action)) {

                int quantity =
                        Integer.parseInt(
                                request.getParameter("quantity")
                        );

                /*
                 * Quantity cannot be negative.
                 *
                 * If quantity is 0,
                 * remove product from cart.
                 */
                if (quantity <= 0) {

                    cart.remove(productId);

                } else {

                    CartItem item =
                            cart.get(productId);

                    if (item != null) {

                        item.setQuantity(quantity);

                    } else {

                        cart.put(
                                productId,
                                new CartItem(product, quantity)
                        );
                    }
                }
            }

            /*
             * REMOVE PRODUCT
             */
            else if ("remove".equals(action)) {

                cart.remove(productId);
            }

        } catch (NumberFormatException e) {

            // Ignore invalid product ID or quantity
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/cart"
        );
    }

    @SuppressWarnings("unchecked")
    private Map<Integer, CartItem> getCart(
            HttpSession session) {

        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>)
                        session.getAttribute("cart");

        if (cart == null) {

            cart = new LinkedHashMap<>();

            session.setAttribute(
                    "cart",
                    cart
            );
        }

        return cart;
    }
}
