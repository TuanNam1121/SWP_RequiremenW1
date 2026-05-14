/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Request;

/**
 *
 * @author Admin
 */
public class RequestDAO {
    public List<Request> getAllRequest(){
        String sql = "select * from requests";
        
        try(Connection conn = DBContext.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql); 
             ResultSet rs = ps.executeQuery()){
            List<Request> result = new ArrayList<>();
            while(rs.next()){
                Request i = mapResultSetToRequest(rs);
                result.add(i);
            }
            return result;
        } catch(SQLException ex){
            System.err.println(ex.getMessage());
        }
        return null;
    }
    
    private Request mapResultSetToRequest(ResultSet rs) throws SQLException{
        Request i = new Request();
        i.setRequestId(rs.getInt("request_id"));
        i.setUserId(rs.getInt("user_id"));
        i.setStatus(rs.getString("status"));
        i.setMessage(rs.getString("message"));
        Timestamp createdAt = rs.getTimestamp("created_at");
        DateTimeFormatter format = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy");
        i.setCreatedAt(createdAt.toLocalDateTime().format(format));
        return i;
    }
    
    public static void main(String[] args) {
        RequestDAO dao = new RequestDAO();
        List<Request> list = dao.getAllRequest();
        for(Request i : list){
            System.out.println(i.toString());
        }
    }
}
