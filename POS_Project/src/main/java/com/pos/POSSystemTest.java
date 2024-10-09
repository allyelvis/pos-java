import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class POSSystemTest {
    private POSSystem posSystem;
    private Product product;

    @BeforeEach
    public void setUp() {
        posSystem = new POSSystem();
        product = new Product("Test Product", 10.0);
        posSystem.addProduct(product);
    }

    @Test
    public void testAddProduct() {
        assertEquals(1, posSystem.getProducts().size());
    }

    @Test
    public void testRecordSale() {
        posSystem.recordSale(product, 1);
        assertEquals(10.0, posSystem.getTotalSales());
    }

    @Test
    public void testStockCheck() {
        posSystem.recordSale(product, 1);
        assertEquals(90, posSystem.getInventory().getStock(product)); // Assuming initial stock is 100
    }

    @Test
    public void testSalesSummary() {
        posSystem.recordSale(product, 1);
        assertEquals(10.0, posSystem.getTotalSales());
        assertEquals(1, posSystem.getSales().size());
    }
}
