package com.educan.oass.services;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class LoginIdentity {
    private int userid;
    private String username;
    private String firstName;
    private String lastName;
    private String role;
    
    public LoginIdentity() {
    }
    
    public LoginIdentity(int userid, String username, String firstName, String lastName,String role) {
        this.userid = userid;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role=role;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
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
    
    public String getRole() {
        return role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
    
}
