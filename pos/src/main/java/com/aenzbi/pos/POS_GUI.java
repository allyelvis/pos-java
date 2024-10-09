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
