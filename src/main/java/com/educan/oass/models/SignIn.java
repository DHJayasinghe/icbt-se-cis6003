package com.educan.oass.models;

import org.springframework.security.crypto.bcrypt.BCrypt;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class SignIn {

    private String username;
    private String password;

    private boolean loginAttempt; //login attempt (false=fail | true=success)
    private String hashed;  //hashed password

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setHashed(String hashed) {
        this.hashed = hashed;
    }

    public boolean getLoginAttempt() {
        //check login attempt by comparing input password and stored hash password from database
        loginAttempt = BCrypt.checkpw(password, hashed);
        return loginAttempt;
    }
}
