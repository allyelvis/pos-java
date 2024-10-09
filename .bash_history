
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
git add .
git commit -m"update"
git push origin main
#!/bin/bash
# Define project root directory
PROJECT_DIR="pos"
# Create project directories
mkdir -p $PROJECT_DIR/src/main/java/com/aenzbi/pos
mkdir -p $PROJECT_DIR/src/test/java
# Generate README file
cat >$PROJECT_DIR/README.md <<EOL
# Aenzbi POS Project

This is a Point of Sale (POS) system implemented in Java with Maven as the build tool.

## Features
- Manage products
- Record sales
- Inventory management
- User authentication with a GUI
- Detailed sales reporting

## How to Build and Run
1. Navigate to the project directory:
   \`\`\`
   cd pos
   \`\`\`
2. Build the project and install dependencies:
   \`\`\`
   mvn clean install
   \`\`\`
3. Run the main application:
   \`\`\`
   mvn exec:java -Dexec.mainClass="com.aenzbi.pos.Main"
   \`\`\`
4. Run the tests:
   \`\`\`
   mvn test
   \`\`\`
EOL

# Generate Main.java
cat >$PROJECT_DIR/src/main/java/com/aenzbi/pos/Main.java <<EOL
package com.aenzbi.pos;

public class Main {
    public static void main(String[] args) {
        POSSystem posSystem = new POSSystem();
        Login login = new Login();
        login.addUser(new User("admin", "admin")); // Default user for testing
        new POS_GUI(posSystem, login);
    }
}
EOL

# Generate POSSystem.java
cat >$PROJECT_DIR/src/main/java/com/aenzbi/pos/POSSystem.java <<EOL
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
EOL

# Generate Product.java
cat >$PROJECT_DIR/src/main/java/com/aenzbi/pos/Product.java <<EOL
package com.aenzbi.pos;

public class Product {
    private String name;
    private double price;
    private int quantity;

    public Product(String name, double price, int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void reduceQuantity(int qty) {
        this.quantity -= qty;
    }
}
EOL

# Generate Sale.java
cat >$PROJECT_DIR/src/main/java/com/aenzbi/pos/Sale.java <<EOL
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
EOL

# Generate Login.java
cat >$PROJECT_DIR/src/main/java/com/aenzbi/pos/Login.java <<EOL
package com.aenzbi.pos;

import java.util.HashMap;
import java.util.Map;

public class Login {
    private Map<String, String> users = new HashMap<>();

    public void addUser(User user) {
        users.put(user.getUsername(), user.getPassword());
    }

    public boolean authenticate(String username, String password) {
        return users.containsKey(username) && users.get(username).equals(password);
    }
}
EOL

# Generate User.java
cat >$PROJECT_DIR/src/main/java/com/aenzbi/pos/User.java <<EOL
package com.aenzbi.pos;

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

# Generate POS_GUI.java (Simplified Swing GUI)
cat >$PROJECT_DIR/src/main/java/com/aenzbi/pos/POS_GUI.java <<EOL
package com.aenzbi.pos;

import javax.swing.*;

public class POS_GUI {
    public POS_GUI(POSSystem posSystem, Login login) {
        JFrame frame = new JFrame("Aenzbi POS System");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 300);

        // Create UI elements
        JPanel panel = new JPanel();
        JLabel label = new JLabel("Welcome to Aenzbi POS");
        JButton loginButton = new JButton("Login");

        // Add elements to panel
        panel.add(label);
        panel.add(loginButton);

        // Add panel to frame
        frame.add(panel);
        frame.setVisible(true);
    }
}
EOL

# Generate pom.xml for Maven dependencies
cat > $PROJECT_DIR/pom.xml <<EOL
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://www.w3.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.aenzbi</groupId>
    <artifactId>pos</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <!-- JUnit 5 for Testing -->
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-api</artifactId>
            <version>5.8.1</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-engine</artifactId>
            <version>5.8.1</version>
            <scope>test</scope>
        </dependency>

    </dependencies>

    <build>
        <plugins>
            <!-- Compiler plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <source>11</source>
                    <target>11</target>
                </configuration>
            </plugin>

            <!-- Surefire plugin for running tests -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.22.2</version>
            </plugin>
        </plugins>
    </build>
</project>
EOL

# Add .gitignore file
cat > $PROJECT_DIR/.gitignore <<EOL
# Ignore compiled files
*.class
/target
EOL

# Print completion message
echo "Aenzbi POS project structure generated successfully."
ls -la
cd pos 
ls -la
cd src
ls -la
cd main
ls -la
cd java
ls -la
cd com
ls -la
cd aenzbi
ls -la
cd pos
ls -la
cd
