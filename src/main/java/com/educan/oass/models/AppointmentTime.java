
package com.educan.oass.models;

import java.sql.Date;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class AppointmentTime {
    private int sessionId;
    private int consultantId;
    private String consultantName;
    
    private Date scheduledDate; //value attribute
    private String sessionDate; //display text attribute
    private String sessionWeekDay;
    
    private String scheduledTimeFrom; //value attribute
    private String sessionTimeFrom;  //display text attribute
    
    private String scheduledTimeTo; //value attribute
    private String sessionTimeTo; //display text attribute
    
    private String room;
    private String available; //availability

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

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

    public Date getScheduledDate() {
        return scheduledDate;
    }

    public void setScheduledDate(Date scheduledDate) {
        this.scheduledDate = scheduledDate;
    }

    public String getSessionDate() {
        return sessionDate;
    }

    public void setSessionDate(String sessionDate) {
        this.sessionDate = sessionDate;
    }

    public String getSessionWeekDay() {
        return sessionWeekDay;
    }

    public void setSessionWeekDay(String sessionWeekDay) {
        this.sessionWeekDay = sessionWeekDay;
    }

    public String getScheduledTimeFrom() {
        return scheduledTimeFrom;
    }

    public void setScheduledTimeFrom(String scheduledTimeFrom) {
        this.scheduledTimeFrom = scheduledTimeFrom;
    }

    public String getSessionTimeFrom() {
        return sessionTimeFrom;
    }

    public void setSessionTimeFrom(String sessionTimeFrom) {
        this.sessionTimeFrom = sessionTimeFrom;
    }

    public String getScheduledTimeTo() {
        return scheduledTimeTo;
    }

    public void setScheduledTimeTo(String scheduledTimeTo) {
        this.scheduledTimeTo = scheduledTimeTo;
    }

    public String getSessionTimeTo() {
        return sessionTimeTo;
    }

    public void setSessionTimeTo(String sessionTimeTo) {
        this.sessionTimeTo = sessionTimeTo;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }
    
    
}
