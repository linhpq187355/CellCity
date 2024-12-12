<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>CellCity - Thiên đường smartphone</title>
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
        <link rel="stylesheet" href="assets/css/bootstrap1.min.css">
        <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/plugins/jquery.countdown.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/skins/skin-demo-4.css">
        <link rel="stylesheet" href="assets/css/demos/demo-4.css">  
        <script src="https://kit.fontawesome.com/f5cbf3afb2.js" crossorigin="anonymous"></script>
        <style>
            html {
                scroll-behavior: smooth;
            }
            .full-stars-example-two1 {

                /* use display:inline-flex to prevent whitespace issues. alternatively, you can put all the children of .rating-group on a single line */
                .rating-group1 {
                    display: inline-flex;
                }

                /* hide radio inputs */
                .rating__input1 {
                    position: absolute !important;
                    left: -9999px !important;
                }
                .rating__icon--star1 {
                    color: orange;
                }
                .rating__input1:checked ~ .rating__label1 .rating__icon--star1 {
                    color: #ddd;
                }
            }
        </style>
    </head>

    <body>
        <div class="page-wrapper">
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
                                <form action="shop" method="get" id="searchForm">
                                    <div class="header-search-wrapper search-wrapper-wide">
                                        <label for="q" class="sr-only">Tìm kiếm</label>
                                        <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
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

                                    <div class="dropdown-menu dropdown-menu-right" style="width: 400px;">
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

                                    <div class="dropdown-menu dropdown-menu-right" style="width: 170px">
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

                                    <div class="dropdown-menu dropdown-menu-right" style="width: 400px;">
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

                                <div class="dropdown-menu">
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


                <div class="container" style="margin-top: 5%">
                    <div class="cat-blocks-container">
                        <div class="row">
                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="shop?page=1&cid=1&chipset=&screensize=0&priceFrom=0&priceTo=60000000" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="assets/images/Picture1.png" alt="Category image" style="width: 50%">
                                        </span>
                                    </figure>
                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="shop?page=1&cid=2&chipset=&screensize=0&priceFrom=0&priceTo=60000000" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="assets/images/Picture3.png" alt="Category image" style="width: 65%">
                                        </span>
                                    </figure>
                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="shop?page=1&cid=3&chipset=&screensize=0&priceFrom=0&priceTo=60000000" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="assets/images/xiaomi.png" alt="Category image"  style="width: 60%">
                                        </span>
                                    </figure>

                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="shop?page=1&cid=4&chipset=&screensize=0&priceFrom=0&priceTo=60000000" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="assets/images/oppo.png" alt="Category image" style="width: 85%">
                                        </span>
                                    </figure>

                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <!-- End .col-sm-4 col-lg-2 -->
                        </div><!-- End .row -->
                        <div class="row">
                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="shop?page=1&cid=5&chipset=&screensize=0&priceFrom=0&priceTo=60000000" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="assets/images/caec2ddfc4c22d0978bf4f6030294cb0.png" alt="Category image" style="width: 55%">
                                        </span>
                                    </figure>

                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="shop?page=1&cid=6&chipset=&screensize=0&priceFrom=0&priceTo=60000000" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="assets/images/Picture4.png" alt="Category image" style="width: 62%">
                                        </span>
                                    </figure>

                                </a>
                            </div>
                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="shop?page=1&cid=7&chipset=&screensize=0&priceFrom=0&priceTo=60000000" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="assets/images/AsusTek-black-logo.png" alt="Category image" style="width: 60%">
                                        </span>
                                    </figure>
                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                            <div class="col-6 col-sm-4 col-lg-3">
                                <a href="shop?page=1&cid=8&chipset=&screensize=0&priceFrom=0&priceTo=60000000" class="cat-block">
                                    <figure>
                                        <span>
                                            <img src="assets/images/vivo.png" alt="Category image" style="width: 60%">
                                        </span>
                                    </figure>
                                </a>
                            </div><!-- End .col-sm-4 col-lg-2 -->

                        </div>
                    </div><!-- End .cat-blocks-container -->
                </div><!-- End .container -->

                <div class="mb-4"></div><!-- End .mb-4 -->


                <div class="mb-3"></div><!-- End .mb-5 -->

                <div class="container new-arrivals" id="new-products">
                    <div class="heading heading-flex mb-3">
                        <div class="heading-left">
                            <h2 class="title">Sản phẩm mới</h2><!-- End .title -->
                        </div><!-- End .heading-left -->

                        <div class="heading-right">
                            <ul class="nav nav-pills nav-border-anim justify-content-center" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="new-all-link" data-toggle="tab" href="#new-all-tab" role="tab" aria-controls="new-all-tab" aria-selected="true">Tất cả</a>
                                </li>
                                <c:forEach items="${requestScope.listcat}" var="listcat">
                                    <li class="nav-item">
                                        <a class="nav-link" id="new-tv-link" data-toggle="tab" href="#new-${listcat.categoryName}-tab" role="tab" aria-controls="new-tv-tab" aria-selected="false">${listcat.categoryName}</a>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div><!-- End .heading-right -->
                    </div><!-- End .heading -->

                    <div class="tab-content tab-content-carousel just-action-icons-sm">
                        <div class="tab-pane p-0 fade show active" id="new-all-tab" role="tabpanel" aria-labelledby="new-all-link">
                            <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                                 data-owl-options='{
                                 "nav": true, 
                                 "dots": true,
                                 "margin": 20,
                                 "loop": false,
                                 "responsive": {
                                 "0": {
                                 "items":2
                                 },
                                 "480": {
                                 "items":2
                                 },
                                 "768": {
                                 "items":3
                                 },
                                 "992": {
                                 "items":4
                                 },
                                 "1200": {
                                 "items":5
                                 }
                                 }
                                 }'>
                                <c:set value="0" var="index"></c:set>
                                <c:forEach items="${requestScope.listallnew}" var="listallnew">
                                    <div class="product product-7">
                                        <figure class="product-media">
                                            <c:if test="${listallnew.is_sale==1}">
                                                <span class="product-label label-circle label-top">Sale</span>

                                            </c:if>
                                            <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                <c:if test="${listallfirstimage.productId==listallnew.productID}">
                                                    <a href="product?id=${listallnew.id}">
                                                        <img src="${listallfirstimage.imageUrl}" alt="Product image" class="product-image">
                                                    </a>
                                                </c:if>
                                            </c:forEach>

                                            <div class="product-action">
                                                <a href="buy?id=${listallnew.id}&quan=1" class="btn-product btn-cart" title="Add to cart"><span>Thêm vào giỏ hàng</span></a>
                                            </div><!-- End .product-action -->
                                        </figure><!-- End .product-media -->

                                        <div class="product-body">
                                            <div class="product-cat">
                                                <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                                    <c:if test="${listallproduct.productId==listallnew.productID}">
                                                        <c:forEach items="${requestScope.listcat}" var="listcat">
                                                            <c:if test="${listcat.categoryId==listallproduct.categoryId}">
                                                                <a href="shop?page=1&cid=${listcat.categoryId}&chipset=&screensize=0&priceFrom=0&priceTo=60000000">
                                                                    ${listcat.categoryName}
                                                                </a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </div><!-- End .product-cat -->
                                            <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                                <c:if test="${listallproduct.productId==listallnew.productID}">
                                                    <c:forEach items="${requestScope.listallcolor}" var="listallcolor">
                                                        <c:if test="${listallcolor.id==listallnew.colorId}">
                                                            <h3 class="product-title"><a href="product?id=${listallnew.id}">${listallproduct.name} ${listallnew.ram}GB ${listallnew.rom}GB ${listallcolor.name}</a></h3>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                            <!-- End .product-title -->
                                            <div class="product-price">
                                                <c:if test="${listallnew.is_sale==1}">
                                                    <span class="new-price"><fmt:formatNumber value="${listallnew.sale_price}" type="number" groupingUsed="true"/></span>
                                                    <span class="old-price">Giá cũ <fmt:formatNumber value="${listallnew.price}" type="number" groupingUsed="true"/></span>
                                                </c:if>
                                                <c:if test="${listallnew.is_sale!=1}">
                                                    <fmt:formatNumber value="${listallnew.price}" type="number" groupingUsed="true"/>

                                                </c:if>

                                            </div><!-- End .product-price -->
                                            <div class="ratings-container">
                                                <div class="full-stars-example-two1">
                                                    <div class="rating-group1">
                                                        <label style="font-size: 15px" aria-label="1 star" class="rating__label1" for="rating-1"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                        <input readonly class="rating__input1" id="rating-1" type="radio"
                                                               <c:if test="${requestScope.listReviewAllNew[index] ==1}">
                                                                   checked
                                                               </c:if>
                                                               >
                                                        <label style="font-size: 15px" aria-label="2 stars" class="rating__label1" for="rating-2"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                        <input readonly class="rating__input1" id="rating-2" type="radio"
                                                               <c:if test="${requestScope.listReviewAllNew[index] ==2}">
                                                                   checked
                                                               </c:if>
                                                               >
                                                        <label style="font-size: 15px" aria-label="3 stars" class="rating__label1" for="rating-3"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                        <input readonly class="rating__input1" id="rating-3" type="radio"
                                                               <c:if test="${requestScope.listReviewAllNew[index] ==3}">
                                                                   checked
                                                               </c:if>
                                                               >
                                                        <label style="font-size: 15px" aria-label="4 stars" class="rating__label1" for="rating-4"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                        <input readonly class="rating__input1" id="rating-4" type="radio"
                                                               <c:if test="${requestScope.listReviewAllNew[index] ==4}">
                                                                   checked
                                                               </c:if>
                                                               >
                                                        <label style="font-size: 15px" aria-label="5 stars" class="rating__label1" for="rating-5"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                        <input readonly class="rating__input1" id="rating-5" type="radio"
                                                               <c:if test="${requestScope.listReviewAllNew[index] ==5}">
                                                                   checked
                                                               </c:if>
                                                               >
                                                    </div>
                                                </div>
                                            </div><!-- End .rating-container -->
                                        </div><!-- End .product-body -->
                                    </div>
                                    <c:set value="${index+1}" var="index"></c:set>
                                </c:forEach>
                                <!-- End .product -->
                            </div><!-- End .owl-carousel -->
                        </div><!-- .End .tab-pane -->
                        <c:forEach var="i" begin="0" end="${fn:length(listcat) - 1}">

                            <div class="tab-pane p-0 fade" id="new-${listcat[i].categoryName}-tab" role="tabpanel" aria-labelledby="new-tv-link">
                                <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                                     data-owl-options='{
                                     "nav": true, 
                                     "dots": true,
                                     "margin": 20,
                                     "loop": false,
                                     "responsive": {
                                     "0": {
                                     "items":2
                                     },
                                     "480": {
                                     "items":2
                                     },
                                     "768": {
                                     "items":3
                                     },
                                     "992": {
                                     "items":4
                                     },
                                     "1200": {
                                     "items":5
                                     }
                                     }
                                     }'>
                                    <c:set var="nestedList" value="${listnewbycat[i]}" />
                                    <c:set value="${listReviewByCat[i]}" var="nestedReview"></c:set>
                                    <c:set value="0" var="index"></c:set>
                                    <c:forEach items="${nestedList}" var="nestedList">

                                        <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                            <c:if test="${listallproduct.productId == nestedList.productID}">
                                                <c:forEach items="${requestScope.listallcolor}" var="listallcolor">
                                                    <c:if test="${listallcolor.id == nestedList.colorId}">
                                                        <div class="product product-7">

                                                            <figure class="product-media">
                                                                <c:if test="${nestedList.is_sale==1}">
                                                                    <span class="product-label label-circle label-new">Sale</span>
                                                                </c:if>
                                                                <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                                    <c:if test="${listallfirstimage.productId == nestedList.productID}">
                                                                        <a href="product?id=${nestedList.id}">
                                                                            <img src="${listallfirstimage.imageUrl}" alt="Product image" class="product-image">
                                                                        </a>
                                                                    </c:if>
                                                                </c:forEach>

                                                                <div class="product-action">
                                                                    <a href="buy?id=${nestedList.id}&quan=1" class="btn-product btn-cart" title="Add to cart"><span>Thêm vào giỏ hàng</span></a>
                                                                </div><!-- End .product-action -->
                                                            </figure><!-- End .product-media -->

                                                            <div class="product-body">
                                                                <div class="product-cat">
                                                                    <a href="shop?page=1&cid=${listcat[i].categoryId}&chipset=&screensize=0&priceFrom=0&priceTo=60000000">${listcat[i].categoryName}</a>
                                                                </div><!-- End .product-cat -->
                                                                <h3 class="product-title"><a href="product?id=${nestedList.id}">${listallproduct.name} ${nestedList.ram}GB ${nestedList.rom}GB ${listallcolor.name}</a></h3><!-- End .product-title -->
                                                                <div class="product-price">
                                                                    <c:if test="${nestedList.is_sale==1}">
                                                                        <span class="new-price"><fmt:formatNumber value="${nestedList.sale_price}" type="number" groupingUsed="true"/></span>
                                                                        <span class="old-price">Giá cũ <fmt:formatNumber value="${nestedList.price}" type="number" groupingUsed="true"/></span>
                                                                    </c:if>
                                                                    <c:if test="${nestedList.is_sale!=1}">
                                                                        <fmt:formatNumber value="${nestedList.price}" type="number" groupingUsed="true"/>
                                                                    </c:if>

                                                                </div><!-- End .product-price -->
                                                                <div class="ratings-container">
                                                                    <div class="full-stars-example-two1">
                                                                        <div class="rating-group1">
                                                                            <label style="font-size: 15px" aria-label="1 star" class="rating__label1" for="rating-1"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                            <input readonly class="rating__input1" id="rating-1" type="radio"
                                                                                   <c:if test="${nestedReview[index] ==1}">
                                                                                       checked
                                                                                   </c:if>
                                                                                   >
                                                                            <label style="font-size: 15px" aria-label="2 stars" class="rating__label1" for="rating-2"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                            <input readonly class="rating__input1" id="rating-2" type="radio"
                                                                                   <c:if test="${nestedReview[index] ==2}">
                                                                                       checked
                                                                                   </c:if>
                                                                                   >
                                                                            <label style="font-size: 15px" aria-label="3 stars" class="rating__label1" for="rating-3"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                            <input readonly class="rating__input1" id="rating-3" type="radio"
                                                                                   <c:if test="${nestedReview[index] ==3}">
                                                                                       checked
                                                                                   </c:if>
                                                                                   >
                                                                            <label style="font-size: 15px" aria-label="4 stars" class="rating__label1" for="rating-4"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                            <input readonly class="rating__input1" id="rating-4" type="radio"
                                                                                   <c:if test="${nestedReview[index] ==4}">
                                                                                       checked
                                                                                   </c:if>
                                                                                   >
                                                                            <label style="font-size: 15px" aria-label="5 stars" class="rating__label1" for="rating-5"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                            <input readonly class="rating__input1" id="rating-5" type="radio"
                                                                                   <c:if test="${nestedReview[index] ==5}">
                                                                                       checked
                                                                                   </c:if>
                                                                                   >
                                                                        </div>
                                                                    </div>
                                                                </div><!-- End .rating-container -->
                                                            </div><!-- End .product-body -->
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:set value="${index+1}" var="index"></c:set>
                                    </c:forEach>            
                                </div><!-- End .owl-carousel -->
                            </div>
                        </c:forEach>
                    </div><!-- End .tab-content -->
                </div><!-- Xong san pham moi -->

                <div class="mb-6"></div><!-- End .mb-6 -->

                <div class="container">
                    <div class="cta cta-border mb-5" style="background-image: url(assets/images/demos/demo-4/bg-1.jpg);">
                        <img src="assets/images/demos/demo-4/camera.png" alt="camera" class="cta-img">
                        <div class="row justify-content-center">
                            <div class="col-md-12">
                                <div class="cta-content">
                                    <div class="cta-text text-right text-white">
                                        <p>Deal hấp dẫn <br><strong>Đủ các mặt hàng</strong></p>
                                    </div><!-- End .cta-text -->
                                    <a href="shop" class="btn btn-primary btn-round"><span>Mua ngay</span><i class="icon-long-arrow-right"></i></a>
                                </div><!-- End .cta-content -->
                            </div><!-- End .col-md-12 -->
                        </div><!-- End .row -->
                    </div><!-- End .cta -->
                </div><!-- End .container -->

                <div class="container" id="sale-products">
                    <div class="heading text-center mb-3">
                        <h2 class="title">Deal hời cho bạn</h2><!-- End .title -->
                        <p class="title-desc">Săn ngay kẻo lỡ</p><!-- End .title-desc -->
                    </div><!-- End .heading -->


                    <div class="tab-content tab-content-carousel just-action-icons-sm">
                        <div class="tab-pane p-0 fade show active" id="trending-top-tab" role="tabpanel" aria-labelledby="trending-top-link">
                            <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                                 data-owl-options='{
                                 "nav": true, 
                                 "dots": true,
                                 "margin": 20,
                                 "loop": false,
                                 "responsive": {
                                 "0": {
                                 "items":2
                                 },
                                 "480": {
                                 "items":2
                                 },
                                 "768": {
                                 "items":3
                                 },
                                 "992": {
                                 "items":4
                                 },
                                 "1200": {
                                 "items":5
                                 }
                                 }
                                 }'>
                                <c:set value="0" var="index"></c:set>
                                <c:forEach items="${requestScope.listsale}" var="listsale">
                                    <div class="product product-7">
                                        <figure class="product-media">
                                            <span class="product-label label-circle label-top">Sale</span>
                                            <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                <c:if test="${listallfirstimage.productId == listsale.productID}">
                                                    <a href="product?id=${listsale.id}">
                                                        <img src="${listallfirstimage.imageUrl}" alt="Product image" class="product-image">
                                                    </a>
                                                </c:if>
                                            </c:forEach>

                                            <div class="product-action">
                                                <a href="buy?id=${listsale.id}&quan=1" class="btn-product btn-cart" title="Add to cart"><span>Thêm vào giỏ hàng</span></a>
                                            </div><!-- End .product-action -->
                                        </figure><!-- End .product-media -->

                                        <div class="product-body">
                                            <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                                <c:if test="${listallproduct.productId == listsale.productID}">
                                                    <c:forEach items="${requestScope.listcat}" var="listcat">
                                                        <c:if test="${listcat.categoryId == listallproduct.categoryId}">
                                                            <div class="product-cat">
                                                                <a href="shop?page=1&cid=${listcat.categoryId}&chipset=&screensize=0&priceFrom=0&priceTo=60000000">${listcat.categoryName}</a>
                                                            </div><!-- End .product-cat -->
                                                        </c:if>
                                                    </c:forEach>

                                                    <c:forEach items="${requestScope.listallcolor}" var="listallcolor">
                                                        <c:if test="${listallcolor.id == listsale.colorId}">
                                                            <h3 class="product-title"><a href="product?id=${listsale.id}">${listallproduct.name} ${listsale.ram}GB ${listsale.rom}GB ${listallcolor.name}</a></h3><!-- End .product-title -->
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                            <div class="product-price">
                                                <span class="new-price"><fmt:formatNumber value="${listsale.sale_price}" type="number" groupingUsed="true"/></span>
                                                <span class="old-price">Giá cũ <fmt:formatNumber value="${listsale.price}" type="number" groupingUsed="true"/></span>
                                            </div><!-- End .product-price -->
                                            <div class="deal-countdown daily-deal-countdown" data-until="+${requestScope.listtime[index]}"></div>
                                            <div class="ratings-container">
                                                <div class="ratings">
                                                    <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                                </div><!-- End .ratings -->
                                            </div><!-- End .rating-container -->

                                        </div><!-- End .product-body -->
                                    </div>
                                    <c:set value="${index + 1}" var="index"></c:set>
                                </c:forEach>
                            </div><!-- End .owl-carousel -->
                        </div><!-- .End .tab-pane -->
                    </div><!-- End .tab-content -->

                </div><!-- End .container -->


                <div class="bg-light pt-5 pb-6">
                    <div class="container trending-products">
                        <div class="heading heading-flex mb-3">
                            <div class="heading-left">
                                <h2 class="title">Sản phẩm bán chạy</h2><!-- End .title -->
                            </div><!-- End .heading-left -->
                        </div><!-- End .heading -->



                        <div class="tab-content tab-content-carousel just-action-icons-sm">
                            <div class="tab-pane p-0 fade show active" id="trending-top-tab" role="tabpanel" aria-labelledby="trending-top-link">
                                <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                                     data-owl-options='{
                                     "nav": true, 
                                     "dots": true,
                                     "margin": 20,
                                     "loop": false,
                                     "responsive": {
                                     "0": {
                                     "items":2
                                     },
                                     "480": {
                                     "items":2
                                     },
                                     "768": {
                                     "items":3
                                     },
                                     "992": {
                                     "items":4
                                     },
                                     "1200": {
                                     "items":5
                                     }
                                     }
                                     }'>
                                    <c:forEach items="${requestScope.listAllTopSale}" var="listAllTopSale">
                                        <div class="product product-7">
                                            <figure class="product-media">
                                                <c:if test="${listAllTopSale.is_sale==1}">
                                                    <span class="product-label label-circle label-top">Sale</span>
                                                </c:if>
                                                <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                    <c:if test="${listallfirstimage.productId == listAllTopSale.productID}">
                                                        <a href="product?id=${listAllTopSale.id}">
                                                            <img src="${listallfirstimage.imageUrl}" alt="Product image" class="product-image">
                                                        </a>
                                                    </c:if>
                                                </c:forEach>

                                                <div class="product-action">
                                                    <a href="buy?id=${listAllTopSale.id}&quan=1" class="btn-product btn-cart" title="Add to cart"><span>Thêm vào giỏ hàng</span></a>
                                                </div><!-- End .product-action -->
                                            </figure><!-- End .product-media -->

                                            <div class="product-body">
                                                <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                                    <c:if test="${listallproduct.productId == listAllTopSale.productID}">
                                                        <c:forEach items="${requestScope.listcat}" var="listcat">
                                                            <c:if test="${listcat.categoryId == listallproduct.categoryId}">
                                                                <div class="product-cat">
                                                                    <a href="shop?page=1&cid=${listcat.categoryId}&chipset=&screensize=0&priceFrom=0&priceTo=60000000">${listcat.categoryName}</a>
                                                                </div><!-- End .product-cat -->
                                                            </c:if>
                                                        </c:forEach>

                                                        <c:forEach items="${requestScope.listallcolor}" var="listallcolor">
                                                            <c:if test="${listallcolor.id == listAllTopSale.colorId}">
                                                                <h3 class="product-title"><a href="product?id=${listAllTopSale.id}">${listallproduct.name} ${listAllTopSale.ram}GB ${listAllTopSale.rom}GB ${listallcolor.name}</a></h3><!-- End .product-title -->
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                                <div class="product-price">
                                                    <c:if test="${listAllTopSale.is_sale==1}">
                                                        <span class="new-price"><fmt:formatNumber value="${listAllTopSale.sale_price}" type="number" groupingUsed="true"/>đ</span>
                                                        <span class="old-price">Giá cũ <fmt:formatNumber value="${listAllTopSale.price}" type="number" groupingUsed="true"/>đ</span>
                                                    </c:if>
                                                    <c:if test="${listAllTopSale.is_sale!=1}">
                                                        <fmt:formatNumber value="${listAllTopSale.price}" type="number" groupingUsed="true"/>đ
                                                    </c:if>

                                                </div>
                                                <div class="ratings-container">
                                                    <c:set value="ko" var="checkhave"></c:set>
                                                    <c:forEach items="${requestScope.listAllAvgRating}" var="listAllAvgRating">
                                                        <c:if test="${listAllAvgRating.productDetailId == listAllTopSale.id}">
                                                            <c:set value="ok" var="checkhave"></c:set>
                                                                <div class="full-stars-example-two1">
                                                                    <div class="rating-group1">
                                                                        <label style="font-size: 15px" aria-label="1 star" class="rating__label1" for="rating-1"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                        <input readonly class="rating__input1" id="rating-1" type="radio"
                                                                        <c:if test="${listAllAvgRating.rating ==1}">
                                                                            checked
                                                                        </c:if>
                                                                        >
                                                                    <label style="font-size: 15px" aria-label="2 stars" class="rating__label1" for="rating-2"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                    <input readonly class="rating__input1" id="rating-2" type="radio"
                                                                           <c:if test="${listAllAvgRating.rating ==2}">
                                                                               checked
                                                                           </c:if>
                                                                           >
                                                                    <label style="font-size: 15px" aria-label="3 stars" class="rating__label1" for="rating-3"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                    <input readonly class="rating__input1" id="rating-3" type="radio"
                                                                           <c:if test="${listAllAvgRating.rating ==3}">
                                                                               checked
                                                                           </c:if>
                                                                           >
                                                                    <label style="font-size: 15px" aria-label="4 stars" class="rating__label1" for="rating-4"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                    <input readonly class="rating__input1" id="rating-4" type="radio"
                                                                           <c:if test="${listAllAvgRating.rating ==4}">
                                                                               checked
                                                                           </c:if>
                                                                           >
                                                                    <label style="font-size: 15px" aria-label="5 stars" class="rating__label1" for="rating-5"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                    <input readonly class="rating__input1" id="rating-5" type="radio"
                                                                           <c:if test="${listAllAvgRating.rating ==5}">
                                                                               checked
                                                                           </c:if>
                                                                           >
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${checkhave eq 'ko'}">
                                                        <div class="full-stars-example-two1">
                                                            <div class="rating-group1">
                                                                <label style="font-size: 15px" aria-label="1 star" class="rating__label1" for="rating-1"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                <input readonly class="rating__input1" id="rating-1" type="radio"

                                                                       >
                                                                <label style="font-size: 15px" aria-label="2 stars" class="rating__label1" for="rating-2"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                <input readonly class="rating__input1" id="rating-2" type="radio"

                                                                       >
                                                                <label style="font-size: 15px" aria-label="3 stars" class="rating__label1" for="rating-3"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                <input readonly class="rating__input1" id="rating-3" type="radio"

                                                                       >
                                                                <label style="font-size: 15px" aria-label="4 stars" class="rating__label1" for="rating-4"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                <input readonly class="rating__input1" id="rating-4" type="radio"

                                                                       >
                                                                <label style="font-size: 15px" aria-label="5 stars" class="rating__label1" for="rating-5"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                <input readonly class="rating__input1" id="rating-5" type="radio"
                                                                       checked
                                                                       >
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </div><!-- End .rating-container -->
                                            </div><!-- End .product-body -->
                                        </div>
                                    </c:forEach>
                                </div><!-- End .owl-carousel -->
                            </div><!-- .End .tab-pane -->
                        </div><!-- End .tab-content -->


                    </div><!-- End .container -->
                </div><!-- End .bg-light pt-5 pb-6 -->

                
                
                <div class="bg-light pt-5 pb-6">
                    <div class="container trending-products">
                        <div class="heading heading-flex mb-3">
                            <div class="heading-left">
                                <h2 class="title">Sản phẩm đánh giá cao</h2><!-- End .title -->
                            </div><!-- End .heading-left -->
                        </div><!-- End .heading -->



                        <div class="tab-content tab-content-carousel just-action-icons-sm">
                            <div class="tab-pane p-0 fade show active" id="trending-top-tab" role="tabpanel" aria-labelledby="trending-top-link">
                                <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                                     data-owl-options='{
                                     "nav": true, 
                                     "dots": true,
                                     "margin": 20,
                                     "loop": false,
                                     "responsive": {
                                     "0": {
                                     "items":2
                                     },
                                     "480": {
                                     "items":2
                                     },
                                     "768": {
                                     "items":3
                                     },
                                     "992": {
                                     "items":4
                                     },
                                     "1200": {
                                     "items":5
                                     }
                                     }
                                     }'>
                                    <c:forEach items="${requestScope.listAllTopRating}" var="listAllTopRating">
                                        <div class="product product-7">
                                            <figure class="product-media">
                                                <c:if test="${listAllTopRating.is_sale==1}">
                                                    <span class="product-label label-circle label-top">Sale</span>
                                                </c:if>
                                                <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                    <c:if test="${listallfirstimage.productId == listAllTopRating.productID}">
                                                        <a href="product?id=${listAllTopRating.id}">
                                                            <img src="${listallfirstimage.imageUrl}" alt="Product image" class="product-image">
                                                        </a>
                                                    </c:if>
                                                </c:forEach>

                                                <div class="product-action">
                                                    <a href="buy?id=${listAllTopRating.id}&quan=1" class="btn-product btn-cart" title="Add to cart"><span>Thêm vào giỏ hàng</span></a>
                                                </div><!-- End .product-action -->
                                            </figure><!-- End .product-media -->

                                            <div class="product-body">
                                                <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                                    <c:if test="${listallproduct.productId == listAllTopRating.productID}">
                                                        <c:forEach items="${requestScope.listcat}" var="listcat">
                                                            <c:if test="${listcat.categoryId == listallproduct.categoryId}">
                                                                <div class="product-cat">
                                                                    <a href="shop?page=1&cid=${listcat.categoryId}&chipset=&screensize=0&priceFrom=0&priceTo=60000000">${listcat.categoryName}</a>
                                                                </div><!-- End .product-cat -->
                                                            </c:if>
                                                        </c:forEach>

                                                        <c:forEach items="${requestScope.listallcolor}" var="listallcolor">
                                                            <c:if test="${listallcolor.id == listAllTopRating.colorId}">
                                                                <h3 class="product-title"><a href="product?id=${listAllTopRating.id}">${listallproduct.name} ${listAllTopRating.ram}GB ${listAllTopRating.rom}GB ${listallcolor.name}</a></h3><!-- End .product-title -->
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                                <div class="product-price">
                                                    <c:if test="${listAllTopRating.is_sale==1}">
                                                        <span class="new-price"><fmt:formatNumber value="${listAllTopRating.sale_price}" type="number" groupingUsed="true"/>đ</span>
                                                        <span class="old-price">Giá cũ <fmt:formatNumber value="${listAllTopRating.price}" type="number" groupingUsed="true"/>đ</span>
                                                    </c:if>
                                                    <c:if test="${listAllTopRating.is_sale!=1}">
                                                        <fmt:formatNumber value="${listAllTopRating.price}" type="number" groupingUsed="true"/>đ
                                                    </c:if>

                                                </div>
                                                <div class="ratings-container">
                                                    <c:forEach items="${requestScope.listAllAvgRating}" var="listAllAvgRating">
                                                        <c:if test="${listAllAvgRating.productDetailId == listAllTopRating.id}">
                                                           
                                                                <div class="full-stars-example-two1">
                                                                    <div class="rating-group1">
                                                                        <label style="font-size: 15px" aria-label="1 star" class="rating__label1" for="rating-1"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                        <input readonly class="rating__input1" id="rating-1" type="radio"
                                                                        <c:if test="${listAllAvgRating.rating ==1}">
                                                                            checked
                                                                        </c:if>
                                                                        >
                                                                    <label style="font-size: 15px" aria-label="2 stars" class="rating__label1" for="rating-2"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                    <input readonly class="rating__input1" id="rating-2" type="radio"
                                                                           <c:if test="${listAllAvgRating.rating ==2}">
                                                                               checked
                                                                           </c:if>
                                                                           >
                                                                    <label style="font-size: 15px" aria-label="3 stars" class="rating__label1" for="rating-3"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                    <input readonly class="rating__input1" id="rating-3" type="radio"
                                                                           <c:if test="${listAllAvgRating.rating ==3}">
                                                                               checked
                                                                           </c:if>
                                                                           >
                                                                    <label style="font-size: 15px" aria-label="4 stars" class="rating__label1" for="rating-4"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                    <input readonly class="rating__input1" id="rating-4" type="radio"
                                                                           <c:if test="${listAllAvgRating.rating ==4}">
                                                                               checked
                                                                           </c:if>
                                                                           >
                                                                    <label style="font-size: 15px" aria-label="5 stars" class="rating__label1" for="rating-5"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                    <input readonly class="rating__input1" id="rating-5" type="radio"
                                                                           <c:if test="${listAllAvgRating.rating ==5}">
                                                                               checked
                                                                           </c:if>
                                                                           >
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div><!-- End .rating-container -->
                                            </div><!-- End .product-body -->
                                        </div>
                                    </c:forEach>
                                </div><!-- End .owl-carousel -->
                            </div><!-- .End .tab-pane -->
                        </div><!-- End .tab-content -->


                    </div><!-- End .container -->
                </div>
                
                <div class="mb-5"></div><!-- End .mb-5 -->


                <div class="container">
                    <hr class="mb-0">
                </div><!-- End .container -->

                <div class="icon-boxes-container bg-transparent">
                    <div class="container">
                        <div class="row" style="justify-content: center">
                            <div class="col-sm-6 col-lg-3">
                                <div class="icon-box icon-box-side">
                                    <span class="icon-box-icon text-dark">
                                        <i class="icon-rocket"></i>
                                    </span>
                                    <div class="icon-box-content">
                                        <h3 class="icon-box-title">Giao hàng nhanh chóng</h3><!-- End .icon-box-title -->
                                        <p>Nhận hàng trong 1-2 ngày</p>
                                    </div><!-- End .icon-box-content -->
                                </div><!-- End .icon-box -->
                            </div><!-- End .col-sm-6 col-lg-3 -->

                            <div class="col-sm-6 col-lg-3">
                                <div class="icon-box icon-box-side">
                                    <span class="icon-box-icon text-dark">
                                        <i class="icon-rotate-left"></i>
                                    </span>

                                    <div class="icon-box-content">
                                        <h3 class="icon-box-title">Đổi trả</h3><!-- End .icon-box-title -->
                                        <p>Trong vòng 7 ngày</p>
                                    </div><!-- End .icon-box-content -->
                                </div><!-- End .icon-box -->
                            </div><!-- End .col-sm-6 col-lg-3 -->

                            <div class="col-sm-6 col-lg-3">
                                <div class="icon-box icon-box-side">
                                    <span class="icon-box-icon text-dark">
                                        <i class="icon-life-ring"></i>
                                    </span>

                                    <div class="icon-box-content">
                                        <h3 class="icon-box-title">Hỗ trợ tư vấn</h3><!-- End .icon-box-title -->
                                        <p>24/7</p>
                                    </div><!-- End .icon-box-content -->
                                </div><!-- End .icon-box -->
                            </div><!-- End .col-sm-6 col-lg-3 -->
                        </div><!-- End .row -->
                    </div><!-- End .container -->
                </div><!-- End .icon-boxes-container -->
            </main><!-- End .main -->

            <footer class="footer">

                <div class="footer-middle">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-lg-5">
                                <div class="widget widget-about" style="margin-bottom: 0">
                                    <img src="assets/images/demos/demo-4/logo-footer.png" class="footer-logo" alt="Footer Logo" width="105" height="25">
                                    <h4>Cửa hàng điện thoại uy tín số 1 Việt Nam </h4>

                                    <div class="widget-call">
                                        <i class="icon-phone"></i>
                                        Tổng đài tư vấn 24/7
                                        <a href="tel:#">18001010</a>         
                                    </div><!-- End .widget-call -->
                                </div><!-- End .widget about-widget -->
                            </div><!-- End .col-sm-6 col-lg-3 -->
                            <div class="col-sm-6 col-lg-7">
                                <h3 style="margin-top: 50px; margin-left: 160px">Nơi chất lượng tạo nên sự uy tín</h3>
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
        <script src="assets/js/jquery.plugin.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/jquery.countdown.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script src="assets/js/demos/demo-4.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var searchInput = document.getElementById('q');
                var searchForm = document.getElementById('searchForm');

                searchInput.addEventListener('keydown', function (event) {
                    if (event.key === 'Enter') {
                        event.preventDefault(); 
                        searchForm.submit();  
                    }
                });
            });
        </script>
    </body>

</html>