
package com.educan.oass.dao;

import com.educan.oass.db.connection.MsSqlConnection;
import com.educan.oass.models.AppointmentSummaryReport;
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
public class ReportSummaryDAO {
    private final Connection con;

    public ReportSummaryDAO() {
        this.con = new MsSqlConnection().connect();
    }
    
    public List<AppointmentSummaryReport> appointmentReport(String reportType,String startDate,String endDate){
        List<AppointmentSummaryReport> result=new ArrayList<>();
        CallableStatement cstmt = null;
        
        try {
            //first convert string to java.util.Date object using SimpleDateFormat
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date _startDate = sdf.parse(startDate);
            java.util.Date _endDate = sdf.parse(endDate);
            
            java.sql.Date sqlDate1 = new Date(_startDate.getTime());
            java.sql.Date sqlDate2 = new Date(_endDate.getTime());
            
            cstmt = con.prepareCall("{call dbo.ProcGetAppointmentReport1(?,?,?)}");
            
            cstmt.setString("reportType", reportType);
            cstmt.setDate("STARTDATE", sqlDate1);
            cstmt.setDate("ENDDATE", sqlDate2);
            
            // execute stored procedure
            cstmt.execute();
            
            ResultSet rs=cstmt.getResultSet();
            AppointmentSummaryReport apt;
            while(rs.next()){
                apt=new AppointmentSummaryReport();
                
                apt.setFieldName(rs.getString("FieldName"));
                apt.setAptCount(rs.getInt("AptCount"));
                apt.setYear(rs.getString("Year"));
                apt.setMonth(rs.getString("Month"));
                apt.setWeekDay(rs.getString("Weekday"));
                
                result.add(apt);
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
