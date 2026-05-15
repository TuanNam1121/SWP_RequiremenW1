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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Permission;

//

public class PermissionDAO extends DBContext{
    Connection connection;
    PreparedStatement st;
    ResultSet rs;

    public PermissionDAO(){
    }
public List<Permission> getAllPermission(){
        String sql = "select * from permissions";
        
        try(Connection conn = DBContext.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql); 
             ResultSet rs = ps.executeQuery()){
            List<Permission> result = new ArrayList<>();
            while(rs.next()){
                int id = rs.getInt("permission_id");
                String name = rs.getString("permission_name");
                Permission p = new Permission(id,name);
                result.add(p);
            }
            return result;
        } catch(SQLException ex){
            System.err.println(ex.getMessage());
        }
        return null;
    }

public boolean includePermission(int roleId, int permission_id){
    
    try {
            String sql = "select * from role_permissions where role_id=? AND permission_id=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, roleId);
            st.setInt(2, permission_id);
            rs = st.executeQuery(); //only select
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
            return false;
        }
}

 public Permission getPermission(int permission_id) {
        try {
            String sql = "select * from permissions where permission_id=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, permission_id);
            rs = st.executeQuery(); //only select
            if (rs.next()) {
                int id = rs.getInt("permission_id");
                String name = rs.getString("permission_name");
                Permission p = new Permission(id,name);

                return p;
            } else {
                return null;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
            return null;
        }
    }

    public void insertPermission(Permission p) {
        try {
            String sql = "insert into permissions (permission_id,permission_name) values (?,?)";
            st = connection.prepareStatement(sql);
            st.setInt(1, p.getPermissionId());
            st.setString(2, p.getPermissionName());
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public void updatePermission(Permission p) {
        try {
            String sql = "UPDATE permissions SET permission_name = ? WHERE permission_id = ?";
            st = connection.prepareStatement(sql);
            st.setInt(2, p.getPermissionId());
            st.setString(1, p.getPermissionName());
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public void deletePermission(Permission p) {
        try {
            String sql = "DELETE FROM permissions WHERE permission_id = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, p.getPermissionId());
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

     public static void main(String[] args) {
        PermissionDAO dao = null;
            dao = new PermissionDAO();
        List<Permission> list = dao.getAllPermission();
        if(list.isEmpty()){
            System.out.println("list empty or error occurred");
        }
        else{
            for (Permission i : list) {
                System.out.println(i.toString());
            }
            
        }
    }
}
