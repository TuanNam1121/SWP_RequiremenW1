/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import org.mindrot.bcrypt.BCrypt;

/**
 *
 * @author Admin
 */
public class HashPassword {

    public static String hashPassword(String password) {
        if (password == null) {
            return null;
        }
        return BCrypt.hashpw(password, BCrypt.gensalt(5));
    }

    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null) {
            return false;
        }
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }

    public static void main(String[] args) {
        System.out.println(HashPassword.hashPassword("Nam"));
        String a = HashPassword.hashPassword("Nam");
        if (HashPassword.checkPassword("Nam", a)) {
            System.out.println("Không hiểu sao có thể có quả thuật toán ảo như này");
        }
    }   
}
