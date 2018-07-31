package com.educan.oass.services;

import com.educan.oass.common.ResponseToken;

import com.educan.oass.security.jwt.Algorithm;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class EmailConfirmation{
    private final String KEY ; //encryption KEY for email confirmation
    private final int EXP_HRS; //(hours) => expiration for email confirmation token
    private final int EXP_MIN; //(minutes) => expiration for email confirmation token
    private final Algorithm ALG; //algorithem
    
    private LoginIdentity payload;
    private AuthRequest requestTpe;
    
    private String subject;
    private String body;
    private String to;
    private String token;   //email token
    
    private EmailConfirmation() {
        this.KEY= "EmailConfirm@p6SAT<iA[wQ[<J0o-|-SaYD<x=]r{oEf(5WBeQZ7$d(c(V7N#BUDgxk";
        this.EXP_HRS = 2;
        this.EXP_MIN = 0;
        this.ALG = Algorithm.HS256;
        
        this.subject = "Confirm your email";
    }
    
    public EmailConfirmation(AuthRequest requestTpe, String to, String token, LoginIdentity payload) {
        this(); //call default constructor
        this.requestTpe = requestTpe;
        this.to = to;
        this.token = token;
        this.payload = payload;
    }
    
    public void setToken(String token) {
        this.token = token;
    }
    
    private String getToken() {
        if (this.requestTpe == AuthRequest.GENERATE)
            return this.token = new LoginAutherization(KEY, EXP_HRS, EXP_MIN, ALG, payload).getNewToken();
        
        return this.token;
    }

    public Object generate() {
        this.setToken(getToken());
        body = "<h3>Thanks for Registering with EduCan.lk. Please confirm your email, so we know it's really you.</h3><br/><a href='http://localhost:8084/educan.oas/student/signup/confirm/" + token + "/'>Confirm Email</a>";
        GmailSmtp mail = new GmailSmtp(to, subject, body);
        boolean success = mail.SendEmail();
        
        return success;
    }
    
    public ResponseToken verify() {
        ResponseToken result=new LoginAutherization(KEY, EXP_HRS, EXP_MIN, ALG,token ).verify();
        
        if(result.getCode()==0) //if token expired
            result.setMessage("Sorry, your email confirmation token expired. Please try again later.");
        else if(result.getCode()==1)
            result.setMessage("Success, email token is verified.");
        return result;
    }
    
    public LoginIdentity identity() {
        return new LoginAutherization(KEY, EXP_HRS, EXP_MIN, ALG,token ).identity();
    }
}
