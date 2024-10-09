public class Main {
    public static void main(String[] args) {
        POSSystem pos = new POSSystem();

        // Adding some products
        pos.addProduct(new Product("Apple", 0.5));
        pos.addProduct(new Product("Banana", 0.2));

        // Listing products
        pos.listProducts();

        // Recording some sales
        pos.recordSale(new Product("Apple", 0.5), 10);
        pos.recordSale(new Product("Banana", 0.2), 5);

        // Display total sales
        System.out.println("Total Sales: " + pos.getTotalSales());
    }
}
