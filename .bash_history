
        JButton authenticateButton = new JButton("Login");
        authenticateButton.addActionListener(new LoginListener());
        frame.add(authenticateButton, BorderLayout.SOUTH);

        frame.setVisible(true);
    }

    private class AddProductListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String name = productNameField.getText();
            try {
                double price = Double.parseDouble(productPriceField.getText());
                posSystem.addProduct(new Product(name, price));
                textArea.append("Added Product: " + name + " at Price: " + price + "\n");
            } catch (NumberFormatException ex) {
                textArea.append("Invalid price. Please enter a numeric value.\n");
            }
        }
    }

    private class RecordSaleListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String name = productNameField.getText();
            try {
                int quantity = Integer.parseInt(quantityField.getText());
                for (Product product : posSystem.getProducts()) {
                    if (product.getName().equals(name)) {
                        posSystem.recordSale(product, quantity);
                        textArea.append("Recorded Sale: " + quantity + " of " + name + "\n");
                        return;
                    }
                }
                textArea.append("Product not found.\n");
            } catch (NumberFormatException ex) {
                textArea.append("Invalid quantity. Please enter a numeric value.\n");
            }
        }
    }

    private class LoginListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String username = usernameField.getText();
            String password = passwordField.getText();
            if (login.authenticate(username, password)) {
                textArea.append("Login successful!\n");
            } else {
                textArea.append("Login failed.\n");
            }
        }
    }

    public static void main(String[] args) {
        POSSystem pos = new POSSystem();
        Login login = new Login();
        login.addUser(new User("admin", "admin")); // Default user

        // Show GUI
        new POS_GUI(pos, login);
    }
}
EOL

echo "POS project structure created successfully!"
ls -la
gcloud config set project default-project-1728434799
#!/bin/bash
# Create project directory
mkdir -p POS_Project/src/main/java/com/pos
cd POS_Project
# Generate README file
cat > README.md <<EOL
# POS Project

This is a simple Point of Sale (POS) system implemented in Java.

## Features
- Manage products
- Record sales
- Inventory management
- User authentication with a GUI
- Detailed sales reporting

