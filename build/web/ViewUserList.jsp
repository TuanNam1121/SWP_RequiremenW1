<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User Management</title>

        <link rel="stylesheet"
              href="assests/ViewUserList.css">
    </head>
    <body>

        <div class="wrapper">

            <!-- SIDEBAR -->
            <div class="sidebar">

                <div class="logo-box">
                    Logo
                </div>

                <hr>

                <div class="menu">

                    <a href="AdminDashBoard" class="menu-item">
                        Home
                    </a>

                    <a href="ViewUserList" class="menu-item active">
                        User Management
                    </a>

                    <a href="ViewRoleList" class="menu-item">
                        Role Management
                    </a>
                    
                    <a href="ViewPermissionList" class="menu-item">
                        Permission Management
                    </a>

                </div>

            </div>

            <!-- MAIN -->
            <div class="main-content">

                <!-- TOPBAR -->
                <div class="topbar">

                    <div class="admin-box">

                        <div class="avatar"></div>

                        <span>admin</span>

                    </div>

                </div>

                <!-- USER TABLE -->
                <div class="table-container">

                    <div class="table-header">

                        <h2>User List</h2>

                        <button class="add-btn">
                            <a href="${pageContext.request.contextPath}/AddNewUser">Add new user</a>
                        </button>

                    </div>

                    <table>

                        <thead>
                            <tr>
                                <th>UserId</th>
                                <th>UserName</th>
                                <th>FullName</th>
                                <th>RoleName</th>
                                <th>Gender</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>isActive</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>

                            <!-- JSTL LOOP -->
                            <c:forEach items="${userlist}" var="u">

                                <tr>

                                    <td>${u.id}</td>
                                    <td>${u.userName}</td>
                                    <td>${u.fullName}</td>
                                    <td>${roleDao.getRoleNamFromRoleID(u.roleId)}</td>
                                    <td>${u.gender}</td>
                                    <td>${u.phone}</td>
                                    <td>${u.email}</td>

                                    <td>
                                        <input type="checkbox"
                                               ${u.isActive ? 'checked' : ''}>
                                    </td>

                                    <td>
                                        <a href="${pageContext.request.contextPath}/UpdateUserInformation?id=${u.id}">
                                            <u>Update Information</u>
                                        </a>
                                    </td>

                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </body>
</html>