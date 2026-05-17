<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="overview" scope="request" />
<c:set var="displayName" value="${empty sessionScope.user.fullName ? 'user' : sessionScope.user.fullName}" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assests/css/homepage.css" rel="stylesheet">
</head>
<body>
<div class="app-shell">
    <jsp:include page="common/navigationBar.jsp" />
    <main class="main-content">
        <header class="topbar">
            <form class="search-form" action="${pageContext.request.contextPath}/search" method="get">
                <input class="form-control" type="search" name="keyword" value="${param.keyword}" placeholder="Searchbar">
            </form>

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

        <section class="dashboard-panel">
            <div class="section-heading">
                <h1>Kết quả kinh doanh</h1>
                <span>Homepage</span>
            </div>

            <div class="metrics-grid">
                <article class="metric-card metric-card-wide">
                    <span class="metric-label">Doanh thu thuần</span>
                    <strong>
                        <c:choose>
                            <c:when test="${not empty netRevenue}">
                                <fmt:formatNumber value="${netRevenue}" type="number" />đ
                            </c:when>
                            <c:otherwise>0đ</c:otherwise>
                        </c:choose>
                    </strong>
                </article>

                <article class="metric-card">
                    <span class="metric-label">Tổng đơn</span>
                    <strong>${empty totalOrders ? 0 : totalOrders}</strong>
                </article>

                <article class="metric-card">
                    <span class="metric-label">Chưa thanh toán</span>
                    <strong>${empty unpaidOrders ? 0 : unpaidOrders}</strong>
                </article>

                <article class="metric-card">
                    <span class="metric-label">Giá trị trung bình đơn</span>
                    <strong>
                        <c:choose>
                            <c:when test="${not empty averageOrderValue}">
                                <fmt:formatNumber value="${averageOrderValue}" type="number" />đ
                            </c:when>
                            <c:otherwise>0đ</c:otherwise>
                        </c:choose>
                    </strong>
                </article>

                <article class="metric-card">
                    <span class="metric-label">Số lượng nhập kho</span>
                    <strong>${empty stockInQuantity ? 0 : stockInQuantity}</strong>
                </article>

                <article class="metric-card">
                    <span class="metric-label">Chưa giao</span>
                    <strong>${empty pendingDelivery ? 0 : pendingDelivery}</strong>
                </article>

                <article class="metric-card">
                    <span class="metric-label">Đang giao</span>
                    <strong>${empty delivering ? 0 : delivering}</strong>
                </article>

                <article class="metric-card">
                    <span class="metric-label">Hủy</span>
                    <strong>${empty canceledOrders ? 0 : canceledOrders}</strong>
                </article>
            </div>

            <div class="content-grid">
                <section class="chart-box">
                    <div class="box-title">Biểu đồ doanh thu</div>
                    <c:choose>
                        <c:when test="${not empty revenueChart}">
                            <div class="empty-chart">
                                <c:forEach var="item" items="${revenueChart}">
                                    <span style="height: ${item.percent}%;" title="${item.label}: ${item.value}"></span>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state chart-state">Chưa có dữ liệu biểu đồ</div>
                        </c:otherwise>
                    </c:choose>
                </section>

                <section class="best-seller-box">
                    <div class="box-title">Sản phẩm bán chạy</div>
                    <c:choose>
                        <c:when test="${not empty bestSellingProducts}">
                            <ul class="best-seller-list">
                                <c:forEach var="product" items="${bestSellingProducts}">
                                    <li>
                                        <span>${product.name}</span>
                                        <strong>${product.quantity}</strong>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">Chưa có dữ liệu</div>
                        </c:otherwise>
                    </c:choose>
                </section>
            </div>
        </section>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
