import java.util.ArrayList;
import java.util.List;

public class POSSystem {
    private List<Product> products = new ArrayList<>();
    private List<Sale> sales = new ArrayList<>();
    private Inventory inventory = new Inventory();

    public void addProduct(Product product) {
        products.add(product);
        inventory.addStock(product, 100); // Initialize stock with 100 units
    }

    public void recordSale(Product product, int quantity) {
        if (inventory.checkStock(product, quantity)) {
            sales.add(new Sale(product, quantity));
            inventory.reduceStock(product, quantity);
        } else {
            System.out.println("Not enough stock for " + product.getName());
        }
    }

    public double getTotalSales() {
        double total = 0;
        for (Sale sale : sales) {
            total += sale.getTotal();
        }
        return total;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void listProducts() {
        for (Product product : products) {
            System.out.println(product);
        }
    }

    public void listStock() {
        inventory.listStock();
    }

    public void listSales() {
        for (Sale sale : sales) {
            System.out.println(sale);
        }
    }

    public void printSalesSummary() {
        System.out.println("Total Sales Amount: " + getTotalSales());
        System.out.println("Number of Sales: " + sales.size());
    }
}
