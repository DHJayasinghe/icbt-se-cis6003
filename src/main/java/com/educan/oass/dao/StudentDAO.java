package com.educan.oass.dao;

import com.educan.oass.common.ResponseToken;
import com.educan.oass.db.connection.MsSqlConnection;
import com.educan.oass.models.SignUp;
import com.educan.oass.models.Student;
import com.educan.oass.models.StudentDetails;
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
public class StudentDAO implements DbMethods {
    
    private final Connection con;
    
    public StudentDAO() {
        con = new MsSqlConnection().connect();
    }
    
    /*Check whether account already exist for email address */
    public int isAccAlreadyExist(String email) {
        PreparedStatement pstmt = null;
        
        String selectSQL = "SELECT TOP 1 ST.StudentId FROM dbo.Student ST WHERE ST.Email=? AND ST.RecStatus='A'";
        try {
            pstmt = con.prepareStatement(selectSQL);
            pstmt.setString(1, email);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next() == false) {  //Account not exist
                return 0;
            } else {    //Account already taken
                return 1;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
            
            return -1;
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
    
    /*Get password hash of data account of email address */
    public String getPasswordHash(String email) {
        String pwordhash = null;
        PreparedStatement pstmt = null;
        
        String selectSQL = "SELECT TOP 1 ST.PwordHash FROM dbo.Student ST WHERE ST.Email=? AND ST.RecStatus='A'";
        try {
            pstmt = con.prepareStatement(selectSQL);
            pstmt.setString(1, email);
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                pwordhash = rs.getString("PwordHash");
            }
            
            return pwordhash;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public ResponseToken add(Object model,LoginIdentity identity) {
        ResponseToken result = new ResponseToken();
        CallableStatement cstmt = null;
        
        try {
            SignUp data = (SignUp) model;   //cast model
            cstmt = con.prepareCall("{call dbo.ProcSetStudentSignup(?,?,?,?,?,?,?)}");
            
            cstmt.setString("email", data.getUsername());
            cstmt.setInt("emailConfirmed", 1);
            cstmt.setString("pwordHash", data.getPassword());
            cstmt.setString("firstname", data.getFirstName());
            cstmt.setString("lastname", data.getLastName());
            
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
            Student data = (Student) model;
            
            cstmt = con.prepareCall("{call dbo.ProcSetStudentDetails(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cstmt.setInt("studentid", data.getStudentId());
            cstmt.setString("email", data.getEmail());
            cstmt.setString("firstname", data.getFirstName());
            cstmt.setString("lastname", data.getLastName());
            cstmt.setString("title", data.getTitle());
            cstmt.setString("gender", data.getGender());
            cstmt.setDate("dateofbirth", data.getDateOfBirth());
            cstmt.setString("mobilenumber", data.getMobileNumber());
            cstmt.setString("phonenumber", data.getPhoneNumber());
            cstmt.setString("building", data.getBuilding());
            cstmt.setString("street", data.getStreet());
            cstmt.setString("city", data.getCity());
            cstmt.setString("postal", data.getPostal());
            cstmt.setString("country", data.getCountry());
            cstmt.setString("qualification", data.getQualification());
            
            cstmt.setString("request_type", "EDIT-RECORD");
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
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                    //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
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
    public Object delete(Object model,LoginIdentity identity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public Student details(String id) {
        Student student = new Student();
        PreparedStatement pstmt = null;
        
        String selectSQL = "SELECT TOP 1 ST.* FROM dbo.GetStudentDetails ST WHERE ST.Email=? AND ST.RecStatus='A'";
        try {
            pstmt = con.prepareStatement(selectSQL);
            pstmt.setString(1, id);
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                student.setEmail(rs.getString("Email"));
                student.setFirstName(rs.getString("FirstName"));
                student.setLastName(rs.getString("LastName"));
                student.setTitle(rs.getString("Title"));
                student.setGender(rs.getString("Gender"));
                student.setDateOfBirth(rs.getDate("DateOfBirth"));
                student.setMobileNumber(rs.getString("MobileNumber"));
                student.setPhoneNumber(rs.getString("PhoneNumber"));
                student.setBuilding(rs.getString("Building"));
                student.setStreet(rs.getString("Street"));
                student.setCity(rs.getString("City"));
                student.setPostal(rs.getString("Postal"));
                student.setCountry(rs.getString("Country"));
                student.setQualification(rs.getString("Qualification"));
            }
            rs.close();
            
            return student;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            //Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public List<StudentDetails> findAll() {
        List<StudentDetails> dataList = new ArrayList<>();
        PreparedStatement pstmt = null;
        String selectSQL = "SELECT CN.* FROM dbo.GetStudentDetails CN";
        try {
            pstmt = con.prepareStatement(selectSQL);
            
            ResultSet rs = pstmt.executeQuery();
            StudentDetails data;
            while (rs.next()) {
                data=new StudentDetails();
                data.setStudentId(rs.getInt("StudentId"));
                data.setEmail(rs.getString("Email"));
                data.setFirstName(rs.getString("FirstName"));
                data.setLastName(rs.getString("LastName"));
                data.setTitle(rs.getString("Title"));
                data.setGender(rs.getString("Gender"));
                data.setDateOfBirth(rs.getDate("DateOfBirth"));
                data.setMobileNumber(rs.getString("MobileNumber"));
                data.setPhoneNumber(rs.getString("PhoneNumber"));
                data.setQualification(rs.getString("Qualification"));
                data.setBuilding(rs.getString("Building"));
                data.setStreet(rs.getString("Street"));
                data.setCity(rs.getString("City"));
                data.setPostal(rs.getString("Postal"));
                data.setCountry(rs.getString("Country"));
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
                    System.out.println(ex.getMessage());
                }
            }
        }
    }
}
