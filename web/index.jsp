<%-- 
    Document   : index.jsp
    Created on : 13 May 2026, 22:04:40
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>
            <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
        <div>
            <!-- Sau khi đã đăng nhập thành công nhé -->
            <a href="${pageContext.request.contextPath}/AdminDashBoard">AdminDashBoard</a>
        </div>

        <div>
            <a href="home">Home</a>
        </div>
    </body>
</html>
