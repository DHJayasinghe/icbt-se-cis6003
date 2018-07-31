package com.educan.oass.models;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class Speciality {
    private int consultantId;
    private String fieldName;   //accept array of field Ids separated by comma
    private String countryName; //accept array of country Ids separated by comma

    public int getConsultantId() {
        return consultantId;
    }

    public void setConsultantId(int consultantId) {
        this.consultantId = consultantId;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
    
}
