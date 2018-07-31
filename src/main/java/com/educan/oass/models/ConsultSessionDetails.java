package com.educan.oass.models;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class ConsultSessionDetails {
    private int sessionId;
    private int consultantId;
    private String consultantName;
    private String sessionDate;
    private String sessionWeekDay;
    private String sessionTimeFrom;
    private String sessionTimeTo;
    private String sessionDuration;
    private String room;
    
    private String createdDate;
    private String recRemarks;
    private String recStatus;

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

    public String getSessionTimeFrom() {
        return sessionTimeFrom;
    }

    public void setSessionTimeFrom(String sessionTimeFrom) {
        this.sessionTimeFrom = sessionTimeFrom;
    }

    public String getSessionTimeTo() {
        return sessionTimeTo;
    }

    public void setSessionTimeTo(String sessionTimeTo) {
        this.sessionTimeTo = sessionTimeTo;
    }

    public String getSessionDuration() {
        return sessionDuration;
    }

    public void setSessionDuration(String sessionDuration) {
        this.sessionDuration = sessionDuration;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getRecRemarks() {
        return recRemarks;
    }

    public void setRecRemarks(String recRemarks) {
        this.recRemarks = recRemarks;
    }

    public String getRecStatus() {
        return recStatus;
    }

    public void setRecStatus(String recStatus) {
        this.recStatus = recStatus;
    }
    
    
}
