package com.educan.oass.dao;

import com.educan.oass.common.ResponseToken;
import com.educan.oass.db.connection.MsSqlConnection;
import com.educan.oass.models.Consultant;
import com.educan.oass.models.ConsultantDetails;
import com.educan.oass.models.ConsultantProfile;
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
public class ConsultantDAO implements DbMethods {
    
    private final Connection con;
    
    public ConsultantDAO() {
        this.con = new MsSqlConnection().connect();
    }
    
    @Override
    public ResponseToken add(Object model,LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            Consultant data = (Consultant) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetConsultantDetails(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            
            cstmt.setInt("consultantId", 0);
            cstmt.setString("email", data.getEmail());
            cstmt.setString("firstName", data.getFirstName());
            cstmt.setString("lastName", data.getLastName());
            cstmt.setString("title", data.getTitle());
            cstmt.setString("gender", data.getGender());
            cstmt.setDate("dateOfBirth", data.getDateOfBirth());
            cstmt.setString("mobileNumber", data.getMobileNumber());
            cstmt.setString("phoneNumber", data.getPhoneNumber());
            cstmt.setString("qualification", data.getQualification());
            
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
                    System.out.println(ex.getMessage());
                    //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return result;
    }
    
    @Override
    public ResponseToken update(Object model,LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            Consultant data = (Consultant) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetConsultantDetails(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            
            cstmt.setInt("consultantId", data.getConsultantId());
            cstmt.setString("email", data.getEmail());
            cstmt.setString("firstName", data.getFirstName());
            cstmt.setString("lastName", data.getLastName());
            cstmt.setString("title", data.getTitle());
            cstmt.setString("gender", data.getGender());
            cstmt.setDate("dateOfBirth", data.getDateOfBirth());
            cstmt.setString("mobileNumber", data.getMobileNumber());
            cstmt.setString("phoneNumber", data.getPhoneNumber());
            cstmt.setString("qualification", data.getQualification());
            
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
                    System.out.println(ex.getMessage());
                    //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return result;
    }
    
    @Override
    public ResponseToken delete(Object model,LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            Consultant data=(Consultant)model;
            cstmt = con.prepareCall("{call dbo.ProcSetConsultantDetails(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            
            cstmt.setInt("consultantId", data.getConsultantId());
            cstmt.setString("email", "");
            cstmt.setString("firstName", "");
            cstmt.setString("lastName", "");
            cstmt.setString("title", "");
            cstmt.setString("gender", "");
            cstmt.setDate("dateOfBirth", null);
            cstmt.setString("mobileNumber", "");
            cstmt.setString("phoneNumber", "");
            cstmt.setString("qualification", "");
            
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
                    System.out.println(ex.getMessage());
                    //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return result;
    }
    
    @Override
    public Consultant details(String id) {
        Consultant data = new Consultant();
        PreparedStatement pstmt = null;
        
        String selectSQL = "SELECT CN.* FROM dbo.GetConsultantDetails CN WHERE CN.ConsultantId=? AND CN.RecStatus='A'";
        try {
            pstmt = con.prepareStatement(selectSQL);
            pstmt.setInt(1, Integer.parseInt(id));
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                data.setConsultantId(rs.getInt("ConsultantId"));
                data.setEmail(rs.getString("Email"));
                data.setFirstName(rs.getString("FirstName"));
                data.setLastName(rs.getString("LastName"));
                data.setTitle(rs.getString("Title"));
                data.setGender(rs.getString("Gender"));
                data.setDateOfBirth(rs.getDate("DateOfBirth"));
                data.setMobileNumber(rs.getString("MobileNumber"));
                data.setPhoneNumber(rs.getString("PhoneNumber"));
                data.setQualification(rs.getString("Qualification"));
            }
            rs.close();
            
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
    
    /**
     * Consultant Summary Details (for admin)
     * @return List<ConsultantDetails>
     */
    @Override
    public List<ConsultantDetails> findAll(){
        List<ConsultantDetails> dataList = new ArrayList<>();
        PreparedStatement pstmt = null;
        String selectSQL = "SELECT CN.* FROM dbo.GetConsultantDetails CN";
        try {
            pstmt = con.prepareStatement(selectSQL);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                ConsultantDetails data;
                while (rs.next()) {
                    data=new ConsultantDetails();
                    data.setConsultantId(rs.getInt("ConsultantId"));
                    data.setEmail(rs.getString("Email"));
                    data.setFirstName(rs.getString("FirstName"));
                    data.setLastName(rs.getString("LastName"));
                    data.setTitle(rs.getString("Title"));
                    data.setGender(rs.getString("Gender"));
                    data.setDateOfBirth(rs.getDate("DateOfBirth"));
                    data.setMobileNumber(rs.getString("MobileNumber"));
                    data.setPhoneNumber(rs.getString("PhoneNumber"));
                    data.setQualification(rs.getString("Qualification"));
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
    
    /**
     * Active Consultant DropdownList
     * @return List<Consultant>
     */
    public List<Consultant> list(){
        List<Consultant> dataList = new ArrayList<>();
        PreparedStatement pstmt = null;
        String selectSQL = "SELECT CN.* FROM dbo.GetConsultantDetails CN WHERE CN.RecStatus='A'";
        try {
            pstmt = con.prepareStatement(selectSQL);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                Consultant data;
                while (rs.next()) {
                    data=new Consultant();
                    data.setConsultantId(rs.getInt("ConsultantId"));
                    data.setEmail(rs.getString("Email"));
                    data.setFirstName(rs.getString("FirstName"));
                    data.setLastName(rs.getString("LastName"));
                    data.setTitle(rs.getString("Title"));
                    data.setGender(rs.getString("Gender"));
                    data.setDateOfBirth(rs.getDate("DateOfBirth"));
                    data.setMobileNumber(rs.getString("MobileNumber"));
                    data.setPhoneNumber(rs.getString("PhoneNumber"));
                    data.setQualification(rs.getString("Qualification"));
                    
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
                }
            }
        }
    }
    
    /**
     * Consultant Public Profile (for students)
     * @param id Consultant Id
     * @return ConsultantProfile
     */
    public ConsultantProfile profile(String id){
        PreparedStatement pstmt = null;
        String selectSQL = "SELECT CN.* FROM dbo.GetConsultantViewProfile CN WHERE CN.ConsultantId=?";
        try {
            pstmt = con.prepareStatement(selectSQL);
            pstmt.setInt(1, Integer.parseInt(id));
            
            try (ResultSet rs = pstmt.executeQuery()) {
                ConsultantProfile data=new ConsultantProfile();
                
                while (rs.next()) {
                    data.setConsultantId(rs.getInt("ConsultantId"));
                    data.setConsultantName(rs.getString("ConsultantName"));
                    data.setQualification(rs.getString("Qualification"));
                    data.setCountrySpeciality(rs.getString("CountrySpeciality"));
                    data.setFieldSpeciality(rs.getString("FieldSpeciality"));
                }
                return data;
            }
            
            
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
