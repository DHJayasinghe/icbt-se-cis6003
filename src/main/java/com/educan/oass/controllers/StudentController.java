package com.educan.oass.controllers;

import com.educan.oass.common.ResponseToken;

import com.educan.oass.dao.StudentDAO;

import com.educan.oass.models.SignIn;
import com.educan.oass.models.SignUp;
import com.educan.oass.models.Student;

import com.educan.oass.services.AuthRequest;
import com.educan.oass.services.EmailConfirmation;
import com.educan.oass.services.LoginAutherization;
import com.educan.oass.services.LoginIdentity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    LoginAutherization logAuth;
    LoginIdentity identity;
    
    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(ModelMap map) {
        map.put("title", "Register");
        return "register";
    }
    
    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String signin(ModelMap map) {
        map.put("title", "Sign In");
        
        return "signin";
    }
    
    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    public String signin(SignIn model, ModelMap map, HttpServletResponse response,HttpServletRequest request) {
        StudentDAO studentDB = new StudentDAO();
        int result = studentDB.isAccAlreadyExist(model.getUsername());
        
        if (result == 1) { //username available
            try {
                //get & set hash password(of model.getUsername()) from db for comparison
                model.setHashed(studentDB.getPasswordHash(model.getUsername()));
                
                if (model.getLoginAttempt()) {   //success login attempt
                    Student student = studentDB.details(model.getUsername());
                    LoginIdentity payload=new LoginIdentity(0,student.getEmail(),student.getFirstName(),student.getLastName(),null);
                    
                    response = new LoginAutherization(AuthRequest.GENERATE, null,payload).generate(response,request);
                    
                    return "redirect:/student/profile";
                } else {    //failure attempt
                    map.put("responseMsg", "You have entered incorrect username or password. Please try again.");
                    return "signin";
                }
            } catch (Exception ex) {
                map.put("responseMsg", "Sorry, there was an error occured while signin to your account. Please try again later.");
                return "signin";
            }
        } else if (result == 0) {
            //username not found
            map.put("responseMsg", "Sorry, No student profile found under this email address..");
            return "signin";
        }
        //error occured while signup new membership
        map.put("responseMsg", "Sorry, there was an error occured while signin to your account. Please try again later.");
        return "signin";
    }
    
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup(ModelMap map) {
        map.put("title", "Sign Up");
        
        return "signup";
    }
    
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signup(SignUp model, ModelMap map) {
        map.put("title", "Sign Up");
        
        int result = new StudentDAO().isAccAlreadyExist(model.getUsername());
        
        if (result == 0) {
            //username available
            try {
                LoginIdentity payload=new LoginIdentity(0, model.getUsername(), model.getFirstName(), model.getLastName(), null);
                new EmailConfirmation(AuthRequest.GENERATE, model.getUsername(), null,payload).generate(); //send confirmation email
                
                return "emailconfirm";
            } catch (Exception ex) {
                map.put("responseMsg", "Sorry, there was an error occured while sending confirmation email. Please try again later.");
                return "signup";
            }
        } else if (result == 1) {
            //username already taken
            map.put("responseMsg", "Sorry, This email address has been already taken.");
            return "signup";
        }
        
        //error occured while model new membership
        map.put("responseMsg", "Sorry, there was an error occured while signup for new membership. Please try again later.");
        return "signup";
    }
    
    @RequestMapping(value = "/signup/confirm/{token}/", method = RequestMethod.GET)
    public String confirmEmail(@PathVariable String token, ModelMap map) {
        map.put("title", "Sign Up");
        
        try {
            //pass confirmation email {token} from url parameter for verification
            ResponseToken result = new EmailConfirmation(AuthRequest.VERIFY, null, token, null).verify();
            
            if (result.getCode() == 1) {    //email verification token success
                map.put("verificationtoken", token); //set email verification token inside form
                return "signupcomplete";
            } else {  //email confirmation token fail
                map.put("responseMsg", result.getMessage());
                return "signup";
            }
        } catch (Exception e) {
            return "error";
        }
    }
    
    @RequestMapping(value = "/signup/complete", method = RequestMethod.POST)
    public String signupComplete(SignUp model, ModelMap map, HttpServletResponse response, HttpServletRequest request) {
        map.put("title", "Sign Up");
        
        try {
            EmailConfirmation confirmation = new EmailConfirmation(AuthRequest.VERIFY, null, model.getToken(), null);
            ResponseToken result = confirmation.verify();
            
            if (result.getCode() == 1) {    //email verification token success
                identity= confirmation.identity();
                model.setUsername(identity.getUsername());
                model.setFirstName(identity.getFirstName());
                model.setLastName(identity.getLastName());
                
                StudentDAO student = new StudentDAO();
                result = student.add(model,null);    //complete model process
                
                if (result.getCode() == 1){
                    response = new LoginAutherization(AuthRequest.GENERATE, null,identity).generate(response,request);
                    return "redirect:/student/profile";
                }
                else if(result.getCode()==0)
                    map.put("responseMsg", result.getMessage());
                else
                    map.put("responseMsg", "Sorry, there was an error occured while completing the signup process. Please try again later.");
                
                return "signup";
            } else {  //email confirmation token fail
                map.put("responseMsg", result.getMessage());
                return "signup";
            }
        } catch (Exception e) {
            return "error";
        }
    }
    
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String viewProfile(@CookieValue("Authorization") String token, ModelMap map) {
        map.put("title", "Profile");
        //pass Authorization cookie token from request for verification
        logAuth = new LoginAutherization(AuthRequest.VERIFY,token, null);
        ResponseToken result = logAuth.verify();
        
        //if Autherization token is not valid | not exist => redirect to signin page
        if (result.getCode() == 1) {
            identity = logAuth.identity(); //student identity
            Student student = new StudentDAO().details(identity.getUsername());
            
            map.put("student", student);
            map.put("identity",identity);
            
            return "profile";
        } else {
            map.put("responseMsg", result.getMessage());
            return "redirect:/student/signin";
        }
    }
    
    @RequestMapping(value = "/profile/update", method = RequestMethod.POST)
    public String updateProfile(@CookieValue("Authorization") String token, Student model, ModelMap map) {
        map.put("title", "Profile");
        //pass Authorization cookie token from request for verification
        logAuth = new LoginAutherization(AuthRequest.VERIFY,token, null);
        ResponseToken result = logAuth.verify();
        
        //if Autherization token is not valid or not exist redirect to signin page
        if (result.getCode() == 1) {
            identity = logAuth.identity(); //student identity
            
            model.setEmail(identity.getUsername());   //set model email with payload username before submit data to db
            result = new StudentDAO().update(model,identity);
            
            map.put("identity",identity);
            map.put("response", result);
            
            return "profile";
        } else {
            map.put("responseMsg", result.getMessage());
            return "redirect:/student/signin";
        }
    }
    
    @RequestMapping(value = "/signout", method = RequestMethod.POST)
    public String signout(HttpServletRequest request,HttpServletResponse response){
        response=new LoginAutherization().destroy(response, request);
        return "redirect:/student/signin";
    }
    
    @RequestMapping(value = "/appointment/create", method = RequestMethod.GET)
    public String appointmentCreate(@CookieValue("Authorization") String token, ModelMap map) {
        map.put("title", "Appointment");
        
        logAuth = new LoginAutherization(AuthRequest.VERIFY,token, null);
        ResponseToken result = logAuth.verify();
        
        //if Autherization token is not valid | not exist => redirect to signin page
        if (result.getCode() == 1) {
            identity = logAuth.identity(); //student identity
            
            map.put("identity",identity);
            return "makeAppointment";
        } else {
            map.put("responseMsg", result.getMessage());
            return "redirect:/student/signin";
        }
    }
    
    @RequestMapping(value = "/appointment/cancel", method = RequestMethod.GET)
    public String appointmentCancel(@CookieValue("Authorization") String token, ModelMap map) {
        map.put("title", "Appointment");
        
        logAuth = new LoginAutherization(AuthRequest.VERIFY,token, null);
        ResponseToken result = logAuth.verify();
        
        //if Autherization token is not valid | not exist => redirect to signin page
        if (result.getCode() == 1) {
            identity = logAuth.identity(); //student identity
            
            map.put("identity",identity);
            return "cancelAppointment";
        } else {
            map.put("responseMsg", result.getMessage());
            return "redirect:/student/signin";
        }
    }
}
