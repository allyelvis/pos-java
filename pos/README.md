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
   ```
   cd pos
   ```
2. Build the project and install dependencies:
   ```
   mvn clean install
   ```
3. Run the main application:
   ```
   mvn exec:java -Dexec.mainClass="com.aenzbi.pos.Main"
   ```
4. Run the tests:
   ```
   mvn test
   ```
