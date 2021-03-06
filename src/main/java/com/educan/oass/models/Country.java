package com.educan.oass.models;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class Country {
    private int countryId;
    private String countryName;

    public Country() {
    }

    public Country(String countryName) { 
        this.countryName = countryName;
    }

    public int getCountryId() {
        return countryId;
    }

    public void setCountryId(int countryId) {
        this.countryId = countryId;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
}
