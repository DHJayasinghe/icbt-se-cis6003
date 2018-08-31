package com.educan.oass.controllers;

import com.educan.oass.common.ResponseToken;

import com.educan.oass.dao.AppointmentDAO;

import com.educan.oass.models.Appointment;
import com.educan.oass.models.AppointmentSummary;
import com.educan.oass.models.AppointmentTime;

import com.educan.oass.services.AuthRequest;
import com.educan.oass.services.Email;
import com.educan.oass.services.GmailSmtp;
import com.educan.oass.services.LoginAutherization;
import com.educan.oass.services.LoginIdentity;
import com.educan.oass.services.MailTemplate;

import java.util.List;

import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
@EnableWebMvc
@RestController
public class AppointmentController {
    LoginAutherization logAuth;
    LoginIdentity identity;
    
    AppointmentDAO appntmntDB;
    
    public AppointmentController() {
        appntmntDB=new AppointmentDAO();
    }
    
    @RequestMapping(value="/student/appointment/timetable/{consultantId}/{appointmntDate}", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<AppointmentTime> timetable(@CookieValue("Authorization") String token,@PathVariable int consultantId,@PathVariable String appointmntDate){
        logAuth = new LoginAutherization(AuthRequest.VERIFY,token, null);
        
        if (logAuth.verify().getCode() == 1) {
            return appntmntDB.timeTable(consultantId, appointmntDate);
        }else{
            return null;
        }
    }
    
    @RequestMapping(value="/student/appointment/create", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken create(@CookieValue("Authorization") String token,@RequestBody Appointment model){
        logAuth = new LoginAutherization(AuthRequest.VERIFY,token, null);
        
        if (logAuth.verify().getCode() == 1) {
            ResponseToken result=appntmntDB.add(model, logAuth.identity());
            model=(Appointment)result.getData();
            result.setData(null); //empty response data parameter
            
            if(result.getCode()==1){
                Email email= MailTemplate.getInstance().templateApptCreate(
                        appntmntDB.details(Integer.toString(model.getAppointmentId())));
                boolean issend=new GmailSmtp(email.getReceiver(), email.getSubject(), email.getBody()).SendEmail();
            }
            return result;
        }else{
            return null;
        }
    }
    
    @RequestMapping(value="/student/appointment/cancel", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken cancel(@CookieValue("Authorization") String token,@RequestBody Appointment model){
        logAuth = new LoginAutherization(AuthRequest.VERIFY,token, null);
        
        if (logAuth.verify().getCode() == 1) {
            return appntmntDB.delete(model, logAuth.identity());
        }else{
            return null;
        }
    }
    
    @RequestMapping(value = "/student/appointment/summary", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<AppointmentSummary> summaryStudent(@CookieValue("Authorization") String token) {
        logAuth = new LoginAutherization(AuthRequest.VERIFY,token, null);
        
        if (logAuth.verify().getCode() == 1) {
            return appntmntDB.summary(logAuth.identity().getUsername(), "student");
        }else{
            return null;
        }
    }
    
    
    @RequestMapping(value = "/admin/appointment/summary", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<AppointmentSummary> summaryAdmin() {
        List<AppointmentSummary> list =appntmntDB.summary(null, "admin");
        
        return list;
    }
    
    @RequestMapping(value="/admin/appointment/attended", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken markAttend(@CookieValue("Authorization") String token,@RequestBody Appointment model){
        logAuth = new LoginAutherization(AuthRequest.VERIFY,token, null);
        
        if (logAuth.verify().getCode() == 1) {
            return appntmntDB.update(model, logAuth.identity());
        }else{
            return null;
        }
    }
}
