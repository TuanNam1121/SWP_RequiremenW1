<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account Info</title>
        <link rel="stylesheet" href="assests/ViewProfile.css">
    </head>
    <body>

        <div class="container">
            <header class="header">
                <div class="logo">logo</div>
                <div class="greeting">Xin chào ${sessionScope.user.fullName}</div>
            </header>

            <div class="main-body">

                <aside class="sidebar">
                    <a href="#" class="menu-item">Overview</a>
                    <a href="#" class="menu-item active">account info</a>
                    <a href="#" class="menu-item">change password</a>
                </aside>

                <main class="content">
                    <div class="info-grid">

                        <div class="info-col">
                            <div class="info-row">
                                <span class="label">UserName</span>
                                <span class="value">${sessionScope.user.userName}</span>
                            </div>
                            <div class="info-row">
                                <span class="label">FullName</span>
                                <span class="value">${sessionScope.user.fullName}</span>
                            </div>

                            <div class="info-row">
                                <span class="label">Role</span>
                                <span class="value">${sessionScope.user.role}</span>
                            </div>

                            <a href="${pageContext.request.contextPath}/logout" class="btn-signout">Sign out</a>
                        </div>

                        <div class="info-col">
                            <div class="info-row">
                                <span class="label">Phone</span>
                                <span class="value">${sessionScope.user.phone}</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Email</span>
                                <span class="value">${sessionScope.user.email}</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Gender :</span>
                                <span class="value">${sessionScope.user.gender}</span>
                            </div>
                        </div>

                    </div>
                </main>

            </div>
        </div>

    </body>
</html>