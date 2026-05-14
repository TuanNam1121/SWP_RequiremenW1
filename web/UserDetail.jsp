<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add New User</title>
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
                    <p>Home</p>
                    <p class="active">User Management</p>
                    <p>Role Management</p>
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

                    <h2>${act.equals("new") ? "Add New User" : "Update User Information"}</h2>

                    <form action="${act.equals("new") ? "AddNewUser" : "UpdateUserInformation"}" method="post">
                        <input type="hidden" name="id" value="${u.id != null ? u.id : ''}">
                        <div class="form-grid">

                            <!-- Left -->
                            <div class="form-left">

                                <label>UserName</label>
                                <input type="text" name="username" value="${u.userName != null ? u.userName : ''}">

                                <label>FullName</label>
                                <input type="text" name="fullname" value="${u.fullName != null ? u.fullName : ''}">

                                <label>Password</label>
                                <input type="password" name="password" value="${u.password != null ? u.password : ''}">

                                <label>Role</label>
                                <c:forEach items="${rolelist}" var="i">
                                    <input type="radio" name="role" value="${i.roleName}" ${u.role == i.roleName ? 'checked' : ''}> <span>${i.roleName}</span>
                                </c:forEach>

                            </div>

                            <!-- Right -->
                            <div class="form-right">

                                <label>Phone</label>
                                <input type="text" name="phone" value="${u.phone != null ? u.phone : ''}">

                                <label>Email</label>
                                <input type="email" name="email" value="${u.email != null ? u.email : ''}">

                                <div class="gender-group">
                                    <span>Gender :</span>

                                    <label>
                                        <input type="radio" name="gender" value="Male"  ${u.gender == 'Male' ? 'checked' : ''}>
                                        Male
                                    </label>

                                    <label>
                                        <input type="radio" name="gender" value="Female" ${u.gender == 'Female' ? 'checked' : ''}>
                                        Female
                                    </label>

                                    <label>
                                        <input type="radio" name="gender" value="Other" ${u.gender == 'Other' ? 'checked' : ''}>
                                        Other
                                    </label>
                                </div>
                                        
                                <label>Account Status</label>
                                <div class="status-group">
                                    <input type="checkbox" name="active" value="true" ${u.isActive ? 'checked' : ''}>
                                    <span>Active User</span>
                                </div>

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