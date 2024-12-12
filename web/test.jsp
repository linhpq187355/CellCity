<%-- 
    Document   : test
    Created on : Jun 25, 2024, 11:00:30 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .countdown {
                font-size: 20px;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.rawgit.com/kbwood/countdown/master/dist/jquery.countdown.min.js"></script>
    </head>
    <body>
        <div class="countdown"></div>
        <script>
            $(document).ready(function () {
                // Đặt thời gian đến hạn (ví dụ: 25 tháng 6, 2024 12:00:00)
                var saleEndTime = new Date("2024-06-26T00:00:00");

                // Khởi tạo bộ đếm thời gian
                $('.countdown').countdown({
                    until: saleEndTime,
                    format: 'dHMS',
                    padZeroes: true,
                    onExpiry: function () {
                        alert('The sale has ended!');
                    }
                });
            });
        </script>
    </body>
</html>
