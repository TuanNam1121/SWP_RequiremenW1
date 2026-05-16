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
                    <h1 class="signin-title">Enter pin</h1>

                    <form action="verifypin" method="post">
                        <div class="form-group">
                            <label>Enter the pin</label>
                            <input type="text" name="pin" class="input-field" required/>
                        </div>

                        <c:if test="${not empty error}">
                            <p style="color: red; margin-bottom: 15px; font-size: 0.9rem;">${error}</p>
                        </c:if>

                        <button type="submit" class="login-btn">Verify</button>

                        <a href="login" class="forgot-pass">Return to Sign in</a>
                        
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
