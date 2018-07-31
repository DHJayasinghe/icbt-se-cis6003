package com.educan.oass.models;

import java.sql.Date;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class ConsultSession {
    private int sessionId;
    private int consultantId;
    private Date sessionDate;
    private String sessionTimeFrom;
    private String sessionTimeTo;
    private int sessionDuration;
    private String room;
    private String recRemarks;
    
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

    public Date getSessionDate() {
        return sessionDate;
    }

    public void setSessionDate(Date sessionDate) {
        this.sessionDate = sessionDate;
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

    public int getSessionDuration() {
        return sessionDuration;
    }

    public void setSessionDuration(int sessionDuration) {
        this.sessionDuration = sessionDuration;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getRecRemarks() {
        return recRemarks;
    }

    public void setRecRemarks(String recRemarks) {
        this.recRemarks = recRemarks;
    }
    
    
}
