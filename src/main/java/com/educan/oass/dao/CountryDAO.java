package com.educan.oass.dao;

import com.educan.oass.db.connection.MsSqlConnection;
import com.educan.oass.models.Country;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class CountryDAO {
    private final Connection con;

    public CountryDAO() {
        this.con = new MsSqlConnection().connect();
    }
    
    public List<Country> list(){
        List<Country> dataList = new ArrayList<>();
        PreparedStatement pstmt = null;
        String selectSQL = "SELECT CN.* FROM dbo.Country CN";
        try {
            pstmt = con.prepareStatement(selectSQL);
            
            ResultSet rs = pstmt.executeQuery();
            Country data;
            while (rs.next()) {
                data=new Country();
                data.setCountryId(rs.getInt("CountryID"));
                data.setCountryName(rs.getString("CountryName"));
                
                dataList.add(data); //add consultant to Array<Consultant>
            }
            rs.close();
            
            return dataList;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
        }
    }
}
