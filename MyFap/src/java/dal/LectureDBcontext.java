/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
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

/**
 *
 * @author Hoàng
 */
public class LectureDBcontext extends DBcontext<Lecturer> {

    public ArrayList<Session> getListSessionLecturer(int lid, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();

        try {
            String sql = "SELECT S.Session_ID,G.[Group], R.Room, S.Date, SL.Start, SL.[End], L.Lecturer_ID ,L.Lecturer, SL.Slot_ID FROM \n"
                    + "                   [Session] S INNER JOIN  [Group] G ON G.Group_ID = S.GroupID\n"
                    + "                    INNER JOIN Rom R ON S.Room_ID = R.Room_ID\n"
                    + "                    INNER JOIN Student_Group SG ON SG.Group_ID = G.Group_ID \n"
                    + "                    INNER JOIN Student ST ON ST.Student_ID = SG.Student_ID \n"
                    + "                    INNER JOIN Slot SL ON SL.Slot_ID = S.Slot_ID\n"
                    + "		           Inner JOIN Lecturer L ON L.Lecturer_ID = S.Lid\n"
                    + "                    WHERE L.Lecturer_ID = ?\n"
                    + "                    AND S.Date >= ? AND S.Date < = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                Room r = new Room();
                Group g = new Group();
                Lecturer l = new Lecturer();
                Slot sl = new Slot();

                r.setRoomName(rs.getString("Room"));
                s.setRoom(r);

                g.setGname(rs.getString("Group"));
                s.setGroup(g);
                
                l.setLid(rs.getInt("Lecturer_ID"));
                l.setLname(rs.getString("Lecturer"));
                s.setLec(l);

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
    public void insert(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lecturer get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Lecturer> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
