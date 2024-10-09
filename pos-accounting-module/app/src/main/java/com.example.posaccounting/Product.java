import com.google.gson.annotations.SerializedName;

public class Product {
    @SerializedName("name")
    private String name;
    
    @SerializedName("price")
    private double price;
    
    @SerializedName("stock")
    private int stock;

    // Getters and Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    
    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }
}
