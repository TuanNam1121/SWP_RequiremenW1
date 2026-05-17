<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>

    <center>
        <form action="changePassword" method="post">
            <table>
                <tr>
                    <td colspan="2">
                        <h1>Change password</h1>
                    </td>
                </tr>

                <tr>
                    <td>Current password</td>
                    <td><input type="password" name="currentPass" required /></td>
                </tr>

                <tr>
                    <td>New password</td>
                    <td><input type="password" name="newPass" required /></td>
                </tr>

                <tr>
                    <td>Confirm new password</td>
                    <td><input type="password" name="cfNewPass" required /></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <a href="home" style="text-decoration: none"><input type="button" value="Cancel" />
                        </a>
                        <input type="submit" value="Save" />
                    </td>
                </tr>
            </table>
        </form>
        <c:if test="${not empty error}">
            <p style="color: red">${error}</p>
        </c:if>

        <c:if test="${not empty message}">
            <p style="color: green">${message}</p>
        </c:if>
    </center>


</body>
</html>