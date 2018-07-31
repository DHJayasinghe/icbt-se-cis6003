package com.educan.oass.controllers;

import com.educan.oass.common.ResponseToken;
import com.educan.oass.dao.FieldDAO;
import com.educan.oass.models.Field;
import com.educan.oass.models.FieldDetails;
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
@RequestMapping("/admin/studyfield")
public class FieldController {
    FieldDAO fieldDB;
    LoginIdentity identity;
    ResponseToken response;
    
    public FieldController() {
        fieldDB=new FieldDAO();
        identity=new LoginIdentity(1, "hasitha2kandy@gmail.com", "admin", "", "admin"); //hard coded admin login details (temporary)
    }
    
    //@RequestBody, Spring will maps the POST data to Consultant POJO (by name) automatically.
    @RequestMapping(value="/register", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken add(@RequestBody Field model){
        //execute field add command
        return fieldDB.add(model, identity);
    }
    
    @RequestMapping(value="/update", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken update(@RequestBody Field model){
        //execute field update command
        return fieldDB.update(model, identity);
    }
    
    @RequestMapping(value="/delete", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken delete(@RequestBody Field model){
        //execute field delete command
        return fieldDB.delete(model, identity);
    }
    
    @RequestMapping(value="/details/{id}", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody Field details(@PathVariable String id){
        return fieldDB.details(id);
    }
    
    @RequestMapping(value="/summary", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<FieldDetails> summary(){
        return fieldDB.findAll();
    }
    
    @RequestMapping(value="/list", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<Field> list(){
        return fieldDB.list();
    }
}
