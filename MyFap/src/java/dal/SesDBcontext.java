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
import model.Lecturer;
import model.Room;
import model.Session;
import model.Slot;
import model.Student;

/**
 *
 * @author Hoàng
 */
public class SesDBcontext extends DBcontext<Session>{
    
    public ArrayList<Session> getSession(int stid, int gid){
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT S.Session_ID,G.[Group],ST.Name, R.Room, S.Date, SL.Start, SL.[End], L.Lecturer, SL.Slot_ID, SL.Slot FROM \n"
                    + "[Session] S INNER JOIN  [Group] G ON G.Group_ID = S.GroupID\n"
                    + "INNER JOIN Rom R ON S.Room_ID = R.Room_ID\n"
                    + "INNER JOIN Student_Group SG ON SG.Group_ID = G.Group_ID \n"
                    + "INNER JOIN Student ST ON ST.Student_ID = SG.Student_ID \n"
                    + "INNER JOIN Slot SL ON SL.Slot_ID = S.Slot_ID\n"
                    + "Inner JOIN Lecturer L ON L.Lecturer_ID = S.Lid\n"
                    + "WHERE ST.Student_ID = ? AND G.Group_ID = ?\n";
                    

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stid);
            stm.setInt(2, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                Room r = new Room();
                Group g = new Group();
                Lecturer l = new Lecturer();
                Slot sl = new Slot();
                Student st = new Student();
                r.setRoomName(rs.getString("Room"));
                s.setRoom(r);
                
                st.setName(rs.getString("Name"));
                g.setGname(rs.getString("Group"));
                g.setStudents(st);
                s.setGroup(g);

                l.setLname(rs.getString("Lecturer"));
                s.setLec(l);
                
                sl.setSlname(rs.getString("Slot"));
                sl.setSlid(rs.getInt("Slot_ID"));
                sl.setStart(rs.getString("Start"));
                sl.setEnd(rs.getString("End"));
                s.setSlot(sl);

                s.setSesId(rs.getInt("Session_ID"));
                s.setDate(rs.getDate("Date"));

                sessions.add(s);
            }
//            String spl = "SELECT TOP (1000) [Room_ID]\n"
//                    + "      ,[Room]\n"
//                    + "  FROM [SE1643_PRJ301].[dbo].[Rom]";
//            PreparedStatement stm = connection.prepareStatement(spl);
//            ResultSet rs = stm.executeQuery();
//            while(rs.next()){
//                Room r = new Room();
//                r.setRoomId(rs.getInt("Room_ID"));
//               // r.setRoomName(rs.getString("Room"));
//                sessions.add(r);
//            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    @Override
    public void insert(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Session get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
