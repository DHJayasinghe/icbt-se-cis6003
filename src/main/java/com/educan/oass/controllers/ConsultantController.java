package com.educan.oass.controllers;

import com.educan.oass.common.ResponseToken;

import com.educan.oass.dao.ConsultCountryDAO;
import com.educan.oass.dao.ConsultantDAO;
import com.educan.oass.dao.ConsultFieldDAO;

import com.educan.oass.models.Consultant;
import com.educan.oass.models.ConsultantDetails;
import com.educan.oass.models.ConsultantProfile;
import com.educan.oass.models.Speciality;

import com.educan.oass.services.LoginIdentity;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */

@RestController
@RequestMapping("/admin/consultant")
public class ConsultantController {
    
    ConsultantDAO consultDB;
    ConsultFieldDAO consultFieldDB;
    ConsultCountryDAO consultCntryDB;
    
    LoginIdentity identity;
    
    public ConsultantController() {
        consultDB=new ConsultantDAO();
        consultFieldDB=new ConsultFieldDAO();
        consultCntryDB=new ConsultCountryDAO();
        
        identity=new LoginIdentity(1, "hasitha2kandy@gmail.com", "admin", "", "admin"); //hard coded admin login details (temporary)
    }
    
    //@RequestBody, Spring will maps the POST data to Consultant POJO (by name) automatically.
    @RequestMapping(value="/register", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken add(@RequestBody Consultant model){
        try {
            //execute consultant add command
            return consultDB.add(model, identity);
        } catch (Exception ex) {
            return new ResponseToken(-1, ex.getMessage());
        }
    }
    
    @RequestMapping(value="/update", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken update(@RequestBody Consultant model){
        try {
            //execute consultant update command
            return consultDB.update(model, identity);
        } catch (Exception ex) {
            return new ResponseToken(-1, ex.getMessage());
        }
    }
    
    @RequestMapping(value="/delete", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken delete(@RequestBody Consultant model){
        try {
            //execute consultant delete command
            return consultDB.delete(model, identity);
        } catch (Exception ex) {
            return new ResponseToken(-1, ex.getMessage());
        }
    }
    
    @RequestMapping(value="/details/{id}", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody Consultant details(@PathVariable String id){
        return consultDB.details(id);
    }
    
    @RequestMapping(value="/summary", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<ConsultantDetails> summary(){
        return consultDB.findAll();
    }
    
    @RequestMapping(value="/list", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<Consultant> list(){
        return consultDB.list();
    }
    
    @RequestMapping(value="/speciality/details/{id}", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody Speciality speciality(@PathVariable String id){
        Speciality result=new Speciality();
        result.setConsultantId(Integer.parseInt(id));
        result.setFieldName(consultFieldDB.details(id).getFieldName());
        result.setCountryName(consultCntryDB.details(id).getCountryName());
        return result;
    }
    
    /**
     * Update Consultant Specialized Area
     * @param model consultant specialized field & country
     * @return
     */
    @RequestMapping(value="/speciality/update", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken updateSpeciality(@RequestBody Speciality model){
        ResponseToken result=consultCntryDB.update(model, identity);
        if(result.getCode()==1)
            result=consultFieldDB.update(model, identity);
        return result;
    }
    
    /**
     * Get Consultant Public Profile
     * @param id Consultant Id
     * @return ConsultantProfile
     */
    @RequestMapping(value="/profile/{id}", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody ConsultantProfile profile(@PathVariable String id){
        return consultDB.profile(id);
    }
}
