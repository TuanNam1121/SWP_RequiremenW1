package controller;

import dal.RoleDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Role;

/**
 * Servlet for handling the Role Management View
 */
@WebServlet(name = "ViewRoleList", urlPatterns = {"/ViewRoleList"})
public class ViewRoleList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RoleDAO roleDAO = new RoleDAO();
        List<Role> roleList = roleDAO.getAllRole();
        request.setAttribute("rolelist", roleList);
        request.getRequestDispatcher("ViewRoleList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
