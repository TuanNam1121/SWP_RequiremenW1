<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <div class="page-wrapper">
            <div class="left-section">
                <div class="logo-box">LOGO</div>
                <div class="photo-placeholder">Photo</div>
            </div>

            <div class="right-section">
                <div class="login-card">
                    <h1 class="signin-title">Sign in</h1>
                    <p class="register-text">Do not have account yet? <a href="register">register now</a></p>

                    <c:if test="${not empty error}">
                        <p style="color: red; margin-bottom: 15px; font-size: 0.9rem;">${error}</p>
                    </c:if>

                    <form action="login" method="post">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" name="username" class="input-field" value="${param.username}" placeholder="tung" required/>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" class="input-field" placeholder="•••" required/>
                        </div>

                        <div class="options-row">
                            <input type="checkbox" id="remember" name="remember">
                            <label for="remember">remember me</label>
                        </div>

                        <button type="submit" class="login-btn">Login</button>

                        <a href="forgotPassword" class="forgot-pass">forgot password</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