## How to Run
1. Compile the Java files:
   \`\`\`
   javac src/main/java/com/pos/*.java
   \`\`\`
2. Run the main application:
   \`\`\`
   java com.pos.POS_GUI
   \`\`\`
EOL

# Generate Java files with enhanced functionality
cat > src/main/java/com/pos/Product.java <<EOL
public class Product {
    private String name;
    private double price;

    public Product(String name, double price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "Product: " + name + ", Price: " + price;
    }
}
EOL

cat > src/main/java/com/pos/Sale.java <<EOL
public class Sale {
    private Product product;
    private int quantity;

    public Sale(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public double getTotal() {
        return product.getPrice() * quantity;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    @Override
    public String toString() {
        return "Sale: " + quantity + " x " + product.getName() + " = " + getTotal();
    }
}
EOL

cat > src/main/java/com/pos/POSSystem.java <<EOL
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
EOL

cat > src/main/java/com/pos/Inventory.java <<EOL
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
EOL

cat > src/main/java/com/pos/User.java <<EOL
public class User {
    private String username;
    private String password;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}
EOL

cat > src/main/java/com/pos/Login.java <<EOL
import java.util.ArrayList;
import java.util.List;

public class Login {
    private List<User> users = new ArrayList<>();

    public void addUser(User user) {
        users.add(user);
    }

    public boolean authenticate(String username, String password) {
        for (User user : users) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }
}
EOL

cat > src/main/java/com/pos/POS_GUI.java <<EOL
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class POS_GUI {
    private POSSystem posSystem;
    private JFrame frame;
    private JTextArea textArea;
    private JTextField productNameField;
    private JTextField productPriceField;
    private JTextField quantityField;
    private JTextField usernameField;
    private JTextField passwordField;
    private Login login;

    public POS_GUI(POSSystem posSystem, Login login) {
        this.posSystem = posSystem;
        this.login = login;
        initialize();
    }

    private void initialize() {
        frame = new JFrame("POS System");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(600, 500);
        frame.setLayout(new BorderLayout());

        textArea = new JTextArea();
        textArea.setEditable(false);
        frame.add(new JScrollPane(textArea), BorderLayout.CENTER);

        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(7, 2));

        // Product Name
        panel.add(new JLabel("Product Name:"));
        productNameField = new JTextField();
        panel.add(productNameField);

        // Product Price
        panel.add(new JLabel("Product Price:"));
        productPriceField = new JTextField();
        panel.add(productPriceField);

        // Quantity
        panel.add(new JLabel("Quantity:"));
        quantityField = new JTextField();
        panel.add(quantityField);

        // Username
        panel.add(new JLabel("Username:"));
        usernameField = new JTextField();
        panel.add(usernameField);

        // Password
        panel.add(new JLabel("Password:"));
        passwordField = new JTextField();
        panel.add(passwordField);

        frame.add(panel, BorderLayout.NORTH);

        // Buttons
        JButton addProductButton = new JButton("Add Product");
        addProductButton.addActionListener(new AddProductListener());
        frame.add(addProductButton, BorderLayout.WEST);

        JButton recordSaleButton = new JButton("Record Sale");
        recordSaleButton.addActionListener(new RecordSaleListener());
        frame.add(recordSaleButton, BorderLayout.EAST);

        JButton authenticateButton = new JButton("Login");
        authenticateButton.addActionListener(new LoginListener());
        frame.add(authenticateButton, BorderLayout.SOUTH);

        JButton summaryButton = new JButton("Show Sales Summary");
        summaryButton.addActionListener(new SummaryListener());
        frame.add(summaryButton, BorderLayout.CENTER);

        frame.setVisible(true);
    }

    private class AddProductListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String name = productNameField.getText();
            try {
                double price = Double.parseDouble(productPriceField.getText());
                posSystem.addProduct(new Product(name, price));
                textArea.append("Added Product: " + name + " at Price: " + price + "\n");
            } catch (NumberFormatException ex) {
                textArea.append("Invalid price. Please enter a numeric value.\n");
            }
        }
    }

    private class RecordSaleListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String name = productNameField.getText();
            try {
                int quantity = Integer.parseInt(quantityField.getText());
                for (Product product : posSystem.getProducts()) {
                    if (product.getName().equals(name)) {
                        posSystem.recordSale(product, quantity);
                        textArea.append("Recorded Sale: " + quantity + " of " + name + "\n");
                        return;
                    }
                }
                textArea.append("Product not found.\n");
            } catch (NumberFormatException ex) {
                textArea.append("Invalid quantity. Please enter a numeric value.\n");
            }
        }
    }

    private class LoginListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String username = usernameField.getText();
            String password = passwordField.getText();
            if (login.authenticate(username, password)) {
                textArea.append("Login successful!\n");
            } else {
                textArea.append("Login failed. Please check your credentials.\n");
            }
        }
    }

    private class SummaryListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            textArea.append("Sales Summary:\n");
            posSystem.printSalesSummary();
        }
    }

    public static void main(String[] args) {
        POSSystem posSystem = new POSSystem();
        Login login = new Login();
        login.addUser(new User("admin", "admin")); // Default user for testing
        new POS_GUI(posSystem, login);
    }
}
EOL

# Generate test class for unit testing
cat > src/main/java/com/pos/POSSystemTest.java <<EOL
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
EOL

# Add instructions to the README for testing
echo -e "\n## Running Tests\nTo run the unit tests, use the following command:\n\`\`\`bash\njavac -cp .:junit-platform-console-standalone-1.8.2.jar src/main/java/com/pos/*.java\njava -cp .:junit-platform-console-standalone-1.8.2.jar org.junit.runner.JUnitCore POSSystemTest\n\`\`\`" >> README.md
# Add .gitignore file
cat > .gitignore <<EOL
# Ignore compiled files
*.class
EOL

# Print completion message
echo "POS project structure created successfully in POS_Project directory."
ls -la
cd src
ls -la
cd main
ls -la
cd java
ls -la
cd com
ls -la
cd pos
ls -la
git config --global user.email "allyelvis6569@gmail.com"
git config --global user.name "allyelvis"
echo "# pos-java" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/allyelvis/pos-java.git
git push -u origin main
ls -la
cd pos-java
ls -la
git add .
git status
