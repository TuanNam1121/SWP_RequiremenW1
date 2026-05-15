<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Role Management</title>
        <link rel="stylesheet" href="assests/ViewRoleList.css">
    </head>
    <body>

        <div class="wrapper">

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
                    <a href="ViewRoleList" class="menu-item active">
                        Role Management
                    </a>
                </div>
            </div>

            <div class="main-content">

                <div class="topbar">
                    <div class="admin-box">
                        <div class="avatar"></div>
                        <span>admin</span>
                    </div>
                </div>

                <div class="table-container">

                    <div class="table-header">

                        <h2>Role List</h2>

                        <div class="header-actions">
                            <input type="text" class="search-input" placeholder="Search role by name">

                            <button class="add-btn">
                                <a href="${pageContext.request.contextPath}/AddNewRole">Add new role</a>
                            </button>
                        </div>

                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>RoleId</th>
                                <th>RoleName</th>
                                <th>Status(Activated)</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${rolelist}" var="r">
                                <tr>
                                    <td>${r.roleId}</td>
                                    <td>${r.roleName}</td>
                                    <td>
                                        <input type="checkbox"
                                               ${r.isActive ? 'checked' : ''}>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/UpdateRole?id=${r.roleId}">
                                            <u>Edit</u>
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