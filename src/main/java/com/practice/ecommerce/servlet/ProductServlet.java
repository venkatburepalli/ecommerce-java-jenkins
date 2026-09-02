package com.practice.ecommerce.servlet;

import com.practice.ecommerce.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private final ProductService productService =
            new ProductService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute(
                "products",
                productService.getAllProducts()
        );

        request.getRequestDispatcher(
                "/products.jsp"
        ).forward(request, response);
    }
}
