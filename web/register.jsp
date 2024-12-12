<%-- 
    Document   : register
    Created on : Jun 3, 2024, 4:49:45 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/material-design-iconic-font.min.css"/>
        <link rel="stylesheet" href="./assets/css/style1.css">
    </head>
    <body>
        <div class="main">
            <section id="signup" style="margin-bottom: 0;display: block;">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Đăng kí</h2>
                        <form action="signup" class="register-form" id="register-form">
                            <h4 style="color: red;">${requestScope.error}</h4>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Họ và tên"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Email"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-phone"></i></label>
                                <input type="tel" name="phone" id="email" placeholder="Số điện thoại"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-pin-drop"></i></label>
                                <input type="text" name="address" id="email" placeholder="Địa chỉ"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="username" id="username" placeholder="Tên đăng nhập"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Mật khẩu"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Nhập lại mật khẩu"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" style="display: block;margin-bottom: 0;" class="form-submit" value="Đăng kí"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="assets/images/980x871.png" alt="sing up image"></figure>
                        <a href="login.jsp" class="signup-image-link" >Tôi đã có tài khoản</a>
                    </div>
                </div>
            </div>
        </section>
        </div>
        
    </body>
</html>
