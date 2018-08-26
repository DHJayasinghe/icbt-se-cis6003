
package com.educan.oass.models;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class AppointmentSummaryReport {
    private String fieldName;
    private int aptCount;
    private String year;
    private String month;
    private String weekDay;

    public AppointmentSummaryReport() {
    }

    public AppointmentSummaryReport(String fieldName, int aptCount, String year, String month, String weekDay) {
        this.fieldName = fieldName;
        this.aptCount = aptCount;
        this.year = year;
        this.month = month;
        this.weekDay = weekDay;
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
    
}
