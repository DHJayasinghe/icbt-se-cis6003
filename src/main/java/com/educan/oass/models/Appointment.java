package com.educan.oass.models;

import java.sql.Date;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class Appointment {
    private int appointmentId;
    private int fieldId; //study field id
    private int sessionId; //consultant session id
    private Date scheduledDate;
    private String scheduledTimeFrom;
    private String scheduledTimeTo;

    public Appointment() {
    }

    public Appointment(int appointmentId, int fieldId, int sessionId, Date scheduledDate, String scheduledTimeFrom, String scheduledTimeTo) {
        this.appointmentId = appointmentId;
        this.fieldId = fieldId;
        this.sessionId = sessionId;
        this.scheduledDate = scheduledDate;
        this.scheduledTimeFrom = scheduledTimeFrom;
        this.scheduledTimeTo = scheduledTimeTo;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public int getFieldId() {
        return fieldId;
    }

    public void setFieldId(int fieldId) {
        this.fieldId = fieldId;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public Date getScheduledDate() {
        return scheduledDate;
    }

    public void setScheduledDate(Date scheduledDate) {
        this.scheduledDate = scheduledDate;
    }

    public String getScheduledTimeFrom() {
        return scheduledTimeFrom;
    }

    public void setScheduledTimeFrom(String scheduledTimeFrom) {
        this.scheduledTimeFrom = scheduledTimeFrom;
    }

    public String getScheduledTimeTo() {
        return scheduledTimeTo;
    }

    public void setScheduledTimeTo(String scheduledTimeTo) {
        this.scheduledTimeTo = scheduledTimeTo;
    }
    
}
