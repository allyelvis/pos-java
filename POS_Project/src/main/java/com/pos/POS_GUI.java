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
