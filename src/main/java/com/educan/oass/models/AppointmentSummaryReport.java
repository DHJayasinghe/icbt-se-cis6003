
package com.educan.oass.models;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class AppointmentSummaryReport {
    private String consultantName;
    private String fieldName;
    private int aptCount;
    private String year;
    private String month;
    private String weekDay;
    private String date;
    
    public AppointmentSummaryReport() {
    }
    
    public AppointmentSummaryReport(String consultantName,String fieldName, int aptCount, String year, String month, String weekDay,String date) {
        this.consultantName=consultantName;
        this.fieldName = fieldName;
        this.aptCount = aptCount;
        this.year = year;
        this.month = month;
        this.weekDay = weekDay;
        this.date=date;
    }

    public String getConsultantName() {
        return consultantName;
    }

    public void setConsultantName(String consultantName) {
        this.consultantName = consultantName;
    }
    
    public String getFieldName() {
        return fieldName;
    }
    
    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }
    
    public int getAptCount() {
        return aptCount;
    }
    
    public void setAptCount(int aptCount) {
        this.aptCount = aptCount;
    }
    
    public String getYear() {
        return year;
    }
    
    public void setYear(String year) {
        this.year = year;
    }
    
    public String getMonth() {
        return month;
    }
    
    public void setMonth(String month) {
        this.month = month;
    }
    
    public String getWeekDay() {
        return weekDay;
    }
    
    public void setWeekDay(String weekDay) {
        this.weekDay = weekDay;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}
