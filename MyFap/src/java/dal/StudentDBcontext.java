/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;
import model.Group;
import model.Lecturer;
import model.Session;
import model.Student;

/**
 *
 * @author Hoàng
 */
public class StudentDBcontext extends DBcontext<Student> {

    public ArrayList<Attendance> getListStudent(int sesid) {
        try {
            ArrayList<Attendance> students = new ArrayList<>();
            String sql = "SELECT SES.Session_ID, G.[Group], ST.Student_ID, st.Name, A.attandance, A.description, A.recordtime, SES.Date, SES.Slot_ID, L.Lecturer FROM \n"
                    + "[Session] SES\n"
                    + "INNER JOIN [GROUP] G ON SES.GroupID = G.Group_ID\n"
                    + "INNER JOIN Student_Group SG ON G.Group_ID = SG.Group_ID\n"
                    + "INNER JOIN Student ST ON ST.Student_ID = SG.Student_ID\n"
                    + "INNER JOIN Lecturer L ON L.Lecturer_ID = SES.Lid\n"
                    + "LEFT JOIN Attendent A ON (A.sesid = SES.Session_ID and A.stid = SG.Student_ID)\n"
                    + "where ses.Session_ID = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Attendance a = new Attendance();
                Session s = new Session();
                Student st= new Student();
                Group g = new Group();
                Lecturer l = new Lecturer();
                
                l.setLname(rs.getString("Lecturer"));
                g.setGname(rs.getString("Group"));
                s.setGroup(g);
                s.setLec(l);
                a.setSessions(s);
                
                st.setId(rs.getInt("Student_ID"));
                st.setName(rs.getString("Name"));
                a.setStudents(st);
                
                a.setAttendance(rs.getBoolean("attandance"));
                a.setDescription(rs.getString("description"));
                a.setRecordTime(rs.getDate("recordtime"));
                students.add(a);
                
                
            }
            return students;
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
