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
import model.Account;
import model.Lecturer;
import model.Role;
import model.Student;

/**
 *
 * @author Hoàng
 */
public class AccountDBcontext extends DBcontext<Account> {

    public Account getAccount(String username, String password) {

        try {
            String sql = "SELECT A.username, A.[password],A.displayname, r.rname FROM Account A \n"
                    + "INNER JOIN Role_Account RA on A.accid = RA.accid\n"
                    + "INNER JOIN [Role] R ON R.rid = RA.rid\n"
                    + "WHERE A.username = ? AND A.[password] = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                Role r = new Role();
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                r.setName(rs.getString("rname"));
                a.setDisplayName(rs.getString("displayname"));
                a.setRoles(r);
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Student getAccountStudent(Account account) {

        try {
            String sql = "SELECT A.username, A.[password], A.displayname, S.Student_ID FROM Account A \n"
                    + "\n"
                    + "inner join Student s on a.accid = s.accid\n"
                    + "WHERE A.username = ? AND A.[password] = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getPassword());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();

                s.setId(rs.getInt("Student_ID"));

                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Lecturer getAccountLecturer(Account account) {

        try {
            String sql = "SELECT A.username, A.[password], A.displayname, L.Lecturer_ID FROM Account A \n"
                    + "\n"
                    + "INNER JOIN Lecturer L ON L.accid = A.accid\n"
                    + "WHERE A.username = ? AND A.[password] = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getPassword());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
               Lecturer l = new Lecturer();
               l.setLid(rs.getInt("Lecturer_ID"));
               return l;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
