package com.educan.oass.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
@Controller
@RequestMapping("/home")
public class HomeController {
    @RequestMapping(value = {"/consultant", "/consultant/"}, method = RequestMethod.GET)
    public String consultant(ModelMap map) {
        map.put("title", "Consultant");
        return "consultant";
    }
    
    @RequestMapping(value = {"/studyfield", "/studyfield/"}, method = RequestMethod.GET)
    public String studyfield(ModelMap map) {
        map.put("title", "Study Field");
        return "studyfield";
    }
    
    @RequestMapping(value = {"/student", "/student/"}, method = RequestMethod.GET)
    public String student(ModelMap map) {
        map.put("title", "Student");
        return "student";
    }
    
    @RequestMapping(value = {"/consultant/session", "/consultant/session/"}, method = RequestMethod.GET)
    public String availability(ModelMap map) {
        map.put("title", "Consultant Session");
        return "adminConsultantSession";
    }
    
    @RequestMapping(value = {"/appointment", "/appointment/"}, method = RequestMethod.GET)
    public String appointment(ModelMap map){
        map.put("title","Appointment");
        return "adminAppointment";
    }
    
    @RequestMapping(value = {"/report1", "/report1/"}, method = RequestMethod.GET)
    public String report1(ModelMap map){
        map.put("title","Summary Report");
        return "adminReport1";
    }
    
    @RequestMapping(value = {"/report2", "/report2/"}, method = RequestMethod.GET)
    public String report2(ModelMap map){
        map.put("title","Summary Report");
        return "adminReport2";
    }
}
