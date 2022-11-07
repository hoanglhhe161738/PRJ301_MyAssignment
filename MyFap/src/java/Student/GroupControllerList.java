/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Student;

import dal.GroupDBcontext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Group;
import model.Student;


/**
 *
 * @author Hoàng
 */
public class GroupControllerList extends HttpServlet {

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
        int stid = Integer.parseInt(request.getParameter("id"));
        GroupDBcontext gdb = new GroupDBcontext();
        ArrayList<Group> groups = gdb.getListGroup(stid);
        request.getSession().setAttribute("groups", groups);
        request.getRequestDispatcher("/Fap/Student/ListGroup.jsp").forward(request, response);
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
        String name = request.getParameter("gr");
        //response.getWriter().println(name);
        ArrayList<Group> groups = (ArrayList<Group>) request.getSession().getAttribute("groups");
        Group g = new Group();
        for (Group group : groups) {
            //response.getWriter().println(group.getGname());
            if(group.getGname().equals(name)){
                g = group;
                
            }
        }
        GroupDBcontext gdb = new GroupDBcontext();
        ArrayList<Student> students = gdb.getListStudent(g.getGid());
        request.getSession().setAttribute("students", students);
        request.getRequestDispatcher("/Fap/Student/ListGroup.jsp").forward(request, response);
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
