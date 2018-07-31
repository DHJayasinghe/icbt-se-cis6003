package com.educan.oass.db.connection.factory;

import com.educan.oass.db.connection.MySqlConnection;
import com.educan.oass.db.connection.DbConnection;

public class MySqlConnectionFactory implements ConnectionFactory{

    @Override
    public DbConnection getConnection() {
        return new MySqlConnection();
    }
}
