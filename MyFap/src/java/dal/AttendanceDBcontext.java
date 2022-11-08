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
import model.Session;
import model.Student;

/**
 *
 * @author Hoàng
 */
public class AttendanceDBcontext extends DBcontext<Attendance> {

    public Attendance Attendance(int stid, int sesid) {
        Attendance a = new Attendance();
        try {
            String sql = "Select attandance, description from Attendent\n"
                    + "where sesid = ? and stid = ?";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, sesid);
            stm.setInt(2, stid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                a.setAttendance(rs.getBoolean("attandance"));
                a.setDescription(rs.getString("description"));
                //sSystem.out.println("attendance" + a);
            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void update(Attendance model, int sesid, int stid, boolean a, String comment) {
        try {
            
//            String sql = "UPDATE Attendent SET attandance = 1\n"
//                    + "WHERE sesid = ? AND stid =?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, sesid);
//            stm.setInt(2, stid);
//            stm.executeUpdate();

            //remove old attandances
            String sql = "DELETE Attendent WHERE sesid = ? And stid = ?";
            PreparedStatement stm_delete = connection.prepareStatement(sql);
            stm_delete.setInt(1, sesid);
            stm_delete.setInt(2, stid);
            stm_delete.executeUpdate();
//
            //insert new attandances
            sql = "INSERT INTO [dbo].[Attendent]\n"
                    + "           ([sesid]\n"
                    + "           ,[stid]\n"
                    + "           ,[attandance]\n"
                    + "           ,[description]\n"
                    + "           ,[recordtime])\n"
                    + "            VALUES\n"
                    + "           (?,\n"
                    + "            ?,\n"
                    + "            ?,\n"
                    + "            ?,\n"
                    + "            GETDATE())";
            PreparedStatement stm_insert = connection.prepareStatement(sql);
            stm_insert.setInt(1, sesid);
            stm_insert.setInt(2, stid);
            stm_insert.setBoolean(3, a);
            stm_insert.setString(4, comment);
            stm_insert.executeUpdate();
//
//            
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(SessionDBcontext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(SessionDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBcontext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void delete(Attendance model) {

    }

    @Override
    public Attendance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
