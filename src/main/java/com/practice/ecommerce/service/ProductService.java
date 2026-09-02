package com.practice.ecommerce.service;

import com.practice.ecommerce.model.Product;

import java.util.List;

public class ProductService {

    private static final List<Product> PRODUCTS = List.of(

        new Product(
            1,
            "Laptop",
            65000,
            "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=800",
            "Powerful laptop for work, study and entertainment"
        ),

        new Product(
            2,
            "Smartphone",
            30000,
            "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=800",
            "Modern smartphone with excellent camera and display"
        ),

        new Product(
            3,
            "Headphones",
            2500,
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800",
            "Wireless headphones with clear and powerful sound"
        ),

        new Product(
            4,
            "Keyboard",
            1500,
            "https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=800",
            "Comfortable keyboard for office and gaming"
        ),

        new Product(
            5,
            "Mouse",
            800,
            "https://images.unsplash.com/photo-1527814050087-3793815479db?w=800",
            "Ergonomic wireless mouse"
        ),

        new Product(
            6,
            "Monitor",
            12000,
            "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=800",
            "Full HD monitor for work and entertainment"
        ),

        new Product(
            7,
            "USB-C Cable",
            600,
            "https://images.unsplash.com/photo-1625842268584-8f3296236761?w=800",
            "Fast charging and data transfer USB-C cable"
        ),

        new Product(
            8,
            "Power Bank",
            1800,
            "https://images.unsplash.com/photo-1609592424983-2b1a4d5a8a4c?w=800",
            "Portable power bank for your devices"
        )
    );

    public List<Product> getAllProducts() {

        return PRODUCTS;
    }

    public Product getProductById(int id) {

        return PRODUCTS.stream()
                .filter(product -> product.getId() == id)
                .findFirst()
                .orElse(null);
    }
}
