<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Role</title>
        <link rel="stylesheet" href="assests/UserDetail.css">
    </head>
    <body>

        <div class="container">

            <!-- Sidebar -->
            <div class="sidebar">

                <div class="logo-box">
                    Logo
                </div>

                <div class="line"></div>

                <div class="menu">
                    <a href="AdminDashBoard" class="menu-item">
                        Home
                    </a>

                    <a href="ViewUserList" class="menu-item">
                        User Management
                    </a>

                    <a class="menu-item">Role Management</a>
                </div>

            </div>

            <!-- Main Content -->
            <div class="main-content">

                <!-- Top Right Admin -->
                <div class="top-bar">
                    <div class="admin-box">
                        <div class="admin-avatar"></div>
                        <span>admin</span>
                    </div>
                </div>

                <!-- Form -->
                <div class="form-container">

                    <h2>Update Role</h2>

                    <form action="UpdateRole" method="post">
                        <!--permission ID-->
                        <input type="hidden" name="id" value="${p != null ? p.permissionId : ''}">
                        <div class="form-grid">

                            <!-- Left -->
                            <div class="form-left">

                                <label>Role id</label>
                                <input type="text" name="roleId" value="${role != null ? role.roleId : ''}" readonly="true">

                                <label>Role name</label>
                                <!---->
                                <input type="text" name="roleName" value="${role != null ? role.roleName : ''}">

                                <label>Status</label><input type="radio" name="isActive" ${role.isActive ? checked : ''}>Activated | <input type="radio" name="isActive" ${role.isActive ? checked : ''}>Deactivated
                                



                            </div>

                            <!-- Right -->
                            <div class="form-right">

                                <table>
                                    <tr>
                                        <td>Permission ID</td>
                                        <td>Permission name</td>
                                        <td>Status(included)</td>
                                    </tr>
                                    <c:forEach items="${permissions}" var="p">
                                        <tr>
                                        <td><input type="text" value="${p.permissionId}" readonly="true"></td>
                                        <td><input type="text" value="${p.permissionName}" readonly="true"></td>

                                            <c:set var="checked" value="false"/>
                                            <!--check if included in list assigned-->
                                            <c:forEach items="${includePermissions}" var="ip">
                                                <c:if test="${ip.permissionId == p.permissionId}">
                                                    <c:set var="checked" value="true"/>
                                                </c:if>
                                            </c:forEach>
                                            
                                                <td><input type="checkbox" name="permission" value="${p.permissionId}" ${checked ? 'checked' : ''}></td>
                                                
                                            </tr>
                                        </c:forEach>
                                    </table>

                                </div>

                            </div>

                            <div class="button-area">
                                <button type="submit">${act.equals("new") ? "CREATE" : "UPDATE"}</button>
                            </div>
                        </form>
                        <c:if test="${error != null}">
                            <p>${error}</p>
                        </c:if>

                        <c:if test="${u != null}">
                            <tr>
                                <td>${u.id}</td>
                                <td>${u.fullName}</td>
                                <td>${u.role}</td>
                                <td>${u.gender}</td>
                                <td>${u.phone}</td>
                                <td>${u.email}</td>
                                <td>
                                    <input type="checkbox"
                                           ${u.isActive ? 'checked' : ''}>
                                </td>
                            </c:if>
                    </div>

                </div>

            </div>

        </body>
    </html>