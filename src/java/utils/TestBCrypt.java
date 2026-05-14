/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import org.mindrot.bcrypt.BCrypt;

/**
 *
 * @author tung
 */
public class TestBCrypt {

    public static void main(String[] args) {
        String passwordTho = "123"; // Mật khẩu muốn test
        String salt = BCrypt.gensalt(); // Tạo muối ngẫu nhiên
        String hashed = BCrypt.hashpw(passwordTho, salt); // Băm mật khẩu

        System.out.println("Mật khẩu thô: " + passwordTho);
        System.out.println("Chuỗi đã băm để dán vào MySQL: " + hashed);
    }
}
