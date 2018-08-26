package com.educan.oass.models;

import java.sql.Date;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class Consultant {
    private int consultantId;
    private String email;
    
    private String firstName;
    private String lastName;
    private String gender;
    private String title;
    private Date dateOfBirth;
    private String qualification;
    private String phoneNumber;
    private String mobileNumber;

    public Consultant() {
    }

    public Consultant(int consultantId, String email, String firstName, String lastName, String gender, String title, Date dateOfBirth, String qualification, String phoneNumber, String mobileNumber) {
        this.consultantId = consultantId;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.title = title;
        this.dateOfBirth = dateOfBirth;
        this.qualification = qualification;
        this.phoneNumber = phoneNumber;
        this.mobileNumber = mobileNumber;
    }
    
    public int getConsultantId() {
        return consultantId;
    }
    
    public void setConsultantId(int consultantId) {
        this.consultantId = consultantId;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
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
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public Date getDateOfBirth() {
        return dateOfBirth;
    }
    
    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    public String getQualification() {
        return qualification;
    }
    
    public void setQualification(String qualification) {
        this.qualification = qualification;
    }
    
    public String getPhoneNumber() {
        return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    public String getMobileNumber() {
        return mobileNumber;
    }
    
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }
    
}
