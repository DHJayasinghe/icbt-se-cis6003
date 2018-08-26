package com.educan.oass.services;

import com.educan.oass.models.AppointmentSummary;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class MailTemplate {
    private static MailTemplate template;
    private static String rooturl;
    //prevents the instantiation
    private MailTemplate(){
        rooturl="http://localhost:8084/educan.oas";
    }
    
    //global point of access
    public static MailTemplate getInstance(){
        if(template==null)
            template=new MailTemplate();
        return template;
    }
    
    public Email templateApptCreate(AppointmentSummary apt){
        String body="";
        body +="<h4>Hello "+apt.getStudentName()+",</h4><br><br>";
        body +="<h4>Your appointment with "+ apt.getConsultantName()+ " on " + apt.getAppointmentDate() + " at " + apt.getAppointmentTime() +" is confirmed.</h4>";
        body+="";
        
        Email email=new Email();
        email.setSubject("Appointment confirmation.");
        email.setReceiver(apt.getStudentEmail());
        email.setBody(body);
       // body +="<h3>"+ apt.get()+", " + apt.getScheduledTimeFrom() +"</h3>";
        
        return email;
    }
}
