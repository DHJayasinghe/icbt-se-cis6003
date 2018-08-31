package com.educan.oass.models;

import org.springframework.security.crypto.bcrypt.BCrypt;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class SignUp {

    private String token; //verification token
    private String firstName;
    private String lastName;
    private String username;
    private String password;

    public SignUp() {
    }

    public SignUp(String token, String firstName, String lastName, String username, String password) {
        this.token = token;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.password = password;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        // Hash a password for the first time using BCrypt
        // gensalt's log_rounds parameter determines the complexity
        // the work factor is 2**log_rounds, and the default is 10
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt(12));
        return hashed;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
