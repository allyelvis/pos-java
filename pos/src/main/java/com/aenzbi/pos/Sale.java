package com.aenzbi.pos;

import java.time.LocalDateTime;

public class Sale {
    private Product product;
    private int quantity;
    private LocalDateTime date;

    public Sale(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
        this.date = LocalDateTime.now();
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public LocalDateTime getDate() {
        return date;
    }
}
