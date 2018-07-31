package com.educan.oass.models;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
/**
 * Consultant Public Profile
 */
public class ConsultantProfile {
    private int consultantId;
    private String consultantName;
    private String qualification;
    private String countrySpeciality;
    private String fieldSpeciality;

    public int getConsultantId() {
        return consultantId;
    }

    public void setConsultantId(int consultantId) {
        this.consultantId = consultantId;
    }

    public String getConsultantName() {
        return consultantName;
    }

    public void setConsultantName(String consultantName) {
        this.consultantName = consultantName;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getCountrySpeciality() {
        return countrySpeciality;
    }

    public void setCountrySpeciality(String countrySpeciality) {
        this.countrySpeciality = countrySpeciality;
    }

    public String getFieldSpeciality() {
        return fieldSpeciality;
    }

    public void setFieldSpeciality(String fieldSpeciality) {
        this.fieldSpeciality = fieldSpeciality;
    }
    
    
}
