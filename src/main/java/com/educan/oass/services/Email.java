package com.educan.oass.services;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class Email {
    private String receiver;
    private String subject;
    private String body;

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
    
}
