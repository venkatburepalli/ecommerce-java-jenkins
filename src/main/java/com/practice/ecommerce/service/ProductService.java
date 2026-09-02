package com.practice.ecommerce.service;

import com.practice.ecommerce.model.Product;

import java.util.Arrays;
import java.util.List;

public class ProductService {

    private static final List<Product> PRODUCTS = Arrays.asList(

        new Product(
            1,
            "Laptop",
            65000,
            "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=800&q=80",
            "Powerful laptop for work, study and entertainment",
            4.5
        ),

        new Product(
            2,
            "Smartphone",
            30000,
            "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=800&q=80",
            "Modern smartphone with excellent camera and display",
            4.4
        ),

        new Product(
            3,
            "Headphones",
            2500,
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=800&q=80",
            "Wireless headphones with powerful sound quality",
            4.3
        ),

        new Product(
            4,
            "Keyboard",
            1500,
            "https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=800&q=80",
            "Comfortable keyboard for office and gaming",
            4.5
        ),

        new Product(
            5,
            "Mouse",
            800,
            "https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&w=800&q=80",
            "Ergonomic wireless mouse for daily use",
            4.4
        ),

        new Product(
            6,
            "Monitor",
            12000,
            "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&w=800&q=80",
            "High-quality monitor for work and entertainment",
            4.6
        ),

        new Product(
            7,
            "USB-C Cable",
            600,
            "https://images.unsplash.com/photo-1625842268584-8f3296236761?auto=format&fit=crop&w=800&q=80",
            "Fast charging and high-speed data transfer cable",
            4.2
        ),

        new Product(
            8,
            "Power Bank",
            1800,
            "https://images.unsplash.com/photo-1609592424983-2b1a4d5a8a4c?auto=format&fit=crop&w=800&q=80",
            "Portable power bank for your devices",
            4.3
        )

    );

    public List<Product> getAllProducts() {
        return PRODUCTS;
    }

    public Product getProductById(int id) {

        for (Product product : PRODUCTS) {

            if (product.getId() == id) {
                return product;
            }
        }

        return null;
    }
}
