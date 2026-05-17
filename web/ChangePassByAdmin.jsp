<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password</title>
        <link rel="stylesheet" href="assests/ChangePassByAdmin.css">
    </head>
    
    <body>
        <div class="container">

            <!-- Sidebar -->
            <div class="sidebar">

                <div class="logo-box">
                    Logo
                </div>

                <hr>

                <div class="menu">

                    <a href="AdminDashBoard" class="menu-item">
                        Home
                    </a>
                    <br>
                    <a href="ViewUserList" class="menu-item">
                        User Management
                    </a>
                    <br>
                    <a href="ViewRoleList" class="menu-item">
                        Role Management
                    </a>
                    
                    <a href="ViewPermissionList" class="menu-item">
                        Permission Management
                    </a>

                </div>

            </div>

            <!-- Main Content -->
            <div class="main-content">

                <!-- Top Bar -->
                <div class="topbar">

                    <div class="admin-box">
                        <div class="avatar"></div>
                        <span>admin</span>
                    </div>

                </div>

                <!-- Content -->
                <div class="content-box">
                    <h2>change password</h2>

                    <form action="changepassbyadmin" method="POST" class="form-container">

                        <div class="input-group">
                            <label>UserId: ${userId}</label>
                            <input type="hidden" name="userId" value="${userId}">
                        </div>

                        <div class="input-group">
                            <label>New password</label>
                            <input type="password" name="newPass" required>
                        </div>

                        <div class="input-group">
                            <label>Confirm password</label>
                            <input type="password" name="cfNewPass" required>
                        </div>

                        <c:if test="${not empty message}">
                            <div style="color: #28a745; margin-bottom: 15px; font-size: 0.9rem; font-weight: 500;">${message}</div>
                        </c:if>

                        <div class="btn-wrapper">
                            <button type="submit" class="btn-confirm">Confirm</button>
                        </div>

                    </form>
                </div>

            </div>

        </div>
    </body>
</html>