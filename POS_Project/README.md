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
   ```
   javac src/main/java/com/pos/*.java
   ```
2. Run the main application:
   ```
   java com.pos.POS_GUI
   ```

## Running Tests
To run the unit tests, use the following command:
```bash
javac -cp .:junit-platform-console-standalone-1.8.2.jar src/main/java/com/pos/*.java
java -cp .:junit-platform-console-standalone-1.8.2.jar org.junit.runner.JUnitCore POSSystemTest
```
