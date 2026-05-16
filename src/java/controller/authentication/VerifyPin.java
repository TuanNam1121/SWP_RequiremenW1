/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authentication;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class VerifyPin extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyPin</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyPin at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("VerifyPin.jsp");
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String inputPin = request.getParameter("pin");
        HttpSession session = request.getSession();
        
        String sysPin = (String) session.getAttribute("sysPin");
        Long expiryTime = (Long) session.getAttribute("pinExpiryTime");
        
        if (sysPin == null || expiryTime == null) {
            response.sendRedirect("forgot-password.jsp");
            return;
        }
        
        if (System.currentTimeMillis() > expiryTime) {
            request.setAttribute("error", "Your PIN has expired. Please request a new one.");
            session.removeAttribute("sysPin");
            session.removeAttribute("pinExpiryTime");
            request.getRequestDispatcher("verify-pin.jsp").forward(request, response);
            return;
        }
        
        if (sysPin.equals(inputPin)) {
            session.removeAttribute("resetPin"); 
            response.sendRedirect("ChangePassFromLogin.jsp");
        } else {
            request.setAttribute("error", "The PIN is incorrect.");
            request.getRequestDispatcher("verifypin.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
