package com.practice.ecommerce.model;

public class Product {

    private int id;
    private String name;
    private double price;
    private String imageUrl;
    private String description;
    private double rating;

    public Product(int id, String name, double price,
                   String imageUrl, String description,
                   double rating) {

        this.id = id;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
        this.rating = rating;
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

    public double getRating() {
        return rating;
    }
}
