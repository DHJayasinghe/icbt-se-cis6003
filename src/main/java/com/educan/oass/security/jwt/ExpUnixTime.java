package com.educan.oass.security.jwt;

import java.time.Instant;
import java.time.temporal.ChronoUnit;

//Set and Get unixtime for JWT exp claim
public class ExpUnixTime {

    private long unixTime;
    private final int hours;
    private final int minutes;

    public ExpUnixTime(int hours, int minutes) {
        this.hours = hours;
        this.minutes = minutes;
    }

    public long getUnixTime() {
        //Add token expiration in hours & minutes
        this.unixTime= Instant.now().plus(this.hours, ChronoUnit.HOURS).plus(this.minutes, ChronoUnit.MINUTES).getEpochSecond();
        return unixTime;
    }

}
