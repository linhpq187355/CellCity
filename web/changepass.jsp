<%-- 
    Document   : changepass
    Created on : Jun 12, 2024, 12:08:43 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đổi mật khẩu</title>
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
                            <h2 class="form-title">Đổi mật khẩu</h2>
                            <c:if test="${requestScope.ok == null}">
                                <form action="changepass" class="register-form" id="register-form">
                                    <h4 style="color: red;">${requestScope.error}</h4>
                                    <div class="form-group">
                                        <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                        <input type="password" name="old_pass" id="pass" placeholder="Nhập mật khẩu cũ"/>
                                    </div>
                                    <div class="form-group form-button">
                                        <input type="submit" name="signup" id="signup" style="display: block;margin-bottom: 0;" class="form-submit" value="Confirm"/>
                                    </div>
                                </form>
                            </c:if>
                            <c:if test="${requestScope.ok != null}">
                                <form action="changepass" method="post" class="register-form" id="register-form">
                                    <h4 style="color: red;">${requestScope.matcherror}</h4>
                                    <div class="form-group">
                                        <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                        <input type="password" name="new_pass" id="pass" placeholder="Nhập mật khẩu mới"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                        <input type="password" name="re_pass" id="re_pass" placeholder="Nhập lại mật khẩu"/>
                                    </div>
                                    <div class="form-group form-button">
                                        <input type="submit" name="signup" id="signup" style="display: block;margin-bottom: 0;" class="form-submit" value="Submit"/>
                                    </div>
                                </form>
                            </c:if>

                        </div>
                        <div class="signup-image">
                            <figure><img src="assets/images/pngimg.com - iphone_12_PNG23.png" alt="sing up image"></figure>
                        </div>
                    </div>
                </div>
            </section>
        </div>

    </body>
</html>
