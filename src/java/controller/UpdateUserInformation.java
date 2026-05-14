/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.RoleDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Role;
import model.User;

/**
 *
 * @author Admin
 */
public class UpdateUserInformation extends HttpServlet {
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        try{
            int id = Integer.parseInt(id_raw);
            UserDAO userDao = new UserDAO();
            RoleDAO roleDao = new RoleDAO();
            List<Role> list = roleDao.getAllRoleToAssign();
            User user = userDao.getUserFromId(id);
            request.setAttribute("u", user);
            request.setAttribute("rolelist", list);
            request.getRequestDispatcher("UserDetail.jsp").forward(request, response);
        }catch(NumberFormatException ex){
            String message = ex.getMessage();
            request.setAttribute("error", message);
            request.getRequestDispatcher("ViewUserList.jsp").forward(request, response);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        UserDAO user = new UserDAO();
        String id_raw = request.getParameter("id");
        String userName = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        try{
            User i = new User(Integer.parseInt(id_raw), userName, fullname, role, role, email, gender, true);
            if(user.updateUserInformation(i)) response.sendRedirect("ViewUserList");
            else{
                String message = "Đã xảy ra lỗi !";
                request.setAttribute("error", message);
                request.getRequestDispatcher("UserDetail.jsp").forward(request, response);
            }
        }catch(NumberFormatException ex){
            String message = "Đã xảy ra lỗi !" + ex.getMessage();
            request.setAttribute("error", message);
            request.getRequestDispatcher("UserDetail.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
