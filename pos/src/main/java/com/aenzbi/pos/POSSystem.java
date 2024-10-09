package com.aenzbi.pos;

import java.util.ArrayList;
import java.util.List;

public class POSSystem {
    private List<Product> products = new ArrayList<>();
    private List<Sale> sales = new ArrayList<>();

    public void addProduct(Product product) {
        products.add(product);
    }

    public void recordSale(Sale sale) {
        sales.add(sale);
    }

    public List<Product> getProducts() {
        return products;
    }

    public List<Sale> getSales() {
        return sales;
    }
}
