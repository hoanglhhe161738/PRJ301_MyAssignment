/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Student;

import dal.AttendanceDBcontext;
import dal.SesDBcontext;
import dal.SessionDBcontext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import model.Attendance;
import model.Session;
import unity.DateTimeTool;

/**
 *
 * @author Hoàng
 */
public class StaticAttendanceController extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));
        int gid = Integer.parseInt(request.getParameter("gid"));
        ArrayList<Integer> slot = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            slot.add(i);
        }
        request.getSession().setAttribute("slot", slot);
        SesDBcontext sb = new SesDBcontext();
        ArrayList<Session> sessions = sb.getSession(id, gid);
        AttendanceDBcontext adb = new AttendanceDBcontext();

        ArrayList<Attendance> list = new ArrayList<>();

        int count = 0;

        for (Session session : sessions) {
            Attendance a = new Attendance();
            a.setSessions(session);
            boolean b = adb.Attendance(id, session.getSesId());
            a.setAttendance(b);
            session.setAtt(b);
            list.add(a);
            count++;
            //response.getWriter().println("ses " +session.getSesId());
            //response.getWriter().println("slot name " +session.getSlot().getSlname());
            //response.getWriter().println("att" + b);
        }
        //response.getWriter().println(id +" " + gid);
        request.getSession().setAttribute("count", count);
        request.getSession().setAttribute("sessions", sessions);
        request.getSession().setAttribute("Attandance", list);

        request.getRequestDispatcher("/Fap/Student/AttandanceStatic.jsp").forward(request, response);
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
        processRequest(request, response);
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
