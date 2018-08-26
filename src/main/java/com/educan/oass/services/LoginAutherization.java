package com.educan.oass.services;

import com.educan.oass.common.ResponseToken;
import com.educan.oass.security.jwt.Algorithm;
import com.educan.oass.security.jwt.AlgorithmException;
import com.educan.oass.security.jwt.Jwt;
import com.educan.oass.security.jwt.ExpUnixTime;
import com.educan.oass.security.jwt.VerifyException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class LoginAutherization {
    private final String KEY; //key => jwt encryption KEY
    private final int EXP_HRS; //exp(hrs) => jwt expiration duration
    private final int EXP_MIN; //exp(min) => jwt expiration duration
    private final Algorithm ALG; //algorithem
    
    private LoginIdentity payload;
    private AuthRequest requestTpe;
    
    private String token;
    
    /**
     * Initialize default constant values
     */
    public LoginAutherization() {
        this("(EduCanIn@6SAT<iA[wQ[<J0o-|-SaYD<x=]r{oEf(5WBeQZ7$d(c(V7N#BUDgxk",6,0,Algorithm.HS512);
    }
    
    /**
     * Constructor for constant Initialization
     *
     * @param KEY for JWT encryption
     * @param EXP_HRS for token expiration in hours
     * @param EXP_MIN for token expiration in minutes
     * @param ALG for token encryption algorithm
     *
     */
    private LoginAutherization(String KEY, int EXP_HRS, int EXP_MIN, Algorithm ALG) {
        this.KEY = KEY;
        this.EXP_HRS = EXP_HRS;
        this.EXP_MIN = EXP_MIN;
        this.ALG = ALG;
    }
    
    /**
     * Constructor to generate new token
     *
     * @param KEY
     * @param EXP_HRS
     * @param EXP_MIN
     * @param ALG
     * @param payload
     *
     */
    public LoginAutherization(String KEY, int EXP_HRS, int EXP_MIN, Algorithm ALG, LoginIdentity payload) {
        this(KEY,EXP_HRS,EXP_MIN,ALG);
        this.payload = payload;
    }
    
    /**
     * Constructor to verify a token
     *
     * @param KEY
     * @param EXP_HRS
     * @param EXP_MIN
     * @param ALG
     * @param token
     *
     */
    public LoginAutherization(String KEY, int EXP_HRS, int EXP_MIN, Algorithm ALG, String token) {
        this(KEY,EXP_HRS,EXP_MIN,ALG);
        this.token = token;
    }
    
    public LoginAutherization(AuthRequest requestTpe, String token, LoginIdentity identity) {
        this(); //call default constructor
        this.requestTpe = requestTpe;
        this.token = token;
        this.payload = identity;
    }
    
    public String getToken() {
        if (this.requestTpe == AuthRequest.GENERATE) {
            return this.token = getNewToken();
        }
        
        return this.token;
    }
    
    /**
     * generate new JWT token for AuthRequest.GENERATE
     *
     * for given payload qith exp -> expiration claim with {EXP_HRS} hours and
     * {EXP_MIN} minutes expiration time
     * @return
     */
    public String getNewToken() {
        try {
            HashMap<String, Object> payload=new HashMap<>();
            long exp = new ExpUnixTime(EXP_HRS, EXP_MIN).getUnixTime();
            
            payload.put("username", this.payload.getUsername());
            payload.put("firstName", this.payload.getFirstName());
            payload.put("lastName", this.payload.getLastName());
            payload.put("role", this.payload.getRole());
            payload.put("exp", exp);    // exp claim => add expiration time to payload
            
            return Jwt.encode(payload, KEY, ALG);
            
        } catch (IllegalArgumentException | NoSuchAlgorithmException | UnsupportedEncodingException | InvalidKeyException ex) {
            Logger.getLogger(EmailConfirmation.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    /**
     * Decode a JWT claim with signature verification
     * @return user identity from token
     */
    public LoginIdentity identity() {
        try {
            Map<String, Object> decoded = Jwt.decode(this.token, this.KEY, true);
            return new LoginIdentity(0,
                    (String) decoded.get("username"),
                    (String) decoded.get("firstName"),
                    (String) decoded.get("lastName"),null);
        } catch (IllegalStateException | VerifyException | IllegalArgumentException | NoSuchAlgorithmException | UnsupportedEncodingException | InvalidKeyException | AlgorithmException ex) {
            Logger.getLogger(LoginAutherization.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    /**
     * verify incoming Request Autherization cookie token
     *
     * capture from @CookieValue("Authorization") attribute on controller
     * passing to this.token for verification
     * @return ResponseToken
     */
    public ResponseToken verify() {
        
        ResponseToken result = new ResponseToken();
        try {
            // Decode a JWT with signature verification
            Map<String, Object> decoded = Jwt.decode(this.token, this.KEY, true);
            
            // Map<String, Object> decoded = Jwt.decode(token, KEY, true);
            long exptime = ((Number) decoded.get("exp")).longValue();   //get email verification token (jwt) expiration time
            long currenttime = new ExpUnixTime(0, 0).getUnixTime();
            
            if (exptime < currenttime) {    //if token expired
                result.setCode(0);
                result.setMessage("Sorry, your session has expired. Please try signin again to continue.");
                return result;
            }
            
            result.setCode(1);
            result.setMessage("Token is verified.");
            return result;
            
        } catch (VerifyException | IllegalArgumentException | NoSuchAlgorithmException | UnsupportedEncodingException | InvalidKeyException | AlgorithmException ex) {
            Logger.getLogger(EmailConfirmation.class
                    .getName()).log(Level.SEVERE, null, ex);
            
            result.setCode(-1);
            result.setMessage("Sorry, there was an error occured while verifying session. Please try again later.");
            return result;
        }
    }
    
    /**
     * generate & assign new token in "Authorization" Cookie for incoming
     * authenticated users HttpServletResponse with cookie expiration same as
     * the jwt expiration time
     * @param response HttpServletResponse
     * @param request HttpServletRequest
     * @return HttpServletResponse
     */
    public HttpServletResponse generate(HttpServletResponse response, HttpServletRequest request) {
        Cookie authCookie = new Cookie("Authorization", this.getToken());
        authCookie.setPath(request.getContextPath());
        authCookie.setMaxAge((EXP_HRS * 60 * 60) + (EXP_MIN * 60));
        response.addCookie(authCookie);
        
        return response;
    }
    
    /**
     * Destroy Autherization cookies on Logout
     * @param response HttpServletResponse
     * @param request HttpServletRequest
     * @return HttpServletResponse 
     */
    public HttpServletResponse destroy(HttpServletResponse response, HttpServletRequest request){
        Cookie authCookie = new Cookie("Authorization", null);
        authCookie.setPath(request.getContextPath());
        authCookie.setMaxAge(0);
        response.addCookie(authCookie);
        
        return response;
    }
}
