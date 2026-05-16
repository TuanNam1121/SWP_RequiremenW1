<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset password</title>
        <link rel="stylesheet" href="assests/Forget.css">
    </head>

    <body>
        <div class="page-wrapper">
            <div class="left-section">
                <div class="logo-box">LOGO</div>
                <div class="photo-placeholder">Photo</div>
            </div>

            <div class="right-section">
                <div class="login-card">
                    <h1 class="signin-title">Reset your password</h1>
                    <p class="register-text">If the account exists, we will email you code to reset the password.</p>

                    <form action="forgetpassword" method="POST">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" name="username" class="input-field" required/>
                        </div>
                        
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" name="email" class="input-field" required/>
                        </div>

                        <c:if test="${not empty error}">
                            <p style="color: red; margin-bottom: 15px; font-size: 0.9rem;">${error}</p>
                        </c:if>

                        <button type="submit" class="login-btn">Send request</button>

                        <a href="login" class="forgot-pass">Return to Sign in</a>
                        
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
