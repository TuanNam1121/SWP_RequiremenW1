/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class User {
    private int id;
    private String userName;
    private String fullName;
    private String password;
    private String role;
    private String sdt;
    private String email;
    private String gender;
    private boolean isActive;
    
    public User() {
    }
    
    
    public User(int id, String userName, String fullName, String role, String sdt, String email, String gender, boolean isActive) {
        this.id = id;
        this.userName = userName;
        this.fullName = fullName;
        this.role = role;
        this.sdt = sdt;
        this.email = email;
        this.gender = gender;
        this.isActive = isActive;
    }

    public User(String userName, String fullName, String password, String role, String sdt, String email, String gender) {
        this.userName = userName;
        this.fullName = fullName;
        this.password = password;
        this.role = role;
        this.sdt = sdt;
        this.email = email;
        this.gender = gender;
    }
    
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
      

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", userName=" + userName + ", fullName=" + fullName + ", role=" + role + ", sdt=" + sdt + ", email=" + email + ", gender=" + gender + ", isActive=" + isActive + '}';
    }
    
    
    
}
