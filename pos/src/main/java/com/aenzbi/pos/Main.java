package com.aenzbi.pos;

public class Main {
    public static void main(String[] args) {
        POSSystem posSystem = new POSSystem();
        Login login = new Login();
        login.addUser(new User("admin", "admin")); // Default user for testing
        new POS_GUI(posSystem, login);
    }
}
