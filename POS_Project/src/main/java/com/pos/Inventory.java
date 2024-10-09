import java.util.HashMap;
import java.util.Map;

public class Inventory {
    private Map<Product, Integer> stock = new HashMap<>();

    public void addStock(Product product, int quantity) {
        stock.put(product, stock.getOrDefault(product, 0) + quantity);
    }

    public boolean checkStock(Product product, int quantity) {
        return stock.getOrDefault(product, 0) >= quantity;
    }

    public void reduceStock(Product product, int quantity) {
        if (checkStock(product, quantity)) {
            stock.put(product, stock.get(product) - quantity);
        } else {
            System.out.println("Not enough stock for " + product.getName());
        }
    }

    public void listStock() {
        for (Map.Entry<Product, Integer> entry : stock.entrySet()) {
            Product product = entry.getKey();
            System.out.println(product + ", Quantity: " + entry.getValue());
        }
    }
}
