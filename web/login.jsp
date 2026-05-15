<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
    <center>
        <form action="login" method="post">
            <h1>Login</h1>
            <table>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" value="${param.username}" placeholder="Username" required/></td>
                </tr>

                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" value="" placeholder="Password" required/></td>
                </tr>

                <tr>
                    <td><input type="submit" value="LOGIN" /></td>
                </tr>

                <tr>
                    <td>
                        <a href="forgotPassword">Forgot password ?</a>
                    </td>    
                </tr>
            </table>

        </form>
        <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
        </c:if>
    </center>
</body>
</html>