/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.SessionDBcontext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import model.Room;
import model.Session;
import unity.DateTimeTool;

/**
 *
 * @author Hoàng
 */
public class TimeTableController extends HttpServlet {

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
        int stid;
        stid = Integer.parseInt(request.getParameter("stid"));
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        if (raw_from == null || raw_from.length() == 0) {
            Date today = new Date();
            int todayOfWeek = DateTimeTool.getDayofWeek(today);
            Date e_from = DateTimeTool.addDays(today, 2 - todayOfWeek);
            Date e_to = DateTimeTool.addDays(today, 8 - todayOfWeek);
            from = DateTimeTool.toDateSql(e_from);
            to = DateTimeTool.toDateSql(e_to);
        } else {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);
        }
       ArrayList<Integer> slot = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            slot.add(i);
        }
        request.setAttribute("slot", slot);
       request.setAttribute("from", from);
       request.setAttribute("to", to);
       request.setAttribute("dates", DateTimeTool.getDateList(from, to));
       
       SessionDBcontext sb = new SessionDBcontext();
       ArrayList<Session> sessions = sb.getListSession(stid, from, to);
       request.setAttribute("sessions", sessions);
//        for (Session session : sessions) {
//            response.getWriter().println(session.getSesId());
//            response.getWriter().println(session.getGroup().getGname());
//            
//        }
       
//       response.getWriter().println(stid);
//       response.getWriter().println(from);
//       response.getWriter().println(to);
       
       request.getRequestDispatcher("/Fap/Sheme.jsp").forward(request, response);
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
