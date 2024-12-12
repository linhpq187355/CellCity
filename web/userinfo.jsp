<%-- 
    Document   : userinfo
    Created on : Jun 13, 2024, 9:46:48 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin tài khoản</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/vendor.css"/>
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
              rel="stylesheet">
        <meta name="keywords" content="HTML5 Template">
        <meta name="description" content="Molla - Bootstrap eCommerce Template">
        <meta name="author" content="p-themes">
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="images/logobe.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/logobe.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/logobe.png">
        <link rel="manifest" href="assets/images/icons/site.html">
        <link rel="mask-icon" href="assets/images/icons/safari-pinned-tab.svg" color="#666666">
        <link rel="icon" href="path/to/your/favicon.ico" type="image/x-icon">
        <meta name="apple-mobile-web-app-title" content="Molla">
        <meta name="application-name" content="Molla">
        <meta name="msapplication-TileColor" content="#cc9966">
        <meta name="msapplication-config" content="assets/images/icons/browserconfig.xml">
        <meta name="theme-color" content="#ffffff">
        <link rel="stylesheet" href="assets/vendor/line-awesome/line-awesome/line-awesome/css/line-awesome.min.css">
        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/plugins/jquery.countdown.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/skins/skin-demo-4.css">
        <link rel="stylesheet" href="assets/css/demos/demo-4.css">
        <style>
            .dropdown-toggle::after {
                border-top: none;
            }
            .gradient-custom {
                /* fallback for old browsers */
                background: #f6d365;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))
            }
            h6,h5{
                font-weight: bold;
                font-size: 2.5rem;
            }
            p{
                font-size: 2rem;
            }
        </style>
    </head>
    <body>
        <header class="header header-intro-clearance header-4">

            <header class="header header-intro-clearance header-4">

                <div class="header-middle">
                    <div class="container">
                        <div class="header-left">
                            <button class="mobile-menu-toggler">
                                <span class="sr-only">Toggle mobile menu</span>
                                <i class="icon-bars"></i>
                            </button>

                            <a href="home" class="logo">
                                <img src="images/Yellow Modern Gadget Store Logo (1).png" alt="CellCity Logo" width="200" height="50">
                            </a>
                        </div><!-- End .header-left -->

                        <div class="header-center">
                            <div class="header-search header-search-extended header-search-visible d-none d-lg-block">
                                <a href="#" class="search-toggle" role="button"><i class="icon-search"></i></a>
                                <form action="#" method="get">
                                    <div class="header-search-wrapper search-wrapper-wide">
                                        <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
                                        <input type="search" class="form-control" name="q" id="q" placeholder="Tìm kiếm sản phẩm ..." required>
                                    </div><!-- End .header-search-wrapper -->
                                </form>
                            </div><!-- End .header-search -->
                        </div>
                        <c:if test="${sessionScope.account == null}">
                            <div class="header-right">
                                <div class="dropdown compare-dropdown">
                                    <a href="" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="Compare Products" aria-label="Compare Products">
                                        <div class="icon">
                                            <i class="icon-user"></i>
                                        </div>
                                        <p>Đăng nhập</p>
                                    </a>

                                    <div class="dropdown-menu dropdown-menu-right" style="top: 90px">
                                        <ul class="compare-products">
                                            <li class="compare-product">
                                                <h4 class="compare-product-title"><a href="signin?direct=home">Đăng nhập</a></h4>
                                            </li>
                                            <li class="compare-product">
                                                <h4 class="compare-product-title"><a href="register.jsp"">Đăng kí</a></h4>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="dropdown cart-dropdown">
                                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                                        <div class="icon">
                                            <i class="icon-shopping-cart"></i>
                                            <span class="cart-count">${requestScope.cartsize}</span>
                                        </div>
                                        <p>Cart</p>
                                    </a>

                                    <div class="dropdown-menu dropdown-menu-right" style="width: 400px;top: 90px">
                                        <c:if test="${requestScope.cartsize == 0}">
                                            <h4>Giỏ hàng chưa có sản phẩm nào</h4>
                                        </c:if>
                                        <c:if test="${requestScope.cartsize != 0}">
                                            <div class="dropdown-cart-products">
                                                <c:forEach items="${requestScope.cart.items}" var="items">
                                                    <div class="product">
                                                        <div class="product-cart-details">
                                                            <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                                                <c:if test="${listallproduct.productId == items.product.productID}">
                                                                    <c:forEach items="${requestScope.colorlist}" var="colorlist">
                                                                        <c:if test="${colorlist.id == items.product.colorId}">
                                                                            <h4 class="product-title">
                                                                                <a href="product.html">${listallproduct.name} ${items.product.ram}GB ${items.product.rom}GB ${colorlist.name}</a>
                                                                            </h4>
                                                                        </c:if>
                                                                    </c:forEach>

                                                                </c:if>
                                                            </c:forEach>


                                                            <span class="cart-product-info">
                                                                <span class="cart-product-qty">${items.quantity}</span>
                                                                x <fmt:formatNumber value="${items.price}" type="number" groupingUsed="true"/>đ
                                                            </span>
                                                        </div><!-- End .product-cart-details -->

                                                        <figure class="product-image-container">
                                                            <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                                <c:if test="${listallfirstimage.productId == items.product.productID}">
                                                                    <a href="product.html" class="product-image">
                                                                        <img src="${listallfirstimage.imageUrl}" alt="product">
                                                                    </a>
                                                                </c:if>
                                                            </c:forEach>

                                                        </figure>
                                                        <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="dropdown-cart-total">
                                                <span>Tổng tiền</span>

                                                <span class="cart-total-price">
                                                    <fmt:formatNumber value="${cart.getTotal()}" type="number" groupingUsed="true"/>đ
                                                </span>
                                            </div><!-- End .dropdown-cart-total -->

                                            <div class="dropdown-cart-action">
                                                <a href="showcart" class="btn btn-primary">Xem giỏ hàng</a>
                                            </div>
                                        </c:if>
                                    </div><!-- End .dropdown-menu -->
                                </div><!-- End .cart-dropdown -->
                            </div><!-- End .header-right -->
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <div class="header-right">
                                <div class="dropdown compare-dropdown">
                                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="Compare Products" aria-label="Compare Products">
                                        <div class="icon">
                                            <i class="icon-user"></i>
                                        </div>
                                        <p>${sessionScope.account.name}</p>
                                    </a>

                                    <div class="dropdown-menu dropdown-menu-right" style="width: 170px;top: 90px">
                                        <ul class="compare-products">
                                            <li class="compare-product">
                                                <h4 class="compare-product-title"><a href="userinfo">Thông tin tài khoản</a></h4>
                                            </li>
                                            <li class="compare-product">
                                                <h4 class="compare-product-title"><a href="userorder">Đơn hàng của tôi</a></h4>
                                            </li>
                                            <li class="compare-product">
                                                <h4 class="compare-product-title"><a href="wallet">Nạp tiền vào ví</a></h4>
                                            </li>
                                            <li class="compare-product">
                                                <h4 class="compare-product-title"><a href="changepass.jsp">Đổi mật khẩu</a></h4>
                                            </li>
                                            <li class="compare-product">
                                                <h4 class="compare-product-title"><a href="logout?direct=home">Đăng xuất</a></h4>
                                            </li>
                                        </ul>
                                    </div><!-- End .dropdown-menu -->
                                </div><!-- End .compare-dropdown -->

                                <div class="dropdown cart-dropdown">
                                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                                        <div class="icon">
                                            <i class="icon-shopping-cart"></i>
                                            <span class="cart-count">${requestScope.cartsize}</span>
                                        </div>
                                        <p>Cart</p>
                                    </a>

                                    <div class="dropdown-menu dropdown-menu-right" style="width: 400px;top: 90px">
                                        <c:if test="${requestScope.cartsize == 0}">
                                            <h4>Giỏ hàng chưa có sản phẩm nào</h4>
                                        </c:if>
                                        <c:if test="${requestScope.cartsize != 0}">
                                            <div class="dropdown-cart-products">
                                                <c:forEach items="${requestScope.cart.items}" var="items">
                                                    <div class="product">
                                                        <div class="product-cart-details">
                                                            <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                                                <c:if test="${listallproduct.productId == items.product.productID}">
                                                                    <c:forEach items="${requestScope.colorlist}" var="colorlist">
                                                                        <c:if test="${colorlist.id == items.product.colorId}">
                                                                            <h4 class="product-title">
                                                                                <a href="product.html">${listallproduct.name} ${items.product.ram}GB ${items.product.rom}GB ${colorlist.name}</a>
                                                                            </h4>
                                                                        </c:if>
                                                                    </c:forEach>

                                                                </c:if>
                                                            </c:forEach>


                                                            <span class="cart-product-info">
                                                                <span class="cart-product-qty">${items.quantity}</span>
                                                                x <fmt:formatNumber value="${items.price}" type="number" groupingUsed="true"/>đ
                                                            </span>
                                                        </div><!-- End .product-cart-details -->

                                                        <figure class="product-image-container">
                                                            <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                                <c:if test="${listallfirstimage.productId == items.product.productID}">
                                                                    <a href="product.html" class="product-image">
                                                                        <img src="${listallfirstimage.imageUrl}" alt="product">
                                                                    </a>
                                                                </c:if>
                                                            </c:forEach>

                                                        </figure>
                                                        <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="dropdown-cart-total">
                                                <span>Tổng tiền</span>

                                                <span class="cart-total-price">
                                                    <fmt:formatNumber value="${cart.getTotal()}" type="number" groupingUsed="true"/>đ
                                                </span>
                                            </div><!-- End .dropdown-cart-total -->

                                            <div class="dropdown-cart-action">
                                                <a href="showcart" class="btn btn-primary">Xem giỏ hàng</a>
                                            </div>
                                        </c:if>
                                    </div><!-- End .dropdown-menu -->
                                </div><!-- End .cart-dropdown -->
                            </div>
                        </c:if>
                    </div><!-- End .container -->
                </div><!-- End .header-middle -->

                <div class="header-bottom sticky-header">
                    <div class="container">
                        <div class="header-left">
                            <div class="dropdown category-dropdown">
                                <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="Browse Categories">
                                    Chọn danh mục <i class="icon-angle-down"></i>
                                </a>

                                <div class="dropdown-menu" style="top: 55px">
                                    <nav class="side-nav">
                                        <ul class="menu-vertical sf-arrows">
                                            <li class="item-lead"><a href="#sale-products">Sale</a></li>
                                            <li class="item-lead"><a href="#new-products">Sản phẩm mới</a></li>
                                                <c:forEach items="${requestScope.listcat}" var="listcat">
                                                <li><a href="shop?page=1&cid=${listcat.categoryId}&chipset=&screensize=0&priceFrom=0&priceTo=60000000">${listcat.categoryName}</a></li>
                                                </c:forEach>

                                        </ul><!-- End .menu-vertical -->
                                    </nav><!-- End .side-nav -->
                                </div><!-- End .dropdown-menu -->
                            </div><!-- End .category-dropdown -->
                        </div><!-- End .header-left -->

                        <div class="header-center">
                            <nav class="main-nav">
                                <ul class="menu sf-arrows">
                                    <li class="megamenu-container active">
                                        <a href="home">Trang chủ</a>
                                    </li>
                                    <li>
                                        <a href="shop">Tất cả sản phẩm</a>
                                    </li>

                                </ul><!-- End .menu -->
                            </nav><!-- End .main-nav -->
                        </div><!-- End .header-center -->
                    </div><!-- End .container -->
                </div><!-- End .header-bottom -->
            </header><!-- End .header-middle -->

        </header>

        <section class="vh-55">
            <div class="container py-5 h-100" style="padding-bottom: 0!important">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-10 mb-4 mb-lg-0" style="height:100%;width: 70%">
                        <div class="card mb-3" style="border-radius: .5rem;height:100%">
                            <div class="row g-0" style="height:100%">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;background: #e2b780;display: flex;flex-direction: column;align-items: center;">
                                    <img src="assets/images/149071.png"
                                         alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
                                    <h5>Họ và tên</h5>
                                    <p>${sessionScope.account.name}</p>
                                    <i class="far fa-edit mb-5"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Thông tin</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Tên đăng nhập</h6>
                                                <p class="text-muted">${sessionScope.account.username}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Số điện thoại</h6>
                                                <p class="text-muted">${sessionScope.account.phone}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted">${sessionScope.account.email}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Địa chỉ</h6>
                                                <p class="text-muted">${sessionScope.account.address}</p>
                                            </div>
                                        </div>
                                        <div class="col-6 col-lg-4 col-xl-2">
                                            <div class="btn-wrap">
                                                <a href="updateInfo.jsp" class="btn btn-primary btn-round">Chỉnh sửa thông tin</a>
                                            </div><!-- End .btn-wrap -->
                                        </div>

                                        <div class="d-flex justify-content-start">
                                            <a href="#!"><i class="fab fa-facebook-f fa-lg me-3"></i></a>
                                            <a href="#!"><i class="fab fa-twitter fa-lg me-3"></i></a>
                                            <a href="#!"><i class="fab fa-instagram fa-lg"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="footer">
            <div class="footer-middle">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-lg-3">
                            <div class="widget widget-about">
                                <img src="assets/images/demos/demo-4/logo-footer.png" class="footer-logo" alt="Footer Logo" width="105" height="25">
                                <p>Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. </p>

                                <div class="widget-call">
                                    <i class="icon-phone"></i>
                                    Got Question? Call us 24/7
                                    <a href="tel:#">+0123 456 789</a>         
                                </div><!-- End .widget-call -->
                            </div><!-- End .widget about-widget -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="widget">
                                <h4 class="widget-title">Useful Links</h4><!-- End .widget-title -->

                                <ul class="widget-list">
                                    <li><a href="about.html">About Molla</a></li>
                                    <li><a href="#">Our Services</a></li>
                                    <li><a href="#">How to shop on Molla</a></li>
                                    <li><a href="faq.html">FAQ</a></li>
                                    <li><a href="contact.html">Contact us</a></li>
                                </ul><!-- End .widget-list -->
                            </div><!-- End .widget -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="widget">
                                <h4 class="widget-title">Customer Service</h4><!-- End .widget-title -->

                                <ul class="widget-list">
                                    <li><a href="#">Payment Methods</a></li>
                                    <li><a href="#">Money-back guarantee!</a></li>
                                    <li><a href="#">Returns</a></li>
                                    <li><a href="#">Shipping</a></li>
                                    <li><a href="#">Terms and conditions</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                </ul><!-- End .widget-list -->
                            </div><!-- End .widget -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="widget">
                                <h4 class="widget-title">My Account</h4><!-- End .widget-title -->

                                <ul class="widget-list">
                                    <li><a href="#">Sign In</a></li>
                                    <li><a href="cart.html">View Cart</a></li>
                                    <li><a href="#">My Wishlist</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul><!-- End .widget-list -->
                            </div><!-- End .widget -->
                        </div><!-- End .col-sm-6 col-lg-3 -->
                    </div><!-- End .row -->
                </div><!-- End .container -->
            </div><!-- End .footer-middle -->

            <div class="footer-bottom">
                <div class="container">
                    <p class="footer-copyright">Copyright © 2019 Molla Store. All Rights Reserved.</p><!-- End .footer-copyright -->
                    <figure class="footer-payments">
                        <img src="assets/images/payments.png" alt="Payment methods" width="272" height="20">
                    </figure><!-- End .footer-payments -->
                </div><!-- End .container -->
            </div><!-- End .footer-bottom -->
        </footer>

    </body>
</html>
