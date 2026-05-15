<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body, html {
                height: 100%;
                font-family: 'Inter', sans-serif;
                background-color: #fff;
                overflow: hidden;
            }

            .page-wrapper {
                display: flex;
                width: 100vw;
                height: 100vh;
            }

            /* --- BÊN TRÁI: GIỮ NGUYÊN --- */
            .left-section {
                flex: 1.2;
                padding: 60px;
                display: flex;
                flex-direction: column;
                position: relative;
            }

            .logo-box {
                font-weight: 700;
                font-size: 1.5rem;
                border: 2.5px solid #333;
                padding: 10px 25px;
                width: fit-content;
                border-radius: 12px;
                text-transform: uppercase;
            }

            .photo-placeholder {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-size: 2.5rem;
                color: #e0e0e0;
                font-weight: 600;
            }

            /* --- BÊN PHẢI: THU NHỎ VÀ ĐÓNG KHUNG --- */
            .right-section {
                flex: 0.8; /* Cho bên phải hẹp hơn bên trái một chút */
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #fafafa; /* Màu nền nhẹ để nổi bật cái khung */
            }

            .login-card {
                background: #ffffff;
                width: 100%;
                max-width: 400px; /* Giới hạn độ rộng khung */
                padding: 40px;
                border: 1px solid #e0e0e0; /* Đóng khung mảnh */
                border-radius: 20px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.03); /* Đổ bóng cực nhẹ cho sang */
            }

            .signin-title {
                font-size: 2.5rem;
                font-weight: 700;
                margin-bottom: 10px;
            }

            .register-text {
                font-size: 0.95rem;
                color: #666;
                margin-bottom: 30px;
            }

            .register-text a {
                color: #0066ff;
                text-decoration: none;
                font-weight: 600;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                font-size: 0.9rem;
                font-weight: 600;
                margin-bottom: 8px;
            }

            .input-field {
                width: 100%;
                padding: 15px;
                border: none;
                background-color: #edf2ff;
                border-radius: 10px;
                font-size: 1rem;
                outline: none;
            }

            .options-row {
                display: flex;
                align-items: center;
                margin-bottom: 25px;
                font-size: 0.9rem;
            }

            .options-row input {
                margin-right: 10px;
            }

            .login-btn {
                width: 100%;
                background-color: #c9f2c9;
                border: 1.5px solid #333;
                padding: 15px;
                border-radius: 12px;
                font-weight: 700;
                font-size: 1.1rem;
                cursor: pointer;
                margin-bottom: 15px;
            }

            .forgot-pass {
                text-align: right;
                display: block;
                font-size: 0.9rem;
                color: #0066ff;
                text-decoration: none;
            }
        </style>
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