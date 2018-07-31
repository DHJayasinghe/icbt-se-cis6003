package com.educan.oass.dao;

import com.educan.oass.common.ResponseToken;
import com.educan.oass.db.connection.MsSqlConnection;
import com.educan.oass.models.Appointment;
import com.educan.oass.models.AppointmentTime;
import com.educan.oass.services.LoginIdentity;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class AppointmentDAO implements DbMethods {
    
    private final Connection con;
    
    public AppointmentDAO() {
        this.con = new MsSqlConnection().connect();
    }
    
    /**
     * Make Student Appointment (For students)
     * @param model Appointment
     * @param identity Login Identity
     * @return ResponseToken
     */
    @Override
    public ResponseToken add(Object model, LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            Appointment data = (Appointment) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetStudentAppointment(?,?,?,?,?,?,?,?,?,?)}");
            
            cstmt.setInt(1, 0);
            cstmt.setString("email", identity.getUsername());
            cstmt.setInt("fieldId", data.getFieldId());
            cstmt.setInt("sessionId", data.getSessionId());
            cstmt.setDate("scheduledDate", data.getScheduledDate());
            cstmt.setString("scheduledTimeFrom", data.getScheduledTimeFrom());
            cstmt.setString("scheduledTimeTo", data.getScheduledTimeTo());
            
            cstmt.setString("request_type", "MAKE-APPOINTMENT");  //set request type
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
    
    @Override
    public Object delete(Object model, LoginIdentity identity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public Object details(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public Object findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List<AppointmentTime> timeTable(int consultantId,String appointmentDate){
        List<AppointmentTime> result = new ArrayList<>();
        CallableStatement cstmt = null;
        
        try {
            //first convert string to java.util.Date object using SimpleDateFormat
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = sdf.parse(appointmentDate);

            java.sql.Date sqlDate = new Date(date.getTime());
                
            cstmt = con.prepareCall("{call dbo.ProcGetAppntmntTimeTable(?,?)}");
            
            cstmt.setInt("consultantId", consultantId);
            cstmt.setDate("appointmentDate", sqlDate);
            
            // execute stored procedure
            cstmt.execute();
            
            ResultSet rs=cstmt.getResultSet();
            AppointmentTime appTime;
            while(rs.next()){
                appTime=new AppointmentTime();
                
                appTime.setSessionId(rs.getInt("SessionId"));
                appTime.setConsultantId(rs.getInt("ConsultantId"));
                appTime.setConsultantName(rs.getString("ConsultantName"));
                appTime.setSessionWeekDay(rs.getString("SessionWeekDay"));
                appTime.setScheduledDate(rs.getDate("ScheduledDate"));
                appTime.setSessionDate(rs.getString("SessionDate"));
                appTime.setScheduledTimeFrom(rs.getString("ScheduledTimeFrom"));
                appTime.setSessionTimeFrom(rs.getString("SessionTimeFrom"));
                appTime.setScheduledTimeTo(rs.getString("ScheduledTimeTo"));
                appTime.setSessionTimeTo(rs.getString("SessionTimeTo"));
                appTime.setRoom(rs.getString("Room"));
                appTime.setAvailable(rs.getString("Available"));
                
                result.add(appTime);
            }
            
        } catch (SQLException | ParseException ex) {
            System.out.println(ex.getMessage());
            //Logger.getLogger(AppointmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
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
}
