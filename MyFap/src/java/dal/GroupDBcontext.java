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
import model.Group;
import model.Student;

/**
 *
 * @author Hoàng
 */
public class GroupDBcontext extends DBcontext<Group> {

    public ArrayList<Group> getListGroup(int stid) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "SELECT g.Group_ID, G.[Group], S.Student_ID,S.Name, S.Gender, S.[Date of birth] FROM [Group] G \n"
                    + "INNER JOIN Student_Group SG ON SG.Group_ID = G.Group_ID\n"
                    + "INNER JOIN Student S ON SG.Student_ID = S.Student_ID\n"
                    + "WHERE S.Student_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                Student s = new Student();

                s.setId(rs.getInt("Student_ID"));
                s.setName(rs.getString("Name"));
                s.setGender(rs.getBoolean("Gender"));
                s.setDob(rs.getDate("Date of birth"));
                g.setGname(rs.getString("Group"));
                g.setGid(rs.getInt("Group_ID"));
                g.setStudents(s);
                groups.add(g);
            }
            return groups;
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Student> getListStudent(int gid) {
        ArrayList<Student> list = new ArrayList<>();
        try {
            String sql = "SELECT G.[Group], S.Student_ID,S.Name, S.Gender, S.[Date of birth] FROM [Group] G \n"
                    + "INNER JOIN Student_Group SG ON SG.Group_ID = G.Group_ID\n"
                    + "INNER JOIN Student S ON SG.Student_ID = S.Student_ID\n"
                    + "WHERE G.Group_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                
                Student s = new Student();

                s.setId(rs.getInt("Student_ID"));
                s.setName(rs.getString("Name"));
                s.setGender(rs.getBoolean("Gender"));
                s.setDob(rs.getDate("Date of birth"));
                list.add(s);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
