<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="displayName" value="${empty sessionScope.user.fullName ? 'user' : sessionScope.user.fullName}" />
<c:set var="profile" value="${empty profile ? sessionScope.user : profile}" />
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assests/css/homepage.css" rel="stylesheet">
</head>
<body>
<main class="profile-content">
    <header class="topbar profile-topbar">
        <div class="topbar-actions">
            <a class="btn btn-outline-primary notification-btn" href="${pageContext.request.contextPath}/home">
                Notification
            </a>
            <div class="dropdown">
                <button class="btn user-menu-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="user-avatar"></span>
                    <span class="user-name">${displayName}</span>
                </button>
                <ul class="dropdown-menu dropdown-menu-end user-dropdown">
                    <li class="dropdown-header">
                        <span class="user-avatar small"></span>
                        <span>${displayName}</span>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/viewprofile">View Profile</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="changePassword">Change Password</a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a class="dropdown-item logout-item" href="logout">LOG OUT</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <section class="profile-panel" aria-labelledby="profileTitle">
        <h1 id="profileTitle" class="visually-hidden">View Profile</h1>
        <div class="profile-grid">
            <div class="profile-field">
                <label>UserName</label>
                <div class="profile-value">${user.userName}</div>
            </div>
            <div class="profile-field">
                <label>Phone</label>
                <div class="profile-value">${user.phone}</div>
            </div>
            <div class="profile-field">
                <label>FullName</label>
                <div class="profile-value">${user.fullName}</div>
            </div>
            <div class="profile-field">
                <label>Email</label>
                <div class="profile-value">${user.email}</div>
            </div>
            <div class="profile-text">
                <span>Role :</span>
                <strong>${user.roleId}</strong>
            </div>
            <div class="profile-text">
                <span>Gender :</span>
                <strong>${user.gender}</strong>
            </div>
        </div>
    </section>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>