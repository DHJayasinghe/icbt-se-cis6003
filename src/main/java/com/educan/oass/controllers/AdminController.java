package com.educan.oass.controllers;

import com.educan.oass.dao.CountryDAO;
import com.educan.oass.dao.StudentDAO;

import com.educan.oass.models.Country;
import com.educan.oass.models.SignIn;
import com.educan.oass.models.SignUp;
import com.educan.oass.models.Student;
import com.educan.oass.models.StudentDetails;
import com.educan.oass.services.AuthRequest;
import com.educan.oass.services.LoginAutherization;
import com.educan.oass.services.LoginIdentity;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    CountryDAO countryDB;
    StudentDAO studentDB;
    
    public AdminController() {
        countryDB=new CountryDAO();
        studentDB=new StudentDAO();
    }
    
    @RequestMapping(value = {"/signin", "/signin/"}, method = RequestMethod.GET)
    public String login(ModelMap map){
        map.put("title","Sign In");
        return "adminLogin";
    }
    
    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    public String signin(SignIn model, ModelMap map, HttpServletResponse response,HttpServletRequest request) {
        
        try {
            SignUp signup=new SignUp("", "administrator", "", "admin@educan.lk", "Admin@#123"); //hard coded admin login (temporary)
            
            int result=model.getUsername().equals(signup.getUsername())?1:0;
            if(result==1){
                //get & set hash password for comparison
                model.setHashed(signup.getPassword());
                if (model.getLoginAttempt()) {   //success login attempt
                    LoginIdentity payload=new LoginIdentity(1, signup.getUsername(), signup.getFirstName(), "", "admin"); //hard coded admin login details
                    
                    response = new LoginAutherization(AuthRequest.GENERATE, null,payload).generate(response,request);
                    
                    return "redirect:/home/consultant/session";
                } else {    //failure attempt
                    map.put("responseMsg", "You have entered incorrect username or password. Please try again.");
                    return "signin";
                }
            } else{
                //username not found
                map.put("responseMsg", "Sorry, No admin profile found under this email address..");
                return "adminLogin";
            }
        } catch (Exception ex) {
            map.put("responseMsg", "Sorry, there was an error occured while signin to your account. Please try again later.");
            return "adminLogin";
        }
    }
    
    @RequestMapping(value="/country/list", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<Country> countryList(){
        return countryDB.list();
    }
    
    /**
     * Student Summary Details
     * @return List<StudentDetails>
     */
    @RequestMapping(value="/student/summary", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<StudentDetails> studentSummary(){
        return studentDB.findAll();
    }
    
    /**
     * Student Details
     * @param id Student Id
     * @return Student
     */
    @RequestMapping(value="/student/details/{id}/", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody Student studentDetails(@PathVariable String id){
        return studentDB.details(id);
    }
    
}
