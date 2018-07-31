package com.educan.oass.db.connection;

import java.sql.Connection;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class MySqlConnection implements DbConnection {
// JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/";
    
    //  Database credentials
    static final String USER = "username";
    static final String PASS = "password";
    
    @Override
    public Connection connect() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
