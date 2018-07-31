package com.educan.oass.dao;

import com.educan.oass.common.ResponseToken;
import com.educan.oass.db.connection.MsSqlConnection;
import com.educan.oass.models.Field;
import com.educan.oass.models.FieldDetails;
import com.educan.oass.services.LoginIdentity;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class FieldDAO implements DbMethods {
    private final Connection con;
    
    public FieldDAO() {
        this.con = new MsSqlConnection().connect();
    }
    
    @Override
    public ResponseToken add(Object model, LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            Field data = (Field) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetFieldOfStudy(?,?,?,?,?,?,?)}");
            
            cstmt.setInt("fieldid", 0);
            cstmt.setString("fieldname", data.getFieldName());
            cstmt.setString("description", data.getDescription());
            
            cstmt.setString("request_type", "ADD-RECORD");  //set request type
            cstmt.setInt("request_user",identity.getUserid());  //set requested user id
            cstmt.registerOutParameter("response_code", java.sql.Types.INTEGER);
            cstmt.registerOutParameter("response_msg", java.sql.Types.VARCHAR);
            
            // execute stored procedure
            cstmt.executeUpdate();
            result.setCode(cstmt.getInt("response_code"));
            result.setMessage(cstmt.getString("response_msg"));
            
        } catch (SQLException ex) {
            result.setCode(-1);
            result.setMessage(ex.getMessage());
            
            System.out.println(ex.getMessage());
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return result;
    }
    
    @Override
    public ResponseToken update(Object model, LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            Field data = (Field) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetFieldOfStudy(?,?,?,?,?,?,?)}");
            
            cstmt.setInt("fieldid", data.getFieldId());
            cstmt.setString("fieldname", data.getFieldName());
            cstmt.setString("description", data.getDescription());
            
            cstmt.setString("request_type", "EDT-RECORD");  //set request type
            cstmt.setInt("request_user",identity.getUserid());  //set requested user id
            cstmt.registerOutParameter("response_code", java.sql.Types.INTEGER);
            cstmt.registerOutParameter("response_msg", java.sql.Types.VARCHAR);
            
            // execute stored procedure
            cstmt.executeUpdate();
            result.setCode(cstmt.getInt("response_code"));
            result.setMessage(cstmt.getString("response_msg"));
            
        } catch (SQLException ex) {
            result.setCode(-1);
            result.setMessage(ex.getMessage());
            
            System.out.println(ex.getMessage());
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return result;
    }
    
    @Override
    public ResponseToken delete(Object model, LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            Field data=(Field)model;
            cstmt = con.prepareCall("{call dbo.ProcSetFieldOfStudy(?,?,?,?,?,?,?)}");
            
            cstmt.setInt("fieldid", data.getFieldId());
            cstmt.setString("fieldname", "");
            cstmt.setString("description", "");
            
            cstmt.setString("request_type", "DLT-RECORD");  //set request type
            cstmt.setInt("request_user",identity.getUserid());  //set requested user id
            cstmt.registerOutParameter("response_code", java.sql.Types.INTEGER);
            cstmt.registerOutParameter("response_msg", java.sql.Types.VARCHAR);
            
            // execute stored procedure
            cstmt.executeUpdate();
            result.setCode(cstmt.getInt("response_code"));
            result.setMessage(cstmt.getString("response_msg"));
            
        } catch (SQLException ex) {
            result.setCode(-1);
            result.setMessage(ex.getMessage());
            
            System.out.println(ex.getMessage());
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return result;
    }
    
    /**
     * Details of Active Field of Study
     * @param id Field ID
     * @return
     */
    @Override
    public Field details(String id) {
        Field data = new Field();
        PreparedStatement pstmt = null;
        
        String selectSQL = "SELECT SF.* FROM dbo.GetStudyFieldDetails SF WHERE SF.FieldId=? AND SF.RecStatus='A'";
        try {
            pstmt = con.prepareStatement(selectSQL);
            pstmt.setInt(1, Integer.parseInt(id));
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                data.setFieldId(rs.getInt("FieldId"));
                data.setFieldName(rs.getString("FieldName"));
                data.setDescription(rs.getString("Description"));
            }
            rs.close();
            
            return data;
        } catch (SQLException ex) {
            return null;
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    /**
     * Filed of Study Summary
     * @return
     */
    @Override
    public List<FieldDetails> findAll() {
        List<FieldDetails> dataList = new ArrayList<FieldDetails>();
        PreparedStatement pstmt = null;
        String selectSQL = "SELECT FD.* FROM dbo.GetStudyFieldDetails FD";
        try {
            pstmt = con.prepareStatement(selectSQL);
            
            ResultSet rs = pstmt.executeQuery();
            FieldDetails data;
            while (rs.next()) {
                data=new FieldDetails();
                data.setFieldId(rs.getInt("FieldId"));
                data.setFieldName(rs.getString("FieldName"));
                data.setDescription(rs.getString("Description"));
                data.setCreatedDate(rs.getString("CreatedDate"));
                data.setRecStatus(rs.getString("RecStatus"));
                
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
                    Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    /**
     * Active List of Fields
     * @return
     */
    public List<Field> list(){
        List<Field> dataList = new ArrayList<>();
        PreparedStatement pstmt = null;
        String selectSQL = "SELECT FD.* FROM dbo.GetStudyFieldDetails FD WHERE FD.RecStatus='A'";
        try {
            pstmt = con.prepareStatement(selectSQL);
            
            ResultSet rs = pstmt.executeQuery();
            Field data;
            while (rs.next()) {
                data=new Field();
                data.setFieldId(rs.getInt("FieldId"));
                data.setFieldName(rs.getString("FieldName"));
                
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
                    Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
