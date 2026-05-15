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
import utils.HashPassword;

/**
 *
 * @author Admin
 */
public class UserDAO {

    private RoleDAO role = new RoleDAO();

    public List<User> getAllUsers() {
        String sql = "Select * from users";
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
        String sql = "Select * from users where user_id = ?";
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

    public User mapResultSetToUser(ResultSet rs) throws SQLException {
        User i = new User();
        i.setId(rs.getInt("user_id"));
        i.setUserName(rs.getString("username"));
        i.setRole(role.getRoleNameFromUserID(i.getId()));
        i.setPhone(rs.getString("sdt"));
        i.setGender(rs.getString("gender"));
        i.setEmail(rs.getString("email"));
        i.setFullName(rs.getString("full_name"));
        i.setIsActive(rs.getBoolean("is_active"));
        return i;
    }

    public boolean addNewUser(User user) {
        String sql = "Insert into Users(username, password_hash, role_id, sdt, email, gender, full_name, is_active)"
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
        String sql = "Update Users SET username = ?, role_id = ? , sdt = ?, email = ?, gender = ?, full_name = ?, is_active = ? where user_id = ?";
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
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return false;
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
