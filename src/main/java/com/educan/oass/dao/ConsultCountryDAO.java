package com.educan.oass.dao;

import com.educan.oass.common.ResponseToken;
import com.educan.oass.db.connection.MsSqlConnection;
import com.educan.oass.models.Speciality;
import com.educan.oass.services.LoginIdentity;

import java.sql.CallableStatement;
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
public class ConsultCountryDAO implements DbMethods {
    private final Connection con;

    public ConsultCountryDAO() {
        this.con = new MsSqlConnection().connect();
    }
    
    @Override
    public ResponseToken update(Object model, LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            Speciality data = (Speciality) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetConsultantCountry(?,?)}");
            
            cstmt.setInt("consultant_id", data.getConsultantId());
            cstmt.setString("consultant_country", data.getCountryName());
            
            // execute stored procedure
            cstmt.executeUpdate();
            
            result.setCode(1);
            result.setMessage("Consultant Country Assigned Successfuly.");
        } catch (SQLException ex) {
            result.setCode(-1);
            result.setMessage(ex.getMessage());
            
            System.out.println(ex.getMessage());
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
        }
        
        return result;
    }

    /**
     * Get Consultant Specialized Country
     * @param id Consultant Id
     * @return Speciality
     */
    @Override
    public Speciality details(String id) {
        PreparedStatement pstmt = null;
        
        String selectSQL = "SELECT CN.* FROM dbo.GetConsultantCountry CN WHERE CN.ConsultantId=?";
        try {
            pstmt = con.prepareStatement(selectSQL);
            pstmt.setInt(1, Integer.parseInt(id));
            
            List<String> countries=new ArrayList<>();
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next())
                    countries.add(Integer.toString(rs.getInt("CountryId")));
            }
            
            Speciality data = new Speciality();
            data.setConsultantId(Integer.parseInt(id)); //set consultant id
            data.setCountryName(String.join(",", countries)); //arrange consultant countries into string, separated by comma
            
            return data;    //return speciality object
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

    @Override
    public Object add(Object model, LoginIdentity identity) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public Object delete(Object id, LoginIdentity identity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public Object findAll() {
        throw new UnsupportedOperationException("Not supported yet."); 
    }
    
}
