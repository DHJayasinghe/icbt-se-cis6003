package com.educan.oass.db.connection.factory;

import com.educan.oass.db.connection.DbConnection;

public interface ConnectionFactory {
    DbConnection getConnection();
}
