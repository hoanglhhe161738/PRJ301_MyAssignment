/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Student;

import dal.AttendanceDBcontext;
import dal.StudentDBcontext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Attendance;


/**
 *
 * @author Hoàng
 */
public class GroupController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sesid = Integer.parseInt(request.getParameter("sesid"));
        StudentDBcontext sdb = new StudentDBcontext();
        ArrayList<Attendance> listStudent = sdb.getListStudent(sesid);
        
        request.getSession().setAttribute("listStudent", listStudent);
        
        request.getRequestDispatcher("/Fap/Student/Group.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AttendanceDBcontext adb = new AttendanceDBcontext();
        
        ArrayList<Attendance> listStudent = (ArrayList<Attendance>) request.getSession().getAttribute("listStudent");
        for (Attendance attendance : listStudent) {
            int stid = attendance.getStudents().getId();
            int sesid = attendance.getSessions().getSesId();
            
            String name = attendance.getStudents().getName();
            String id = String.valueOf(attendance.getStudents().getId());
            String comment = request.getParameter(id);
            String a = request.getParameter(name);
            boolean b = false;
            if(a.equals("1")){
                b = true;
            }
            
            adb.update(attendance, sesid, stid, b, comment);
        }
        response.sendRedirect("/MyFap/Fap/Lecturer/Home.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
