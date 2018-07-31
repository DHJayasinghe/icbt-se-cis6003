package com.educan.oass.controllers;

import com.educan.oass.common.ResponseToken;
import com.educan.oass.dao.ConsultSessionDAO;
import com.educan.oass.models.ConsultSession;
import com.educan.oass.models.ConsultSessionDetails;
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
@RequestMapping("/admin/consultant/session")
public class ConsultSessionController {
    ConsultSessionDAO conSessionDB;
    LoginIdentity identity;
    
    public ConsultSessionController() {
        conSessionDB=new ConsultSessionDAO();
        
        identity=new LoginIdentity(1, "hasitha2kandy@gmail.com", "admin", "", "admin"); //hard coded admin login details (temporary)
    }
    
    @RequestMapping(value="/add", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken add(@RequestBody ConsultSession model){
        return conSessionDB.add(model, identity);
    }
    
    @RequestMapping(value="/delete", method=RequestMethod.POST, produces = "application/json")
    public @ResponseBody ResponseToken delete(@RequestBody ConsultSession model){
        ResponseToken result= conSessionDB.delete(model, identity);
        if(result.getCode()==1){ //if success
            //send cancellation notify email to all students associated with this consultant session
        }
        return result;
    }
    
    @RequestMapping(value="/details/{id}", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody ConsultSessionDetails details(@PathVariable String id){
        return conSessionDB.details(id);
    }
    
    @RequestMapping(value="/summary", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<ConsultSessionDetails> summary(){
        return conSessionDB.findAll();
    }
}
