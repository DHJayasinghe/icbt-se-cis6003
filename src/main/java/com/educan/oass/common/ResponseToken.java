package com.educan.oass.common;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class ResponseToken {
    private int code;
    private String message;

    public ResponseToken() {
    }

    public ResponseToken(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
}
