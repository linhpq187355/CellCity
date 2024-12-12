<%-- 
    Document   : login
    Created on : May 31, 2024, 9:13:44 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" href="./assets/css/style1.css">
    </head>
    <body>
        <div class="main">


        <!-- Sing in  Form -->
        <section id="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="assets/images/pngimg.com - iphone_12_PNG23.png" alt="sing up image"></figure>
                        <a href="register.jsp" class="signup-image-link" >Tạo tài khoản</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Đăng nhập</h2>
                        <form action="signin" method="post" class="register-form" id="login-form">
                            <input type="hidden" name="directt" value="${requestScope.direct}"/>
                            <h4 style="color: red;">${requestScope.error}</h4>
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="your_name" id="your_name" placeholder="Tên đăng nhập" value="${cookie.user.value}"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="your_pass" id="your_pass" placeholder="Mật khẩu" value="${cookie.pass.value}"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" value="on"
                                       ${(cookie.rem.value eq 'on')?"checked":"" }
                                       />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Đăng nhập"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    </body>
</html>
