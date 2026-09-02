package com.practice.ecommerce.servlet;

import com.practice.ecommerce.model.Product;
import com.practice.ecommerce.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Product> cart = getCart(session);

        request.setAttribute("cart", cart);
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String productId = request.getParameter("productId");

        try {
            int id = Integer.parseInt(productId);
            Product product = productService.getProductById(id);

            if (product != null) {
                HttpSession session = request.getSession();
                getCart(session).add(product);
            }
        } catch (NumberFormatException ignored) {
            // Invalid product ID - ignore the request.
        }

        response.sendRedirect(request.getContextPath() + "/products");
    }

    @SuppressWarnings("unchecked")
    private List<Product> getCart(HttpSession session) {
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        return cart;
    }
}
