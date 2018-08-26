package com.educan.oass.dao;

import com.educan.oass.common.ResponseToken;
import com.educan.oass.db.connection.MsSqlConnection;
import com.educan.oass.models.Appointment;
import com.educan.oass.models.AppointmentSummary;
import com.educan.oass.models.AppointmentTime;
import com.educan.oass.services.LoginIdentity;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
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
     * Make an Appointment (For students)
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
            
            cstmt.setInt("appointmentId" ,java.sql.Types.INTEGER);
            cstmt.setString("email", identity.getUsername());
            cstmt.setInt("fieldId", data.getFieldId());
            cstmt.setInt("sessionId", data.getSessionId());
            cstmt.setDate("scheduledDate", data.getScheduledDate());
            cstmt.setString("scheduledTimeFrom", data.getScheduledTimeFrom());
            cstmt.setString("scheduledTimeTo", data.getScheduledTimeTo());
            
            cstmt.setString("request_type", "MAKE-APPOINTMENT");  //set request type
            cstmt.registerOutParameter("appointmentId" ,java.sql.Types.INTEGER);
            cstmt.registerOutParameter("response_code", java.sql.Types.INTEGER);
            cstmt.registerOutParameter("response_msg", java.sql.Types.VARCHAR);
            
            // execute stored procedure
            cstmt.executeUpdate();
            
            //capture output parameters here
            data.setAppointmentId(cstmt.getInt("appointmentId"));
            result.setCode(cstmt.getInt("response_code"));  //set ResponseToken code parameter
            result.setMessage(cstmt.getString("response_msg")); //set ResponseToken msg parameter
            result.setData(data); //set ResponseToken data parameter
            
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
     * Mark as attended for an Appointment (For admin users)
     * @param model Appointment
     * @param identity Login Identity
     * @return ResponseToken
     */
    @Override
    public ResponseToken update(Object model, LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            Appointment data = (Appointment) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetMarkasAttended(?,?,?,?,?)}");
            
            cstmt.setInt("appointmentId", data.getAppointmentId());
            
            cstmt.setString("request_type", "MARKAS-ATTENDED");  //set request type
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
     * Cancel an Appointment (For students)
     * @param model Appointment
     * @param identity Login Identity
     * @return ResponseToken
     */
    @Override
    public ResponseToken delete(Object model, LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            Appointment data = (Appointment) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetStudentAppointment(?,?,?,?,?,?,?,?,?,?)}");
            
            cstmt.setInt(1, data.getAppointmentId());
            cstmt.setString("email", identity.getUsername());
            cstmt.setInt("fieldId", 0);
            cstmt.setInt("sessionId", 0);
            cstmt.setDate("scheduledDate",null);
            cstmt.setString("scheduledTimeFrom", "");
            cstmt.setString("scheduledTimeTo", "");
            
            cstmt.setString("request_type", "CNCL-APPOINTMENT");  //set request type
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
    public AppointmentSummary details(String id) {
        AppointmentSummary data = new AppointmentSummary();
        PreparedStatement pstmt = null;
        
        String selectSQL = "SELECT CN.* FROM dbo.GetAppointmentSummary CN WHERE CN.AppointmentId=? AND CN.RecStatus='A'";
        try {
            pstmt = con.prepareStatement(selectSQL);
            pstmt.setInt(1, Integer.parseInt(id));
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    data=new AppointmentSummary();
                    data.setAppointmentId(rs.getInt("AppointmentId"));
                    data.setStudentName(rs.getString("StudentName"));
                    data.setStudentEmail(rs.getString("StudentEmail"));
                    data.setStudyField(rs.getString("StudyField"));
                    data.setAppointmentDate(rs.getString("AppointmentDate"));
                    data.setAppointmentTime(rs.getString("AppointmentTime"));
                    data.setConsultantName(rs.getString("ConsultantName"));
                    data.setCreatedDate(rs.getString("CreatedDate"));
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
    public Object findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    /**
     * Appointment Times Table (For students)
     * @param consultantId Consultant Id (Filter option)
     * @param appointmentDate Appointment Date (Filter option)
     * @return List<AppointmentTime>
     */
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
    
    /**
     * Appointment History (For both Student & Admin)
     * @param id if@param type=="student" then Student Email Address
     * @param type "student" then handle Student Request, else handle Admin request
     * @return List<AppointmentSummary>
     */
    public List<AppointmentSummary> summary(String id,String type){
        List<AppointmentSummary> dataList = new ArrayList<>();
        PreparedStatement pstmt = null;
        
        String selectSQL ="";
        if("student".equals(type)) //filter appointment summary of student(for studnet purpose)
            selectSQL = "SELECT CN.* FROM dbo.GetAppointmentSummary CN WHERE CN.StudentEmail=?";
        else //for admin users requests
            selectSQL="SELECT CN.* FROM dbo.GetAppointmentSummary CN";
        
        try {
            pstmt = con.prepareStatement(selectSQL);
            if("student".equals(type)) //set filter by email paramete for student request
                pstmt.setString(1, id);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                AppointmentSummary data;
                while (rs.next()) {
                    data=new AppointmentSummary();
                    data.setAppointmentId(rs.getInt("AppointmentId"));
                    data.setStudentName(rs.getString("StudentName"));
                    data.setStudentEmail(rs.getString("StudentEmail"));
                    data.setStudentContact(rs.getString("StudentContact"));
                    data.setStudyField(rs.getString("StudyField"));
                    data.setRoom(rs.getString("Room"));
                    data.setAppointmentDate(rs.getString("AppointmentDate"));
                    data.setAppointmentTime(rs.getString("AppointmentTime"));
                    data.setAppointmentStatus(rs.getString("RecStatus"));
                    data.setConsultantName(rs.getString("ConsultantName"));
                    data.setDateExpired(rs.getString("DateExpired"));
                    data.setIsAttended(rs.getString("IsAttended"));
                    data.setCreatedDate(rs.getString("CreatedDate"));
                    data.setModifiedDate(rs.getString("ModifiedDate"));
                    
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
