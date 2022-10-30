/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hoàng
 * @param <T>
 */
public abstract class DBcontext<T> {
    protected Connection connection;

    public DBcontext() {
        try {
            String user = "hoang";
            String password ="123456";
            String url = "jdbc:sqlserver://LAPTOP-3TK878VC\\SQLEXPRESS:1433;databaseName=SE1643_PRJ301";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try {
                connection = DriverManager.getConnection(url, user, password);
            } catch (SQLException ex) {
                Logger.getLogger(DBcontext.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public abstract void insert(T model); //INSERT INTO
    public abstract void update(T model); // UPDATE SET
    public abstract void delete(T model); // DELETE FROM 
    public abstract T get(int id); // SELECT * FROM WHERE id = 
    public abstract ArrayList<T> list(); //override SELECT * FROM
    
}
