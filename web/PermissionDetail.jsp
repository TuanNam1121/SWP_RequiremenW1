<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>${act.equals("new") ? "Add New Permission" : "Edit permission"}</title>
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

                    <h2>${act.equals("new") ? "Add New Permission" : "Edit permission"}</h2>

                    <form action="${act.equals("new") ? "AddNewPermission" : "EditPermission"}" method="post">
                        <!--permission ID-->
                        <input type="hidden" name="id" value="${p != null ? p.permissionId : ''}">
                        <div class="form-grid">

                            <!-- Left -->
                            <div class="form-left">

                                <label>Permission name</label>
                                <input type="text" name="permissionName" value="${p != null ? p.permissionName : ''}">

                                <label>Description</label>
                                <!---->
                                <input type="text" name="permissionDescription" value="">




                            </div>

                            <!-- Right -->
                            <div class="form-right">

                                <table>
                                    <tr>
                                        <td>Role</td>
                                        <td>Assign</td>
                                    </tr>
                                    <c:forEach items="${rolelist}" var="r">
                                        <tr>
                                            <td><input type="text" value="${r.roleName}"></td>

                                            <c:set var="checked" value="false"/>
                                            <!--check if included in list assigned-->
                                            <c:forEach items="${roles}" var="rr">
                                                <c:if test="${rr.roleId == r.roleId}">
                                                    <c:set var="checked" value="true"/>
                                                </c:if>
                                            </c:forEach>
                                            
                                                <td><input type="checkbox" name="role" value="${r.roleId}" ${checked ? 'checked' : ''}></td>
                                                
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