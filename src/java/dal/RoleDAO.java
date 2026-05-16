/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Role;

/**
 *
 * @author Admin
 */
public class RoleDAO {

    public List<Role> getAllRole() {
        String sql = "select * from roles";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            List<Role> result = new ArrayList<>();
            while (rs.next()) {
                Role i = mapResultSetToRole(rs);
                result.add(i);
            }
            return result;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

    public List<Role> getAllRoleToAssign() {
        String sql = "select * from roles where role_name != 'Admin'";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            List<Role> result = new ArrayList<>();
            while (rs.next()) {
                Role i = mapResultSetToRole(rs);
                result.add(i);
            }
            return result;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

    public String getRoleNameFromUserID(int userId) {
        String sql = "select r.role_name from roles r join users u on u.role_id = r.role_id where u.user_id = ?;";

        try (Connection conn = DBContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("r.role_name");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public String getRoleNamFromRoleID(int id) {
        String sql = "select role_name from roles where role_id = '?'";

        try (Connection conn = DBContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.getString("role_name");
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

    public Integer getRoleIdFromRoleName(String roleName) {
        String sql = "select role_id from roles where role_name = ?";

        try (Connection conn = DBContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, roleName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("role_id");
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

    public Role mapResultSetToRole(ResultSet rs) throws SQLException {
        Role i = new Role();
        i.setRoleId(rs.getInt("role_id"));
        i.setRoleName(rs.getString("role_name"));
        return i;
    }

    //HungTQ added
    public Role getRoleById(int id) {
        String sql = "select * from roles where role_id = ?";
        try (Connection conn = DBContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Role i = mapResultSetToRole(rs);
                return i;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

    //also HungTQ added
    public void updateRole(Role r) {
        try {
            Connection conn = DBContext.getConnection();
            String sql = "UPDATE roles SET role_name = ? WHERE role_id = ?";
            PreparedStatement st;
            ResultSet rs;
            st = conn.prepareStatement(sql);
            st.setString(1, r.getRoleName());
            st.setInt(2, r.getRoleId());
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public static void main(String[] args) {
        RoleDAO dao = new RoleDAO();
        List<Role> res = dao.getAllRole();

        for (Role i : res) {
            System.out.println(i.getRoleId() + " " + i.getRoleName());
        }

        System.out.println(dao.getRoleNameFromUserID(2));
        System.out.println(dao.getRoleIdFromRoleName("STAFF"));
    }
}
