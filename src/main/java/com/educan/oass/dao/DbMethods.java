package com.educan.oass.dao;

import com.educan.oass.services.LoginIdentity;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public interface DbMethods{
    Object add(Object model,LoginIdentity identity);
    Object update(Object model,LoginIdentity identity);
    Object delete(Object model,LoginIdentity identity);
    Object details(String id);
    Object findAll();
}
