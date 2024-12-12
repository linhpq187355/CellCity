<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">


    <!-- molla/checkout.html  22 Nov 2019 09:55:06 GMT -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Đơn hàng của tôi</title>
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
                                <form action="#" method="get">
                                    <div class="header-search-wrapper search-wrapper-wide">
                                        <button class="btn btn-primary" type="submit" style="background-color: transparent; color: #000;"><i class="icon-search"></i></button>
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
                                            <a href="cart.html" class="btn btn-primary">View Cart</a>
                                            <a href="checkout.html" class="btn btn-outline-primary-2"><span>Checkout</span><i class="icon-long-arrow-right"></i></a>
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
            </header>

            <main class="main">
                <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                    <div class="container">
                        <h1 class="page-title">Đơn hàng của tôi</h1>
                    </div><!-- End .container -->
                </div><!-- End .page-header -->
                <nav aria-label="breadcrumb" class="breadcrumb-nav">
                    <div class="container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Shop</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                        </ol>
                    </div><!-- End .container -->
                </nav><!-- End .breadcrumb-nav -->

                <div class="container">
                    <h3>Đơn hàng chưa hoàn thành</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Ngày đặt</th>
                                <th scope="col">Tên</th>
                                <th scope="col">SĐT</th>
                                <th scope="col">Email</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Phương thức thanh toán</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Hủy</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set value="1" var="index"></c:set>
                            <c:forEach items="${requestScope.listorder}" var="listorder">
                                <c:if test="${listorder.status eq 'Đã thanh toán' || listorder.status eq 'Chờ xử lí'|| listorder.status eq 'Đang giao'}">
                                    <tr onclick="toggleDetails('details${index}')">
                                        <th scope="row">${index}</th>
                                        <td>${listorder.orderDate}</td>
                                        <td>${listorder.shipping_name}</td>
                                        <td>${listorder.shipping_phone}</td>
                                        <td>${listorder.shipping_email}</td>
                                        <td>${listorder.shipAddress}</td>
                                        <td><fmt:formatNumber value="${listorder.totalAmount}" type="number" groupingUsed="true"/>đ</td>
                                        <td>${listorder.payment}</td>
                                        <td>${listorder.status}</td>
                                        <td>
                                            <c:if test="${listorder.status eq 'Đã thanh toán' || listorder.status eq 'Chờ xử lí'}">
                                                <a href="cancalOrder?id=${listorder.id}">Hủy</a>
                                            </c:if>
                                            <c:if test="${listorder.status eq 'Đang giao'}">
                                                Hủy
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr id="details${index}" style="display: none">
                                        <td colspan="10">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Sản phẩm</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Giá</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.listOrderDetail}" var="listOrderDetails">

                                                        <c:forEach items="${listOrderDetails}" var="o">
                                                            <c:if test="${o.orderId == listorder.id}">
                                                                <tr>
                                                                    <td>
                                                                        <c:forEach items="${requestScope.listallprodetail}" var="listallprodetail">
                                                                            <c:if test="${listallprodetail.id == o.productDetailId}">
                                                                                <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                                                                    <c:if test="${listallproduct.productId == listallprodetail.productID}">
                                                                                        <c:forEach items="${requestScope.colorlist}" var="colorlist">
                                                                                            <c:if test="${colorlist.id == listallprodetail.colorId}">
                                                                                                ${listallproduct.name} ${listallprodetail.ram}GB ${listallprodetail.rom}GB ${colorlist.name}
                                                                                                <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                                                                    <c:if test="${listallfirstimage.productId == listallproduct.productId}">
                                                                                                        <img src="${listallfirstimage.imageUrl}" alt="alt" height="50px" width="50px" style="display: inline"/>
                                                                                                    </c:if>
                                                                                                </c:forEach>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </c:forEach> 

                                                                    </td>
                                                                    <td>${o.quantity}</td>
                                                                    <td><fmt:formatNumber value="${o.price}" type="number" groupingUsed="true"/>đ</td>
                                                                </tr>
                                                            </c:if>

                                                        </c:forEach>

                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <c:set value="${index+1}" var="index"></c:set>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    <h3>Đơn hàng đã hoàn thành hoặc đã hủy</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Ngày đặt</th>
                                <th scope="col">Tên</th>
                                <th scope="col">SĐT</th>
                                <th scope="col">Email</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Phương thức thanh toán</th>
                                <th scope="col">Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set value="1" var="index"></c:set>
                            <c:forEach items="${requestScope.listorder}" var="listorder">
                                <c:if test="${listorder.status eq 'Hoàn thành' || listorder.status eq 'Đã hủy'}">
                                    <tr onclick="toggleDetails2('details2${index}')">
                                        <th scope="row">${index}</th>
                                        <td>${listorder.orderDate}</td>
                                        <td>${listorder.shipping_name}</td>
                                        <td>${listorder.shipping_phone}</td>
                                        <td>${listorder.shipping_email}</td>
                                        <td>${listorder.shipAddress}</td>
                                        <td><fmt:formatNumber value="${listorder.totalAmount}" type="number" groupingUsed="true"/>đ</td>
                                        <td>${listorder.payment}</td>
                                        <c:if test="${listorder.status eq 'Hoàn thành'}">
                                            <td style="color: greenyellow">${listorder.status}</td>
                                        </c:if>
                                        <c:if test="${listorder.status eq 'Đã hủy'}">
                                            <td style="color: red">${listorder.status}</td>
                                        </c:if>

                                    </tr>
                                    <tr id="details2${index}" style="display: none">
                                        <td colspan="10">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Sản phẩm</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Giá</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.listOrderDetail}" var="listOrderDetails">

                                                        <c:forEach items="${listOrderDetails}" var="o">
                                                            <c:if test="${o.orderId == listorder.id}">
                                                                <tr>
                                                                    <td>
                                                                        <c:forEach items="${requestScope.listallprodetail}" var="listallprodetail">
                                                                            <c:if test="${listallprodetail.id == o.productDetailId}">
                                                                                <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                                                                    <c:if test="${listallproduct.productId == listallprodetail.productID}">
                                                                                        <c:forEach items="${requestScope.colorlist}" var="colorlist">
                                                                                            <c:if test="${colorlist.id == listallprodetail.colorId}">
                                                                                                ${listallproduct.name} ${listallprodetail.ram}GB ${listallprodetail.rom}GB ${colorlist.name}
                                                                                                <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                                                                    <c:if test="${listallfirstimage.productId == listallproduct.productId}">
                                                                                                        <img src="${listallfirstimage.imageUrl}" alt="alt" height="50px" width="50px" style="display: inline"/>
                                                                                                    </c:if>
                                                                                                </c:forEach>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </c:forEach> 

                                                                    </td>
                                                                    <td>${o.quantity}</td>
                                                                    <td><fmt:formatNumber value="${o.price}" type="number" groupingUsed="true"/>đ</td>
                                                                </tr>
                                                            </c:if>

                                                        </c:forEach>

                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <c:set value="${index+1}" var="index"></c:set>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

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

        <!-- Mobile Menu -->
        <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

        <div class="mobile-menu-container">
            <div class="mobile-menu-wrapper">
                <span class="mobile-menu-close"><i class="icon-close"></i></span>

                <form action="#" method="get" class="mobile-search">
                    <label for="mobile-search" class="sr-only">Search</label>
                    <input type="search" class="form-control" name="mobile-search" id="mobile-search" placeholder="Search in..." required>
                    <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
                </form>

                <nav class="mobile-nav">
                    <ul class="mobile-menu">
                        <li class="active">
                            <a href="index.html">Home</a>

                            <ul>
                                <li><a href="index-1.html">01 - furniture store</a></li>
                                <li><a href="index-2.html">02 - furniture store</a></li>
                                <li><a href="index-3.html">03 - electronic store</a></li>
                                <li><a href="index-4.html">04 - electronic store</a></li>
                                <li><a href="index-5.html">05 - fashion store</a></li>
                                <li><a href="index-6.html">06 - fashion store</a></li>
                                <li><a href="index-7.html">07 - fashion store</a></li>
                                <li><a href="index-8.html">08 - fashion store</a></li>
                                <li><a href="index-9.html">09 - fashion store</a></li>
                                <li><a href="index-10.html">10 - shoes store</a></li>
                                <li><a href="index-11.html">11 - furniture simple store</a></li>
                                <li><a href="index-12.html">12 - fashion simple store</a></li>
                                <li><a href="index-13.html">13 - market</a></li>
                                <li><a href="index-14.html">14 - market fullwidth</a></li>
                                <li><a href="index-15.html">15 - lookbook 1</a></li>
                                <li><a href="index-16.html">16 - lookbook 2</a></li>
                                <li><a href="index-17.html">17 - fashion store</a></li>
                                <li><a href="index-18.html">18 - fashion store (with sidebar)</a></li>
                                <li><a href="index-19.html">19 - games store</a></li>
                                <li><a href="index-20.html">20 - book store</a></li>
                                <li><a href="index-21.html">21 - sport store</a></li>
                                <li><a href="index-22.html">22 - tools store</a></li>
                                <li><a href="index-23.html">23 - fashion left navigation store</a></li>
                                <li><a href="index-24.html">24 - extreme sport store</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="category.html">Shop</a>
                            <ul>
                                <li><a href="category-list.html">Shop List</a></li>
                                <li><a href="category-2cols.html">Shop Grid 2 Columns</a></li>
                                <li><a href="category.html">Shop Grid 3 Columns</a></li>
                                <li><a href="category-4cols.html">Shop Grid 4 Columns</a></li>
                                <li><a href="category-boxed.html"><span>Shop Boxed No Sidebar<span class="tip tip-hot">Hot</span></span></a></li>
                                <li><a href="category-fullwidth.html">Shop Fullwidth No Sidebar</a></li>
                                <li><a href="product-category-boxed.html">Product Category Boxed</a></li>
                                <li><a href="product-category-fullwidth.html"><span>Product Category Fullwidth<span class="tip tip-new">New</span></span></a></li>
                                <li><a href="cart.html">Cart</a></li>
                                <li><a href="checkout.html">Checkout</a></li>
                                <li><a href="wishlist.html">Wishlist</a></li>
                                <li><a href="#">Lookbook</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="product.html" class="sf-with-ul">Product</a>
                            <ul>
                                <li><a href="product.html">Default</a></li>
                                <li><a href="product-centered.html">Centered</a></li>
                                <li><a href="product-extended.html"><span>Extended Info<span class="tip tip-new">New</span></span></a></li>
                                <li><a href="product-gallery.html">Gallery</a></li>
                                <li><a href="product-sticky.html">Sticky Info</a></li>
                                <li><a href="product-sidebar.html">Boxed With Sidebar</a></li>
                                <li><a href="product-fullwidth.html">Full Width</a></li>
                                <li><a href="product-masonry.html">Masonry Sticky Info</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">Pages</a>
                            <ul>
                                <li>
                                    <a href="about.html">About</a>

                                    <ul>
                                        <li><a href="about.html">About 01</a></li>
                                        <li><a href="about-2.html">About 02</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="contact.html">Contact</a>

                                    <ul>
                                        <li><a href="contact.html">Contact 01</a></li>
                                        <li><a href="contact-2.html">Contact 02</a></li>
                                    </ul>
                                </li>
                                <li><a href="login.html">Login</a></li>
                                <li><a href="faq.html">FAQs</a></li>
                                <li><a href="404.html">Error 404</a></li>
                                <li><a href="coming-soon.html">Coming Soon</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="blog.html">Blog</a>

                            <ul>
                                <li><a href="blog.html">Classic</a></li>
                                <li><a href="blog-listing.html">Listing</a></li>
                                <li>
                                    <a href="#">Grid</a>
                                    <ul>
                                        <li><a href="blog-grid-2cols.html">Grid 2 columns</a></li>
                                        <li><a href="blog-grid-3cols.html">Grid 3 columns</a></li>
                                        <li><a href="blog-grid-4cols.html">Grid 4 columns</a></li>
                                        <li><a href="blog-grid-sidebar.html">Grid sidebar</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">Masonry</a>
                                    <ul>
                                        <li><a href="blog-masonry-2cols.html">Masonry 2 columns</a></li>
                                        <li><a href="blog-masonry-3cols.html">Masonry 3 columns</a></li>
                                        <li><a href="blog-masonry-4cols.html">Masonry 4 columns</a></li>
                                        <li><a href="blog-masonry-sidebar.html">Masonry sidebar</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">Mask</a>
                                    <ul>
                                        <li><a href="blog-mask-grid.html">Blog mask grid</a></li>
                                        <li><a href="blog-mask-masonry.html">Blog mask masonry</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">Single Post</a>
                                    <ul>
                                        <li><a href="single.html">Default with sidebar</a></li>
                                        <li><a href="single-fullwidth.html">Fullwidth no sidebar</a></li>
                                        <li><a href="single-fullwidth-sidebar.html">Fullwidth with sidebar</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="elements-list.html">Elements</a>
                            <ul>
                                <li><a href="elements-products.html">Products</a></li>
                                <li><a href="elements-typography.html">Typography</a></li>
                                <li><a href="elements-titles.html">Titles</a></li>
                                <li><a href="elements-banners.html">Banners</a></li>
                                <li><a href="elements-product-category.html">Product Category</a></li>
                                <li><a href="elements-video-banners.html">Video Banners</a></li>
                                <li><a href="elements-buttons.html">Buttons</a></li>
                                <li><a href="elements-accordions.html">Accordions</a></li>
                                <li><a href="elements-tabs.html">Tabs</a></li>
                                <li><a href="elements-testimonials.html">Testimonials</a></li>
                                <li><a href="elements-blog-posts.html">Blog Posts</a></li>
                                <li><a href="elements-portfolio.html">Portfolio</a></li>
                                <li><a href="elements-cta.html">Call to Action</a></li>
                                <li><a href="elements-icon-boxes.html">Icon Boxes</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav><!-- End .mobile-nav -->

                <div class="social-icons">
                    <a href="#" class="social-icon" target="_blank" title="Facebook"><i class="icon-facebook-f"></i></a>
                    <a href="#" class="social-icon" target="_blank" title="Twitter"><i class="icon-twitter"></i></a>
                    <a href="#" class="social-icon" target="_blank" title="Instagram"><i class="icon-instagram"></i></a>
                    <a href="#" class="social-icon" target="_blank" title="Youtube"><i class="icon-youtube"></i></a>
                </div><!-- End .social-icons -->
            </div><!-- End .mobile-menu-wrapper -->
        </div><!-- End .mobile-menu-container -->

        <!-- Sign in / Register Modal -->
        <div class="modal fade" id="signin-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="icon-close"></i></span>
                        </button>

                        <div class="form-box">
                            <div class="form-tab">
                                <ul class="nav nav-pills nav-fill" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="signin-tab" data-toggle="tab" href="#signin" role="tab" aria-controls="signin" aria-selected="true">Sign In</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="register-tab" data-toggle="tab" href="#register" role="tab" aria-controls="register" aria-selected="false">Register</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="tab-content-5">
                                    <div class="tab-pane fade show active" id="signin" role="tabpanel" aria-labelledby="signin-tab">
                                        <form action="#">
                                            <div class="form-group">
                                                <label for="singin-email">Username or email address *</label>
                                                <input type="text" class="form-control" id="singin-email" name="singin-email" required>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="singin-password">Password *</label>
                                                <input type="password" class="form-control" id="singin-password" name="singin-password" required>
                                            </div><!-- End .form-group -->

                                            <div class="form-footer">
                                                <button type="submit" class="btn btn-outline-primary-2">
                                                    <span>LOG IN</span>
                                                    <i class="icon-long-arrow-right"></i>
                                                </button>

                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="signin-remember">
                                                    <label class="custom-control-label" for="signin-remember">Remember Me</label>
                                                </div><!-- End .custom-checkbox -->

                                                <a href="#" class="forgot-link">Forgot Your Password?</a>
                                            </div><!-- End .form-footer -->
                                        </form>
                                        <div class="form-choice">
                                            <p class="text-center">or sign in with</p>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <a href="#" class="btn btn-login btn-g">
                                                        <i class="icon-google"></i>
                                                        Login With Google
                                                    </a>
                                                </div><!-- End .col-6 -->
                                                <div class="col-sm-6">
                                                    <a href="#" class="btn btn-login btn-f">
                                                        <i class="icon-facebook-f"></i>
                                                        Login With Facebook
                                                    </a>
                                                </div><!-- End .col-6 -->
                                            </div><!-- End .row -->
                                        </div><!-- End .form-choice -->
                                    </div><!-- .End .tab-pane -->
                                    <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                                        <form action="#">
                                            <div class="form-group">
                                                <label for="register-email">Your email address *</label>
                                                <input type="email" class="form-control" id="register-email" name="register-email" required>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="register-password">Password *</label>
                                                <input type="password" class="form-control" id="register-password" name="register-password" required>
                                            </div><!-- End .form-group -->

                                            <div class="form-footer">
                                                <button type="submit" class="btn btn-outline-primary-2">
                                                    <span>SIGN UP</span>
                                                    <i class="icon-long-arrow-right"></i>
                                                </button>

                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="register-policy" required>
                                                    <label class="custom-control-label" for="register-policy">I agree to the <a href="#">privacy policy</a> *</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .form-footer -->
                                        </form>
                                        <div class="form-choice">
                                            <p class="text-center">or sign in with</p>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <a href="#" class="btn btn-login btn-g">
                                                        <i class="icon-google"></i>
                                                        Login With Google
                                                    </a>
                                                </div><!-- End .col-6 -->
                                                <div class="col-sm-6">
                                                    <a href="#" class="btn btn-login  btn-f">
                                                        <i class="icon-facebook-f"></i>
                                                        Login With Facebook
                                                    </a>
                                                </div><!-- End .col-6 -->
                                            </div><!-- End .row -->
                                        </div><!-- End .form-choice -->
                                    </div><!-- .End .tab-pane -->
                                </div><!-- End .tab-content -->
                            </div><!-- End .form-tab -->
                        </div><!-- End .form-box -->
                    </div><!-- End .modal-body -->
                </div><!-- End .modal-content -->
            </div><!-- End .modal-dialog -->
        </div><!-- End .modal -->

        <!-- Plugins JS File -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.hoverIntent.min.js"></script>
        <script src="assets/js/jquery.waypoints.min.js"></script>
        <script src="assets/js/superfish.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script>
                                        function toggleShippingInfo() {
                                            var checkbox = document.getElementById('checkout-diff-address');
                                            var differentShippingInfo = document.getElementById('different-shipping-info');
                                            if (checkbox.checked) {
                                                differentShippingInfo.style.display = 'block';
                                            } else {
                                                differentShippingInfo.style.display = 'none';
                                            }
                                        }
                                        function setPaymentMethod(method) {
                                            document.getElementById('payment-method').value = method;
                                        }
                                        function toggleDetails(id) {
                                            var element = document.getElementById(id);
                                            if (element.style.display === "none") {
                                                element.style.display = "table-row";
                                            } else {
                                                element.style.display = "none";
                                            }
                                        }
                                        function toggleDetails2(id) {
                                            var element = document.getElementById(id);
                                            if (element.style.display === "none") {
                                                element.style.display = "table-row";
                                            } else {
                                                element.style.display = "none";
                                            }
                                        }
        </script>
    </body>


    <!-- molla/checkout.html  22 Nov 2019 09:55:06 GMT -->
</html>