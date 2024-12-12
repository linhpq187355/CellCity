<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">


    <!-- molla/cart.html  22 Nov 2019 09:55:06 GMT -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Giỏ hàng</title>
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
        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="assets/css/bootstrap.min_1.css">

        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>
        <div class="page-wrapper">
            <header class="header header-intro-clearance header-4">

                <div class="header-middle">
                    <div class="container">
                        <div class="header-left">
                            <button class="mobile-menu-toggler">
                                <span class="sr-only">Toggle mobile menu</span>
                                <i class="icon-bars" ></i>
                            </button>

                            <a href="home" class="logo">
                                <img src="images/Yellow Modern Gadget Store Logo (1).png" alt="CellCity Logo" width="200" height="50">
                            </a>
                        </div><!-- End .header-left -->

                        <div class="header-center">
                            <div class="header-search header-search-extended header-search-visible d-none d-lg-block">
                                <a href="#" class="search-toggle" role="button"><i class="icon-search"></i></a>
                                <form action="shop" method="get" id="searchForm">
                                    <div class="header-search-wrapper search-wrapper-wide">
                                        
                                        <button class="btn btn-primary" type="submit" style="background: transparent;color: #000;"><i class="icon-search"></i></button>
                                        <input type="search" class="form-control" name="search" id="q" placeholder="Tìm kiếm sản phẩm ..." required>
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

                                    <div class="dropdown-menu dropdown-menu-right">
                                        <ul class="compare-products">
                                            <li class="compare-product">
                                                <h4 class="compare-product-title"><a href="login.jsp"">Đăng nhập</a></h4>
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
                                        <p>Giỏ hàng</p>
                                    </a>

                                    <div class="dropdown-menu dropdown-menu-right" style="width: 400px;">
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
                                        </div><!-- End .cart-product -->

                                        <div class="dropdown-cart-total">
                                            <span>Tổng tiền</span>

                                            <span class="cart-total-price">
                                                <fmt:formatNumber value="${cart.getTotal()}" type="number" groupingUsed="true"/>đ
                                            </span>
                                        </div><!-- End .dropdown-cart-total -->

                                        <div class="dropdown-cart-action">
                                            <a href="cart.html" class="btn btn-primary">View Cart</a>
                                            <a href="checkout.html" class="btn btn-outline-primary-2"><span>Checkout</span><i class="icon-long-arrow-right"></i></a>
                                        </div><!-- End .dropdown-cart-total -->
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

                                    <div class="dropdown-menu dropdown-menu-right">
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
                                                <h4 class="compare-product-title"><a href="logout">Đăng xuất</a></h4>
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
                                        <p>Giỏ hàng</p>
                                    </a>

                                    <div class="dropdown-menu dropdown-menu-right" style="width: 400px;">
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
                                        </div><!-- End .cart-product -->

                                        <div class="dropdown-cart-total">
                                            <span>Tổng tiền</span>

                                            <span class="cart-total-price">
                                                <fmt:formatNumber value="${cart.getTotal()}" type="number" groupingUsed="true"/>đ
                                            </span>
                                        </div><!-- End .dropdown-cart-total -->

                                        <div class="dropdown-cart-action">
                                            <a href="showcart" class="btn btn-primary">Xem giỏ hàng</a>
                                        </div><!-- End .dropdown-cart-total -->
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
            </header><!-- End .header -->

            <main class="main">
                <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                    <div class="container">
                        <h1 class="page-title">Giỏ hàng<span>Thanh toán</span></h1>
                    </div><!-- End .container -->
                </div><!-- End .page-header -->
                <nav aria-label="breadcrumb" class="breadcrumb-nav">
                    <div class="container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
                        </ol>
                    </div><!-- End .container -->
                </nav><!-- End .breadcrumb-nav -->

                <div class="page-content">
                    <div class="cart">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9">
                                    <table class="table table-cart table-mobile">
                                        <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th>Giá</th>
                                                <th>Số lượng</th>
                                                <th>Tổng</th>
                                                <th></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${requestScope.cart.items}" var="items">
                                                <tr>
                                                    <td class="product-col">
                                                        <div class="product">

                                                            <figure class="product-media">
                                                                <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                                    <c:if test="${listallfirstimage.productId == items.product.productID}">
                                                                        <a href="product.html" class="product-image">
                                                                            <img src="${listallfirstimage.imageUrl}" alt="product">
                                                                        </a>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </figure>

                                                            <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                                                <c:if test="${listallproduct.productId == items.product.productID}">
                                                                    <c:forEach items="${requestScope.colorlist}" var="colorlist">
                                                                        <c:if test="${colorlist.id == items.product.colorId}">
                                                                            <h3 class="product-title">
                                                                                <a href="product.html">${listallproduct.name} ${items.product.ram}GB ${items.product.rom}GB ${colorlist.name}</a>
                                                                            </h3>
                                                                        </c:if>
                                                                    </c:forEach>

                                                                </c:if>
                                                            </c:forEach><!-- End .product-title -->
                                                        </div><!-- End .product -->
                                                    </td>
                                                    <td class="price-col">
                                                        <fmt:formatNumber value="${items.price}" type="number" groupingUsed="true"/>đ
                                                    </td>
                                                    <td class="quantity-col">
                                                        <div class="cart-product-quantity">
                                                            <form action="cartprocess">
                                                                <input type="text" name="id" value="${items.product.id}" hidden>
                                                                <input type="number" name="quantity" class="form-control" value="${items.quantity}" min="0" max="${items.product.stockQuantity}" step="1" data-decimals="0" required onchange="this.form.submit()">
                                                            </form>
                                                        </div><!-- End .cart-product-quantity -->
                                                    </td>
                                                    <td class="total-col">
                                                        <fmt:formatNumber value="${items.price*items.quantity}" type="number" groupingUsed="true"/>đ
                                                    </td>
                                                    <td class="remove-col">
                                                        <form action="cartprocess" method="post">
                                                            <input type="text" name="id" value="${items.product.id}" hidden>
                                                            <button type="submit" class="btn-remove"><i class="icon-close"></i></button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table><!-- End .table table-wishlist -->

                                    <div class="cart-bottom">
                                        

                                        <a href="showcart" class="btn btn-outline-dark-2"><span>Cập nhật giỏ hàng</span><i class="icon-refresh"></i></a>
                                    </div><!-- End .cart-bottom -->
                                </div><!-- End .col-lg-9 -->
                                <aside class="col-lg-3">
                                    <div class="summary summary-cart">
                                        <h3 class="summary-title">Tổng đơn hàng</h3><!-- End .summary-title -->
                                        <form action="checkout">
                                            <table class="table table-summary">

                                                <tbody>
                                                    <tr class="summary-subtotal">
                                                        <td>Tổng giá sản phẩm</td>
                                                        <td><fmt:formatNumber value="${requestScope.cart.getTotal()}" type="number" groupingUsed="true"/>đ</td>
                                                    </tr><!-- End .summary-subtotal -->
                                                    <tr class="summary-shipping">
                                                        <td>Giao hàng:</td>
                                                        <td>&nbsp;</td>
                                                    </tr>

                                                    <tr class="summary-shipping-row">
                                                        <td>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" id="standart-shipping" name="shipping" class="custom-control-input" value="50000" checked onchange="updateTotal()">
                                                                <label class="custom-control-label" for="standart-shipping">Tiết kiệm:</label>
                                                            </div><!-- End .custom-control -->
                                                        </td>
                                                        <td><fmt:formatNumber value="50000" type="number" groupingUsed="true"/>đ</td>
                                                    </tr><!-- End .summary-shipping-row -->

                                                    <tr class="summary-shipping-row">
                                                        <td>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" id="express-shipping" name="shipping" class="custom-control-input" value="100000" onchange="updateTotal()">
                                                                <label class="custom-control-label" for="express-shipping">Nhanh:</label>
                                                            </div><!-- End .custom-control -->
                                                        </td>
                                                        <td><fmt:formatNumber value="100000" type="number" groupingUsed="true"/>đ</td>
                                                    </tr><!-- End .summary-shipping-row -->



                                                    <tr class="summary-total">
                                                        <td>Thành tiền:</td>
                                                        <td id="total-amount"><fmt:formatNumber value="${requestScope.cart.getTotal()+50000}" type="number" groupingUsed="true"/>đ</td>
                                                    </tr>

                                                    <!-- End .summary-total -->
                                                </tbody>

                                            </table><!-- End .table table-summary -->
                                            <input type="hidden" id="hidden-total-amount" name="totalAmount" value="${requestScope.cart.getTotal() + 50000}">
                                            <button type="submit" class="btn btn-outline-primary-2 btn-order btn-block">THANH TOÁN</button>
                                        </form>
                                        
                                    </div><!-- End .summary -->

                                    <a href="shop" class="btn btn-outline-dark-2 btn-block mb-3"><span>TIẾP TỤC MUA HÀNG</span><i class="icon-refresh"></i></a>
                                </aside><!-- End .col-lg-3 -->
                            </div><!-- End .row -->
                        </div><!-- End .container -->
                    </div><!-- End .cart -->
                </div><!-- End .page-content -->
            </main><!-- End .main -->

            <footer class="footer">
                <div class="footer-middle">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-lg-3">
                                <div class="widget widget-about">
                                    <img src="assets/images/logo.png" class="footer-logo" alt="Footer Logo" width="105" height="25">
                                    <p>Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. </p>

                                    <div class="social-icons">
                                        <a href="#" class="social-icon" target="_blank" title="Facebook"><i class="icon-facebook-f"></i></a>
                                        <a href="#" class="social-icon" target="_blank" title="Twitter"><i class="icon-twitter"></i></a>
                                        <a href="#" class="social-icon" target="_blank" title="Instagram"><i class="icon-instagram"></i></a>
                                        <a href="#" class="social-icon" target="_blank" title="Youtube"><i class="icon-youtube"></i></a>
                                        <a href="#" class="social-icon" target="_blank" title="Pinterest"><i class="icon-pinterest"></i></a>
                                    </div><!-- End .soial-icons -->
                                </div><!-- End .widget about-widget -->
                            </div><!-- End .col-sm-6 col-lg-3 -->

                            <div class="col-sm-6 col-lg-3">
                                <div class="widget">
                                    <h4 class="widget-title">Useful Links</h4><!-- End .widget-title -->

                                    <ul class="widget-list">
                                        <li><a href="about.html">About Molla</a></li>
                                        <li><a href="#">How to shop on Molla</a></li>
                                        <li><a href="#">FAQ</a></li>
                                        <li><a href="contact.html">Contact us</a></li>
                                        <li><a href="login.html">Log in</a></li>
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
            </footer><!-- End .footer -->
        </div><!-- End .page-wrapper -->
        <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

        <!-- Plugins JS File -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.hoverIntent.min.js"></script>
        <script src="assets/js/jquery.waypoints.min.js"></script>
        <script src="assets/js/superfish.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/bootstrap-input-spinner.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script>
                                                                    function updateTotal() {
                                                                        // Lấy tổng giá sản phẩm từ requestScope.cart.getTotal()
                                                                        var totalProductPrice = ${requestScope.cart.getTotal()};

                                                                        // Lấy giá trị của radio button được chọn
                                                                        var shippingCost = document.querySelector('input[name="shipping"]:checked').value;

                                                                        // Tính tổng thành tiền
                                                                        var totalAmount = parseFloat(totalProductPrice) + parseFloat(shippingCost);

                                                                        // Cập nhật thành tiền hiển thị trên trang
                                                                        document.getElementById('total-amount').innerText = totalAmount.toLocaleString('vi-VN') + 'đ';

                                                                        // Cập nhật giá trị vào input hidden
                                                                        document.getElementById('hidden-total-amount').value = totalAmount;
                                                                    }

                                                                    // Gọi hàm updateTotal khi trang được tải lần đầu để thiết lập giá trị ban đầu
                                                                    document.addEventListener('DOMContentLoaded', updateTotal);
        </script>
    </body>


    <!-- molla/cart.html  22 Nov 2019 09:55:06 GMT -->
</html>