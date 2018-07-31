package com.educan.oass.db.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class MsSqlConnection implements DbConnection {
    
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    static final String DB_URL = "jdbc:sqlserver://DESKTOP-OVL1JFQ;databaseName=OAS_EduCanDB;";
    
    //Database credentials (tempory save on const variable)
    static final String USER = "sa";
    static final String PASS = "Dhanu4864";
    
    @Override
    public Connection connect() {
        Connection conn = null;
        try {
            //Register JDBC driver
            Class.forName(JDBC_DRIVER);
            
            //Open a connection
            //System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            return conn;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }
}
