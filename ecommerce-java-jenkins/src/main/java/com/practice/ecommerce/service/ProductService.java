package com.practice.ecommerce.service;

import com.practice.ecommerce.model.Product;

import java.util.List;

public class ProductService {

    private static final List<Product> PRODUCTS = List.of(
            new Product(1, "Laptop", 65000),
            new Product(2, "Smartphone", 30000),
            new Product(3, "Headphones", 2500),
            new Product(4, "Keyboard", 1500),
            new Product(5, "Mouse", 800)
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
