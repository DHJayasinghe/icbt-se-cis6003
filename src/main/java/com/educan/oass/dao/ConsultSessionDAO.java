package com.educan.oass.dao;

import com.educan.oass.common.ResponseToken;

import com.educan.oass.db.connection.MsSqlConnection;

import com.educan.oass.models.ConsultSession;
import com.educan.oass.models.ConsultSessionDetails;

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
public class ConsultSessionDAO implements DbMethods {
    private final Connection con;
    
    public ConsultSessionDAO() {
        this.con = new MsSqlConnection().connect();
    }
    
    @Override
    public ResponseToken add(Object model, LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            ConsultSession data = (ConsultSession) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetConsultantSession(?,?,?,?,?,?,?,?,?,?,?,?)}");
            
            cstmt.setInt("sessionId", 0);
            cstmt.setInt("consultantId", data.getConsultantId());
            cstmt.setDate("sessionDate", data.getSessionDate());
            cstmt.setString("sessionTimeFrom", data.getSessionTimeFrom());
            cstmt.setString("sessionTimeTo", data.getSessionTimeTo());
            cstmt.setInt("sessionDuration", data.getSessionDuration());
            cstmt.setString("room", data.getRoom());
            
            cstmt.setString("request_remarks", "");
            cstmt.setString("request_type", "ADD-SESSION");  //set request type
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
                    System.out.println(ex.getMessage());
                    //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return result;
    }
    
    @Override
    public Object update(Object model, LoginIdentity identity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    /**
     * Delete consultant session
     * @param model ConsultantSession
     * @param identity LoginIdentity
     * @return 
     */
    @Override
    public ResponseToken delete(Object model, LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            ConsultSession data = (ConsultSession) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetConsultantSession(?,?,?,?,?,?,?,?,?,?,?,?)}");
            
            cstmt.setInt("sessionId", 0);
            cstmt.setInt("consultantId", data.getConsultantId());
            cstmt.setDate("sessionDate", null);
            cstmt.setString("sessionTimeFrom", null);
            cstmt.setString("sessionTimeTo", null);
            cstmt.setInt("sessionDuration", 0);
            cstmt.setString("room", null);
            
            cstmt.setString("request_remarks", data.getRecRemarks());
            cstmt.setString("request_type", "DLT-SESSION");  //set request type
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
                    System.out.println(ex.getMessage());
                    //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return result;
    }
    
    /**
     * Get ConsultSession Details by Session Id
     * @param id Session Id
     * @return ConsultSessionDetails
     */
    @Override
    public ConsultSessionDetails details(String id) {
        ConsultSessionDetails data=new ConsultSessionDetails();
        PreparedStatement pstmt = null;
        String selectSQL = "SELECT CN.* FROM dbo.GetConsultSessionDetails CN WHERE CN.SessionId=? AND CN.RecStatus='A'";
        try {
            pstmt = con.prepareStatement(selectSQL);
            pstmt.setInt(1, Integer.parseInt(id));
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    data.setSessionId(rs.getInt("SessionId"));
                    data.setConsultantId(rs.getInt("ConsultantId"));
                    data.setConsultantName(rs.getString("ConsultantName"));
                    data.setSessionDate(rs.getString("SessionDate"));
                    data.setSessionWeekDay(rs.getString("SessionWeekDay"));
                    data.setSessionDuration(rs.getString("SessionDuration"));
                    data.setSessionTimeFrom(rs.getString("SessionTimeFrom"));
                    data.setSessionTimeTo(rs.getString("SessionTimeTo"));
                    data.setRoom(rs.getString("Room"));
                }
            }
            
            return data;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                    //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    @Override
    public List<ConsultSessionDetails> findAll() {
        List<ConsultSessionDetails> dataList = new ArrayList<>();
        PreparedStatement pstmt = null;
        String selectSQL = "SELECT CN.* FROM dbo.GetConsultSessionDetails CN";
        try {
            pstmt = con.prepareStatement(selectSQL);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                ConsultSessionDetails data;
                while (rs.next()) {
                    data=new ConsultSessionDetails();
                    data.setSessionId(rs.getInt("SessionId"));
                    data.setConsultantId(rs.getInt("ConsultantId"));
                    data.setConsultantName(rs.getString("ConsultantName"));
                    data.setSessionDate(rs.getString("SessionDate"));
                    data.setSessionWeekDay(rs.getString("SessionWeekDay"));
                    data.setSessionDuration(rs.getString("SessionDuration"));
                    data.setSessionTimeFrom(rs.getString("SessionTimeFrom"));
                    data.setSessionTimeTo(rs.getString("SessionTimeTo"));
                    data.setRoom(rs.getString("Room"));
                    data.setCreatedDate(rs.getString("CreatedDate"));
                    data.setRecStatus(rs.getString("RecStatus"));
                    
                    dataList.add(data); //add consultant to Array<Consultant>
                }
            }
            
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
                    //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
}
