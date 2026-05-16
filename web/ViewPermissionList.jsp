<%-- 
    Document   : ViewPermissionList
    Created on : May 15, 2026, 5:17:45 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assests/AdminDashBoard.css">
        <title>JSP Page</title>
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
                    <a href="ViewUserList" class="menu-item">
                        User Management
                    </a>
                    <a href="ViewRoleList" class="menu-item">
                        Role Management
                    </a>
                    <a href="ViewPermissionList" class="menu-item active">
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

                    <h2>Permission List</h2>

                    <table>
                        
                        <a class="menu-item" href="PermissionDetail?action=new">Create new permission</a>
                        
                        <thead>
                            <tr>
                                <th>Permission ID</th>
                                <th>Permission name</th>
                                <th>Description</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>

                            <!-- JSTL LOOP -->
                            <c:forEach items="${permissions}" var="p">

                                <tr>
                                    <td>${p.permissionId}</td>
                                    <td>${p.permissionName}</td>
                                    <td></td>
                                    <td><a href="PermissionDetail?action=edit&permissionId=${p.permissionId}">Edit</a></td>
                                </tr>
                            </c:forEach>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>
    </body>
</html>
