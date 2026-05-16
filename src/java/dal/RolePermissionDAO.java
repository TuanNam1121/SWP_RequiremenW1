
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Permission;
import model.Role;
import model.RolePermission;

public class RolePermissionDAO {
    PreparedStatement st;
    ResultSet rs;

    public RolePermissionDAO() {
    }
    

    public List<RolePermission> getAllRolePermission() {
        String sql = "select * from role_permissions";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            List<RolePermission> result = new ArrayList<>();
            while (rs.next()) {
                RolePermission i = mapResultSetToRequest(rs);
                result.add(i);
            }
            return result;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }
    
    public void insertRolePermission(int permissionId, int roleId) {
        try {Connection conn = DBContext.getConnection();
            String sql = "insert into role_permissions (role_id, permission_id) values (?,?)";
            st = conn.prepareStatement(sql);
            st.setInt(1, roleId);
            st.setInt(2, permissionId);
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }
    
    public void deleteRolePermission(Permission p) {
        try {Connection conn = DBContext.getConnection();
            String sql = "DELETE FROM role_permissions WHERE permission_id = ?";
            st = conn.prepareStatement(sql);
            st.setInt(1, p.getPermissionId());
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }
    
    public void deletePermissionRole(Role r) {
        try {Connection conn = DBContext.getConnection();
            String sql = "DELETE FROM role_permissions WHERE role_id = ?";
            st = conn.prepareStatement(sql);
            st.setInt(1, r.getRoleId());
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }
    
    public List<Permission> getPermissionByRole(int roleId) {

        String sql =  """
                 SELECT *
                 FROM permissions p
                 JOIN role_permissions rp
                     ON rp.permission_id = p.permission_id
                 WHERE rp.role_id = ?
                 """;

        try (
                Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, roleId);
            ResultSet rs = ps.executeQuery();
            List<Permission> result = new ArrayList<>();

            while (rs.next()) {
                int permissionId = rs.getInt("permission_id");
                String permissionName = rs.getString("permission_name");
                Permission r = new Permission(permissionId, permissionName);
                result.add(r);
            }

            return result;

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return null;
    }

    public List<Role> getRoleByPermission(Permission p) {

        String sql = """
                 SELECT *
                 FROM roles r
                 JOIN role_permissions rp
                     ON rp.role_id = r.role_id
                 WHERE rp.permission_id = ?
                 """;

        try (
                Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, p.getPermissionId());
            ResultSet rs = ps.executeQuery();
            List<Role> result = new ArrayList<>();

            while (rs.next()) {
                int roleId = rs.getInt("role_id");
                String roleName = rs.getString("role_name");
//                boolean isActive = rs.getBoolean("is_active");
                Role r = new Role(roleId, roleName, true);
                result.add(r);
            }

            return result;

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return null;
    }

    private RolePermission mapResultSetToRequest(ResultSet rs) throws SQLException {
        RolePermission i = new RolePermission();
        i.setPermissionId(rs.getInt("role_id"));
        i.setRoleId(rs.getInt("permission_id"));
        return i;
    }

    public static void main(String[] args) {
        RolePermissionDAO dao = new RolePermissionDAO();
        List<RolePermission> list = dao.getAllRolePermission();
        for (RolePermission i : list) {
            System.out.println(i.toString());
        }
    }
}
