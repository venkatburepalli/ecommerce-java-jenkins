package com.practice.ecommerce.model;

public class Product {

    private final int id;
    private final String name;
    private final double price;
    private final String imageUrl;
    private final String description;

    public Product(
            int id,
            String name,
            double price,
            String imageUrl,
            String description) {

        this.id = id;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getDescription() {
        return description;
    }
}
