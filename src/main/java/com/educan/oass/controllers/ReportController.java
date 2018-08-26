package com.educan.oass.controllers;

import com.educan.oass.dao.ReportSummaryDAO;
import com.educan.oass.models.AppointmentSummaryReport;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
@RestController
@RequestMapping("/admin/report")
public class ReportController {
    ReportSummaryDAO reportDB;
    
    public ReportController() {
        reportDB=new ReportSummaryDAO();
    }
    
    @RequestMapping(value="/report1/{reportType}/{startDate}/{endDate}", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<AppointmentSummaryReport> report1(HttpServletResponse response,@PathVariable String reportType,@PathVariable String startDate,@PathVariable String endDate){
        List<String> reportTypes = Arrays.asList(new String[]{"ByWeekDays", "ByMonths","ByDates"});
        
        if(reportTypes.contains(reportType)){   //validate report type parameters
            try{
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); //validate date parameters
                df.parse(startDate); df.parse(endDate);
                
                return reportDB.appointmentReportByFieldofStudy(reportType, startDate, endDate);
            }
            catch(ParseException ex){
                response.setStatus( HttpServletResponse.SC_BAD_REQUEST);
                return null;
            }catch(Exception ex){
                response.setStatus( HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                return null;
            }
        }
        
        response.setStatus( HttpServletResponse.SC_BAD_REQUEST);
        return null;
    }
    
    @RequestMapping(value="/report2/{reportType}/{startDate}/{endDate}", method=RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<AppointmentSummaryReport> report2(HttpServletResponse response,@PathVariable String reportType,@PathVariable String startDate,@PathVariable String endDate){
        List<String> reportTypes = Arrays.asList(new String[]{"ByWeekDays", "ByMonths","ByDates"});
        
        if(reportTypes.contains(reportType)){   //validate report type parameters
            try{
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); //validate date parameters
                df.parse(startDate); df.parse(endDate);
                
                return reportDB.appointmentReportByConsultant(reportType, startDate, endDate);
            }
            catch(ParseException ex){
                response.setStatus( HttpServletResponse.SC_BAD_REQUEST);
                return null;
            }catch(Exception ex){
                response.setStatus( HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                return null;
            }
        }
        
        response.setStatus( HttpServletResponse.SC_BAD_REQUEST);
        return null;
    }
}
