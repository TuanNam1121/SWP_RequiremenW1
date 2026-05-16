/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authentication;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import service.ForgetSer;

public class ForgetPassword extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgetPassword</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgetPassword at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("forget.jsp");
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();
        
        //kiểm tra email tồn tại
        if (!dao.checkEmailExist(email)) {
            request.setAttribute("error", "Email is not existed! Please try again!");
            request.getRequestDispatcher("forget.jsp").forward(request, response);
            return;
        }
        
        //nếu email tồn tại
        //send request to admin
        
        //tạo mã pin và gửi email
        Random rnd = new Random();
        String pin = String.format("%06d", rnd.nextInt(999999));
        long expiryTime = System.currentTimeMillis() + (60 * 1000);         //mã tồn tại trong 1p
        
        HttpSession session = request.getSession();
        session.setAttribute("resetEmail", email);
        session.setAttribute("sysPin", pin);
        session.setAttribute("pinExpiryTime", expiryTime);
        
        boolean isEmailSent = ForgetSer.sendEmail(email, pin);

        if (isEmailSent) {
            response.sendRedirect("VerifyPin.jsp");
        } else {
            request.setAttribute("error", "Lỗi khi gửi email, vui lòng thử lại.");
            request.getRequestDispatcher("forget.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
