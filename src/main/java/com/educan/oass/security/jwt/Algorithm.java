package com.educan.oass.security.jwt;

public enum Algorithm {
    HS256("HmacSHA256"),
    HS384("HmacSHA384"),
    HS512("HmacSHA512");

    private Algorithm(String value) {
        this.value = value;
    }

    private final String value;

    public String getValue() {
        return value;
    }
}
