import com.google.gson.annotations.SerializedName;

import java.util.List;

public class Invoice {
    @SerializedName("products")
    private List<ProductItem> products;
    
    @SerializedName("totalAmount")
    private double totalAmount;

    // Getters and Setters
    public List<ProductItem> getProducts() { return products; }
    public void setProducts(List<ProductItem> products) { this.products = products; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
}

class ProductItem {
    @SerializedName("product")
    private String productId;
    
    @SerializedName("quantity")
    private int quantity;

    // Getters and Setters
    public String getProductId() { return productId; }
    public void setProductId(String productId) { this.productId = productId; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
