package com.educan.oass.db.connection.factory;

import com.educan.oass.db.connection.MsSqlConnection;
import com.educan.oass.db.connection.DbConnection;

public class MsSqlConnectionFactory implements ConnectionFactory{

    @Override
    public DbConnection getConnection() {
        return new MsSqlConnection();
    }
}
