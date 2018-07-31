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
public class DefaultController {
    
    @RequestMapping(value = {"","/"}, method = RequestMethod.GET)
    public String index(ModelMap map) {
        return "redirect:/student/signin";
    }
}
