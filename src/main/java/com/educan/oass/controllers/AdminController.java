package com.educan.oass.controllers;

import com.educan.oass.common.ResponseToken;

import com.educan.oass.dao.CountryDAO;
import com.educan.oass.dao.StudentDAO;

import com.educan.oass.models.Country;
import com.educan.oass.models.Student;
import com.educan.oass.models.StudentDetails;


import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
@RestController
@RequestMapping("/admin")
public class AdminController {
    CountryDAO countryDB;
    StudentDAO studentDB;
    
    public AdminController() {
        countryDB=new CountryDAO();
        studentDB=new StudentDAO();
    }
    
    @RequestMapping(value="/get", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody ResponseToken get(){
        return new ResponseToken(1,"Hello World.");
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
