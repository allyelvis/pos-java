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
