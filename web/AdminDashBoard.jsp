<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>

        <!-- Link CSS -->
        <link rel="stylesheet" href="assests/AdminDashBoard.css">
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

                <c:if test="${not empty message}">
                    <div style="color: green; font-weight: bold;">
                        ${message}
                    </div>
                </c:if>
                <!-- Content -->
                <div class="content-box">

                    <h2>Request From Staff</h2>

                    <table>

                        <thead>
                            <tr>
                                <th>User Id</th>
                                <th>Request Type</th>
                                <th>Created At</th>
                                <th>Status</th>
                            </tr>
                        </thead>

                        <tbody>

                            <!-- JSTL LOOP -->
                            <c:forEach items="${requestlist}" var="r">

                                <tr>
                                    <td>${r.userId}</td>
                                    <td>${r.message}</td>
                                    <td>${r.createdAt}</td>
                                    <td>${r.status}</td>
                                    <td>
                                        <c:if test="${r.status == 'NEW'}">
                                            <a href="solverequest?type=${r.message}&userid=${r.userId}">solve</a>
                                        </c:if>

                                        <c:if test="${r.status != 'NEW'}">
                                            <span></span>
                                        </c:if>
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