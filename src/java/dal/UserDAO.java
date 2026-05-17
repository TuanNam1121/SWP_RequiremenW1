/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import model.User;
import org.mindrot.bcrypt.BCrypt;
import utils.HashPassword;

/**
 *
 * @author Admin
 */
public class UserDAO {

    private RoleDAO role = new RoleDAO();

    public List<User> getAllUsers() {
        String sql = "Select * from user";
        List<User> list = new ArrayList<>();
        try (Connection conn = DBContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User i = mapResultSetToUser(rs);
                list.add(i);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public User getUserFromId(int userId) {
        String sql = "Select * from user where userid = ?";
        try (Connection conn = DBContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User i = mapResultSetToUser(rs);
                return i;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public User checkLogin(String username, String password) {
        String sql = "Select * from user where username = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                String hashedPassword = rs.getString("passwordhash");
                if (BCrypt.checkpw(password, hashedPassword)) {
                    User i = mapResultSetToUser(rs);
                    return i;
                }

            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public User mapResultSetToUser(ResultSet rs) throws SQLException {
        User i = new User();
        i.setId(rs.getInt("userid"));
        i.setUserName(rs.getString("username"));
        i.setPhone(rs.getString("phone"));
        i.setGender(rs.getString("gender"));
        i.setEmail(rs.getString("email"));
        i.setFullName(rs.getString("fullname"));
        i.setIsActive(rs.getBoolean("isActive"));

        RoleDAO roleDao = new RoleDAO();
        if (roleDao != null) {
            i.setRole(roleDao.getRoleNameFromUserID(i.getId()));
        }

        return i;
    }

    public boolean addNewUser(User user) {
        String sql = "Insert into user(username, passwordhash, roleid, phone, email, gender, fullname, isActive)"
                + "values (?,?,?,?,?,?,?,?)";
        try (Connection conn = DBContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, HashPassword.hashPassword(user.getPassword()));
            ps.setInt(3, role.getRoleIdFromRoleName(user.getRole()));
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getGender());
            ps.setString(7, user.getFullName());
            ps.setBoolean(8, true);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public boolean updateUserInformation(User user) {
        String sql = "Update User SET username = ?, roleid = ? , phone = ?, email = ?, gender = ?, fullname = ?, isActive = ? where userid = ?";
        try (Connection conn = DBContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setInt(2, role.getRoleIdFromRoleName(user.getRole()));
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getFullName());
            ps.setBoolean(7, user.isIsActive());
            ps.setInt(8, user.getId());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public boolean updateUserPassword(int userID, String newHashedPassword) {
        String sql = "Update User SET passwordhash = ? where userid = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setString(1, newHashedPassword);
            ps.setInt(2, userID);

            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {

        }
        return false;
    }

    public String getPasswordById(int userId) {
        String sql = "SELECT passwordhash FROM User WHERE userid = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("passwordhash");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public User getUser(String username, String email) {
        String sql = "select userid, username, email from user where email = ? and username = ?";
        try (
                Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setString(1, email);
            ps.setString(2, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("userid"));
                    user.setUserName(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    return user;
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        UserDAO user = new UserDAO();

        List<User> list = user.getAllUsers();
        for (User i : list) {
            System.out.println(i.toString());
        }

        System.out.println(user.getUserFromId(2));
    }
}
