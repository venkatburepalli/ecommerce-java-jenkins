package com.practice.ecommerce.servlet;

import com.practice.ecommerce.model.CartItem;
import com.practice.ecommerce.model.Product;
import com.practice.ecommerce.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

        HttpSession session =
                request.getSession();

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

            else if ("update".equals(action)) {

                int quantity =
                        Integer.parseInt(
                                request.getParameter("quantity")
                        );

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

            else if ("remove".equals(action)) {

                cart.remove(productId);
            }

        } catch (NumberFormatException e) {

            // Ignore invalid input
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
