<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">


    <!-- molla/product.html  22 Nov 2019 09:54:50 GMT -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Sản phẩm</title>
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
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
        <!-- Main CSS File -->

        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/plugins/nouislider/nouislider.css">
        <script src="https://kit.fontawesome.com/f5cbf3afb2.js" crossorigin="anonymous"></script>
        <style>
            .breadcrumb-item+.breadcrumb-item:before{
                margin-top: 0.5rem;
            }
            .color-options {
                display: none;
            }
            td{
                font-size: 15px;
                font-weight: bold;
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
            #full-stars-example-two {

                /* use display:inline-flex to prevent whitespace issues. alternatively, you can put all the children of .rating-group on a single line */
                .rating-group {
                    display: inline-flex;
                }

                /* make hover effect work properly in IE */
                .rating__icon {
                    pointer-events: none;
                }

                /* hide radio inputs */
                .rating__input {
                    position: absolute !important;
                    left: -9999px !important;
                }

                /* hide 'none' input from screenreaders */
                .rating__input--none {
                    display: none
                }

                /* set icon padding and size */
                .rating__label {
                    cursor: pointer;
                    padding: 0 0.1em;
                    font-size: 2rem;
                }

                /* set default star color */
                .rating__icon--star {
                    color: orange;
                }

                /* if any input is checked, make its following siblings grey */
                .rating__input:checked ~ .rating__label .rating__icon--star {
                    color: #ddd;
                }

                /* make all stars orange on rating group hover */
                .rating-group:hover .rating__label .rating__icon--star {
                    color: orange;
                }

                /* make hovered input's following siblings grey on hover */
                .rating__input:hover ~ .rating__label .rating__icon--star {
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

                                    <div class="dropdown-menu dropdown-menu-right" style="top: 90px">
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

                                    <div class="dropdown-menu dropdown-menu-right" style="top:90px;width: 170px">
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

                                    <div class="dropdown-menu dropdown-menu-right" style="width: 400px;top:90px">
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
            </header><!-- End .header -->

            <main class="main">
                <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                    <div class="container d-flex align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                            <li class="breadcrumb-item"><a href="#">Sản phẩm</a></li>
                        </ol>
                    </div><!-- End .container -->
                </nav><!-- End .breadcrumb-nav -->

                <div class="page-content">
                    <div class="container">
                        <div class="product-details-top">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="product-gallery product-gallery-vertical">
                                        <div class="row" style="justify-content: center">
                                            <c:set value="0" var="index"></c:set>
                                                <figure class="product-main-image">
                                                    <img id="mainProductImage" src="${requestScope.productimg[index].imageUrl}" data-zoom-image="${requestScope.productimg[index].imageUrl}" alt="product image">

                                                <a href="#" id="btn-product-gallery" class="btn-product-gallery">
                                                    <i class="icon-arrows"></i>
                                                </a>
                                            </figure><!-- End .product-main-image -->
                                            <div class="product-image-gallery-container" style="display: flex; align-items: center">
                                                <button id="prev" class="nav-arrow"><i class="icon-arrow-left"></i></button>
                                                <div class="product-image-gallery" style="display: flex; overflow: hidden; min-width: 500px">
                                                    <c:forEach items="${requestScope.productimg}" var="productimg">
                                                        <a class="product-gallery-item" href="#" data-image="${productimg.imageUrl}">
                                                            <img src="${productimg.imageUrl}" alt="product side">
                                                        </a>
                                                    </c:forEach>
                                                </div><!-- End .product-image-gallery -->
                                                <button id="next" class="nav-arrow"><i class="icon-arrow-right"></i></button>
                                            </div>
                                        </div><!-- End .row -->
                                    </div><!-- End .product-gallery -->
                                </div><!-- End .col-md-6 -->
                                <div id="imageModal" class="modal">
                                    <span class="close">&times;</span>
                                    <img class="modal-content" id="modalImage">
                                </div>

                                <div class="col-md-6">
                                    <div class="product-details">
                                        <c:forEach items="${requestScope.colorlist}" var="colorlist">
                                            <c:if test="${colorlist.id == requestScope.productdetail.colorId}">
                                                <h1 class="product-title">${requestScope.product.name} ${requestScope.productdetail.ram}GB ${requestScope.productdetail.rom}GB ${colorlist.name}</h1><!-- End .product-title -->
                                            </c:if>
                                        </c:forEach>
                                        <div class="ratings-container">
                                            <div class="full-stars-example-two1">
                                                <div class="rating-group1">

                                                    <label style="font-size: 15px" aria-label="1 star" class="rating__label1" for="rating-1"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                    <input readonly class="rating__input1" id="rating-1" type="radio"
                                                           <c:if test="${requestScope.rating ==1}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label style="font-size: 15px" aria-label="2 stars" class="rating__label1" for="rating-2"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                    <input readonly class="rating__input1" id="rating-2" type="radio"
                                                           <c:if test="${requestScope.rating ==2}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label style="font-size: 15px" aria-label="3 stars" class="rating__label1" for="rating-3"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                    <input readonly class="rating__input1" id="rating-3" type="radio"
                                                           <c:if test="${requestScope.rating ==3}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label style="font-size: 15px" aria-label="4 stars" class="rating__label1" for="rating-4"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                    <input readonly class="rating__input1" id="rating-4" type="radio"
                                                           <c:if test="${requestScope.rating ==4}">
                                                               checked
                                                           </c:if>
                                                           >
                                                    <label style="font-size: 15px" aria-label="5 stars" class="rating__label1" for="rating-5"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                    <input readonly class="rating__input1" id="rating-5" type="radio"
                                                           <c:if test="${requestScope.rating ==5}">
                                                               checked
                                                           </c:if>
                                                           >
                                                </div>
                                            </div>
                                            <a class="ratings-text" href="#product-review-link" id="review-link">( ${requestScope.numReview} đánh giá )</a>
                                        </div><!-- End .rating-container -->

                                        <div class="product-price" style="margin-top: 30px;margin-bottom: 30px">
                                            <c:if test="${productdetail.is_sale==1}">
                                                <span class="new-price"><fmt:formatNumber value="${productdetail.sale_price}" type="number" groupingUsed="true"/>đ</span>
                                                <span class="old-price">Giá cũ <fmt:formatNumber value="${productdetail.price}" type="number" groupingUsed="true"/>đ</span>
                                            </c:if>
                                            <c:if test="${productdetail.is_sale!=1}">
                                                <fmt:formatNumber value="${productdetail.price}" type="number" groupingUsed="true"/>đ

                                            </c:if>
                                        </div><!-- End .product-price -->

                                        <div class="details-filter-row details-row-size">

                                            <div class="product-nav product-nav-thumbs">
                                                <c:forEach items="${requestScope.listramrom}" var="listramrom">
                                                    <div>
                                                        <a href="#" class="ram-rom-option"  data-ram="${listramrom.ram}" data-rom="${listramrom.rom}" style="border: solid 1px #ccc; width: 60px;text-align: center;height: 60px">
                                                            <div>
                                                                <p style="font-weight: bold; font-size: larger">${listramrom.ram}GB ${listramrom.rom}GB</p>
                                                            </div>

                                                        </a>
                                                        <div class="details-filter-row details-row-size color-options" data-ram="${listramrom.ram}" data-rom="${listramrom.rom}" style="display: none; position: absolute; margin-top: 10px">

                                                            <div class="product-nav product-nav-thumbs" >
                                                                <c:forEach items="${requestScope.listtypepro}" var="listtypepro">
                                                                    <c:if test="${listtypepro.ram == listramrom.ram && listtypepro.rom == listramrom.rom}">
                                                                        <a href="product?id=${listtypepro.id}" class="product-color" data-color="${listtypepro.colorId}" style="width: 120px;text-align: center;display: flex;justify-content: center;height: 60px">
                                                                            <div>
                                                                                <c:forEach items="${requestScope.colorlist}" var="colorlist">
                                                                                    <c:if test="${colorlist.id ==listtypepro.colorId}">
                                                                                        <p style="font-weight: bold; font-size: larger">${colorlist.name}</p>
                                                                                        <p style="color: #3399ff;font-size: larger"><fmt:formatNumber value="${listtypepro.price}" type="number" groupingUsed="true"/>đ</p>
                                                                                    </c:if>
                                                                                </c:forEach>


                                                                            </div>

                                                                        </a>
                                                                    </c:if>

                                                                </c:forEach>
                                                            </div><!-- End .product-nav -->
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div><!-- End .product-nav -->
                                        </div><!-- End .details-filter-row -->
                                        <form action="buy">
                                            <input type="text" name="id" value="${productdetail.id}" hidden>
                                            <div class="details-filter-row details-row-size" style="margin-top: 100px">
                                                <label for="qty">Số lượng:</label>
                                                <div class="product-details-quantity">
                                                    <input type="number" name="quan" id="qty" class="form-control" value="1" min="1" max="${requestScope.productdetail.stockQuantity}" step="1" data-decimals="0" required>
                                                </div><!-- End .product-details-quantity -->
                                            </div><!-- End .details-filter-row -->

                                            <div class="product-details-action">
                                                <button type="submit" class="btn-product btn-cart"><span>Thêm vào giỏ hàng</span></button>
                                            </div><!-- End .product-details-action -->
                                        </form>

                                    </div><!-- End .product-details -->
                                </div><!-- End .col-md-6 -->
                            </div><!-- End .row -->
                        </div><!-- End .product-details-top -->

                        <div class="product-details-tab">
                            <ul class="nav nav-pills justify-content-center" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="product-desc-link" data-toggle="tab" href="#product-desc-tab" role="tab" aria-controls="product-desc-tab" aria-selected="true">Mô tả sản phẩm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="product-info-link" data-toggle="tab" href="#product-info-tab" role="tab" aria-controls="product-info-tab" aria-selected="false">Thông số kĩ thuật</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="product-review-link" data-toggle="tab" href="#product-review-tab" role="tab" aria-controls="product-review-tab" aria-selected="false">Đánh giá (${requestScope.numReview})</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="product-desc-tab" role="tabpanel" aria-labelledby="product-desc-link">
                                    <div class="product-desc-content">
                                        <p style="font-size: 18px">${requestScope.product.description}</p>
                                    </div><!-- End .product-desc-content -->
                                </div><!-- .End .tab-pane -->
                                <div class="tab-pane fade" id="product-info-tab" role="tabpanel" aria-labelledby="product-info-link">
                                    <div class="product-desc-content" style="display: flex; justify-content: center">
                                        <table class="table  table-hover" style="width: 50%">
                                            <tbody>
                                                <tr>
                                                    <td>Kích thước màn hình</td>
                                                    <td>${requestScope.productdetail.sreenSize} inch</td>
                                                </tr>
                                                <tr>
                                                    <td>Công nghệ màn hình</td>
                                                    <td>${requestScope.productdetail.screenTech}</td>
                                                </tr>
                                                <tr>
                                                    <td>Camera sau</td>
                                                    <td>${requestScope.productdetail.backCam}</td>
                                                </tr>
                                                <tr>
                                                    <td>Camera trước</td>
                                                    <td>${requestScope.productdetail.frontCam}</td>
                                                </tr>
                                                <tr>
                                                    <td>Chip set</td>
                                                    <td>${requestScope.productdetail.chipset}</td>
                                                </tr>
                                                <tr>
                                                    <td>Dung lượng RAM</td>
                                                    <td>${requestScope.productdetail.ram} GB</td>
                                                </tr>
                                                <tr>
                                                    <td>Bộ nhớ trong</td>
                                                    <td>${requestScope.productdetail.rom} GB</td>
                                                </tr>
                                                <tr>
                                                    <td>Pin</td>
                                                    <td>${requestScope.productdetail.battery} mAh</td>
                                                </tr>
                                                <tr>
                                                    <td>Thẻ sim</td>
                                                    <td>${requestScope.productdetail.sim}</td>
                                                </tr>
                                                <tr>
                                                    <td>Hệ điều hành</td>
                                                    <td>${requestScope.productdetail.getOS()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Tần số quét</td>
                                                    <td>${requestScope.productdetail.refreshRate} Hz</td>
                                                </tr>
                                            </tbody>  
                                        </table>
                                    </div><!-- End .product-desc-content -->
                                </div><!-- .End .tab-pane -->
                                <div class="tab-pane fade" id="product-review-tab" role="tabpanel" aria-labelledby="product-review-link">
                                    <div class="reviews">
                                        <h3>Đánh giá (${requestScope.numReview})</h3>
                                        <c:forEach items="${requestScope.listreview}" var="listreview">
                                            <div class="review">
                                                <div class="row no-gutters">
                                                    <div class="col-auto">
                                                        <c:forEach items="${requestScope.listuser}" var="listuser">
                                                            <c:if test="${listuser.userId == listreview.userId}">
                                                                <h4><a href="">${listuser.name}</a></h4>
                                                                </c:if>
                                                            </c:forEach>

                                                        <div class="full-stars-example-two1">
                                                            <div class="rating-group1">

                                                                <label style="font-size: 15px" aria-label="1 star" class="rating__label1" for="rating-1"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                <input readonly class="rating__input1" id="rating-1" type="radio"
                                                                       <c:if test="${listreview.rating ==1}">
                                                                           checked
                                                                       </c:if>
                                                                       >
                                                                <label style="font-size: 15px" aria-label="2 stars" class="rating__label1" for="rating-2"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                <input readonly class="rating__input1" id="rating-2" type="radio"
                                                                       <c:if test="${listreview.rating ==2}">
                                                                           checked
                                                                       </c:if>
                                                                       >
                                                                <label style="font-size: 15px" aria-label="3 stars" class="rating__label1" for="rating-3"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                <input readonly class="rating__input1" id="rating-3" type="radio"
                                                                       <c:if test="${listreview.rating ==3}">
                                                                           checked
                                                                       </c:if>
                                                                       >
                                                                <label style="font-size: 15px" aria-label="4 stars" class="rating__label1" for="rating-4"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                <input readonly class="rating__input1" id="rating-4" type="radio"
                                                                       <c:if test="${listreview.rating ==4}">
                                                                           checked
                                                                       </c:if>
                                                                       >
                                                                <label style="font-size: 15px" aria-label="5 stars" class="rating__label1" for="rating-5"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                <input readonly class="rating__input1" id="rating-5" type="radio"
                                                                       <c:if test="${listreview.rating ==5}">
                                                                           checked
                                                                       </c:if>
                                                                       >
                                                            </div>
                                                        </div>
                                                        <span class="review-date">6 days ago</span>
                                                    </div><!-- End .col -->
                                                    <div class="col">
                                                        <div class="review-content">
                                                            <p>${listreview.comment}</p>
                                                        </div><!-- End .review-content -->
                                                    </div><!-- End .col-auto -->
                                                </div><!-- End .row -->
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <form action="review"  method="post">
                                        <div class="row">

                                            <input type="hidden" name="productID" value="${productdetail.id}">
                                            <div class="col-2">
                                                <div>
                                                    <img src="images/avatar-15.png" alt="alt" style="width: 40%;margin-left: 30px"/>
                                                </div>
                                                <div>
                                                    ${sessionScope.account.name}
                                                </div>
                                            </div>
                                            <div class="col-8">
                                                <div id="full-stars-example-two">
                                                    <div class="rating-group">
                                                        <input disabled checked class="rating__input rating__input--none" name="rating" id="rating3-none" value="0" type="radio">
                                                        <label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                                                        <input class="rating__input" name="rating" id="rating3-1" value="1" type="radio">
                                                        <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                                                        <input class="rating__input" name="rating" id="rating3-2" value="2" type="radio">
                                                        <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                                                        <input class="rating__input" name="rating" id="rating3-3" value="3" type="radio">
                                                        <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                                                        <input class="rating__input" name="rating" id="rating3-4" value="4" type="radio">
                                                        <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                                                        <input class="rating__input" name="rating" id="rating3-5" value="5" type="radio">
                                                    </div>
                                                </div>
                                                <div class="comment" style="height: 100px">
                                                    <textarea name="comment" placeholder="Viết đánh giá của bạn..." required style="width: 100%; height: 100%"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-2" style="display: flex; align-items: center">
                                                <div class="btn-wrap">
                                                    <button type="submit" class="btn btn-primary btn-round">Đánh giá</button>
                                                </div>
                                            </div>

                                        </div>
                                    </form>
                                </div><!-- .End .tab-pane -->
                            </div><!-- End .tab-content -->
                        </div><!-- End .product-details-tab -->

                        <h2 class="title text-center mb-4">Sản phẩm tương tự</h2><!-- End .title text-center -->

                        <div class="owl-carousel owl-simple carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                             data-owl-options='{
                             "nav": false, 
                             "dots": true,
                             "margin": 20,
                             "loop": false,
                             "responsive": {
                             "0": {
                             "items":1
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
                             "items":4,
                             "nav": true,
                             "dots": false
                             }
                             }
                             }'>
                            <c:forEach items="${requestScope.listmustlike}" var="listmustlike">
                                <div class="product product-7 text-center">
                                    <figure class="product-media">
                                        <c:if test="${listmustlike.is_sale==1}">
                                            <span class="product-label label-new">Sale</span>
                                        </c:if>

                                        <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                            <c:if test="${listallfirstimage.productId == listmustlike.productID}">
                                                <a href="product?id=${listmustlike.id}">
                                                    <img src="${listallfirstimage.imageUrl}" alt="Product image" class="product-image">
                                                </a>
                                            </c:if>
                                        </c:forEach>
                                        <div class="product-action">
                                            <a href="buy?id=${listmustlike.id}&quan=1" class="btn-product btn-cart"><span>Thêm vào giỏ hàng</span></a>
                                        </div><!-- End .product-action -->
                                    </figure><!-- End .product-media -->

                                    <div class="product-body">
                                        <c:forEach items="${requestScope.listallproduct}" var="listallproduct">
                                            <c:if test="${listallproduct.productId == listmustlike.productID}">
                                                <c:forEach items="${requestScope.listcat}" var="listcat">
                                                    <c:if test="${listcat.categoryId == listallproduct.categoryId}">
                                                        <div class="product-cat">
                                                            <a href="shop?page=1&cid=${listcat.categoryId}&chipset=&screensize=0&priceFrom=0&priceTo=60000000">${listcat.categoryName}</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${requestScope.colorlist}" var="colorlist">
                                                    <c:if test="${colorlist.id == listmustlike.colorId}">
                                                        <h3 class="product-title"><a href="product?id=${listmustlike.id}">${listallproduct.name} ${listmustlike.ram}GB ${listmustlike.rom}GB ${colorlist.name}</a></h3>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>

                                        </c:forEach>
                                        <!-- End .product-title -->
                                        <div class="product-price">
                                            <c:if test="${listmustlike.is_sale==1}">
                                                <span class="new-price"><fmt:formatNumber value="${listmustlike.sale_price}" type="number" groupingUsed="true"/>đ</span>
                                                <span class="old-price">Giá cũ <fmt:formatNumber value="${listmustlike.price}" type="number" groupingUsed="true"/>đ</span>
                                            </c:if>
                                            <c:if test="${listmustlike.is_sale!=1}">
                                                <fmt:formatNumber value="${listmustlike.price}" type="number" groupingUsed="true"/>đ
                                            </c:if>
                                        </div><!-- End .product-price -->
                                        <div class="ratings-container">
                                            <c:set value="ko" var="checkhave"></c:set>
                                            <c:forEach items="${requestScope.listAllAvgRating}" var="listAllAvgRating">
                                                <c:if test="${listAllAvgRating.productDetailId == listmustlike.id}">
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
                                        </div><!-- End .rating-container --><!-- End .product-nav -->
                                    </div><!-- End .product-body -->
                                </div>
                            </c:forEach>
                        </div><!-- End .owl-carousel -->
                    </div><!-- End .container -->
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
        <!-- Plugins JS File -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.hoverIntent.min.js"></script>
        <script src="assets/js/jquery.waypoints.min.js"></script>
        <script src="assets/js/superfish.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/bootstrap-input-spinner.js"></script>

        <script src="assets/js/bootstrap-input-spinner.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const mainImage = document.getElementById('mainProductImage');
                const galleryItems = document.querySelectorAll('.product-gallery-item');

                galleryItems.forEach(item => {
                    item.addEventListener('click', function (event) {
                        event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết
                        const newImageSrc = this.getAttribute('data-image');
                        mainImage.src = newImageSrc;
                        mainImage.setAttribute('data-zoom-image', newImageSrc);
                    });
                });
            });
            document.addEventListener('DOMContentLoaded', function () {
                const mainImage = document.getElementById('mainProductImage');
                const galleryItems = document.querySelectorAll('.product-gallery-item');
                const galleryContainer = document.querySelector('.product-image-gallery');
                const prevButton = document.getElementById('prev');
                const nextButton = document.getElementById('next');
                const modal = document.getElementById('imageModal');
                const modalImg = document.getElementById('modalImage');
                const closeModal = document.getElementsByClassName('close')[0];
                const btnGallery = document.getElementById('btn-product-gallery');

                let currentIndex = 0;
                const itemsPerPage = 5;

                function updateGalleryDisplay() {
                    galleryItems.forEach((item, index) => {
                        if (index >= currentIndex && index < currentIndex + itemsPerPage) {
                            item.style.display = 'block';
                        } else {
                            item.style.display = 'none';
                        }
                    });
                }

                galleryItems.forEach(item => {
                    item.addEventListener('click', function (event) {
                        event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết
                        const newImageSrc = this.getAttribute('data-image');
                        mainImage.src = newImageSrc;
                        mainImage.setAttribute('data-zoom-image', newImageSrc);
                    });
                });

                prevButton.addEventListener('click', function () {
                    if (currentIndex > 0) {
                        currentIndex -= itemsPerPage;
                        updateGalleryDisplay();
                    }
                });

                nextButton.addEventListener('click', function () {
                    if (currentIndex + itemsPerPage < galleryItems.length) {
                        currentIndex += itemsPerPage;
                        updateGalleryDisplay();
                    }
                });

                btnGallery.addEventListener('click', function (event) {
                    event.preventDefault();
                    modal.style.display = "block";
                    modalImg.src = mainImage.src;
                });

                closeModal.addEventListener('click', function () {
                    modal.style.display = "none";
                });

                window.addEventListener('click', function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                });

                updateGalleryDisplay(); // Initialize the display
            });
            document.addEventListener('DOMContentLoaded', function () {
                const ramRomOptions = document.querySelectorAll('.ram-rom-option');

                ramRomOptions.forEach(option => {
                    option.addEventListener('click', function (event) {
                        event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết

                        // Lấy giá trị RAM và ROM từ thuộc tính data
                        const ram = this.getAttribute('data-ram');
                        const rom = this.getAttribute('data-rom');

                        // Ẩn tất cả các nhóm màu
                        document.querySelectorAll('.color-options').forEach(colorOption => {
                            colorOption.style.display = 'none';
                        });

                        // Hiển thị nhóm màu tương ứng
                        const target = document.querySelector('.color-options[data-ram="' + ram + '"][data-rom="' + rom + '"]');

                        target.style.display = 'block';

                    });
                });
            });
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy sản phẩm hiện tại hoặc thông tin sản phẩm từ server-side nếu cần
                const currentProductId = getCurrentProductId(); // Hàm này cần được cài đặt để lấy ID sản phẩm hiện tại

                // Tìm và chọn ô RAM và ROM tương ứng với sản phẩm
                const ramRomOptions = document.querySelectorAll('.ram-rom-option');
                ramRomOptions.forEach(option => {
                    const ram = option.getAttribute('data-ram');
                    const rom = option.getAttribute('data-rom');
                    if (ram && rom) {
                        // Kiểm tra điều kiện nếu sản phẩm khớp với RAM và ROM của tùy chọn
                        if (matchesCurrentProduct(currentProductId, ram, rom)) {
                            option.classList.add('active'); // Thêm lớp active cho tùy chọn đã chọn
                            // Hiển thị màu sắc tương ứng
                            const colorOptions = document.querySelector('.color-options[data-ram="' + ram + '"][data-rom="' + rom + '"]');
                            if (colorOptions) {
                                colorOptions.style.display = 'block';
                                // Chọn màu sắc tương ứng nếu cần
                                const productColors = colorOptions.querySelectorAll('.product-color');
                                productColors.forEach(color => {
                                    const colorId = color.getAttribute('data-color');
                                    if (colorId && matchesCurrentProductColor(currentProductId, colorId)) {
                                        color.classList.add('active'); // Thêm lớp active cho màu sắc đã chọn
                                    }
                                });
                            }
                        }
                    }
                });
            });
            function getCurrentProductId() {
                return ${requestScope.productdetail.id}; // Lấy ID sản phẩm từ đối tượng product trong requestScope
            }

            // Hàm kiểm tra khớp RAM và ROM với sản phẩm hiện tại
            function matchesCurrentProduct(productId, ram, rom) {
                // Kiểm tra productId, ram và rom với thuộc tính của đối tượng product
                if (${requestScope.productdetail.id} === productId && '${requestScope.productdetail.ram}' === ram && '${requestScope.productdetail.rom}' === rom) {
                    return true;
                } else {
                    return false;
                }
            }

            // Hàm kiểm tra màu sắc đã chọn của sản phẩm
            function matchesCurrentProductColor(productId, colorId) {
                // Kiểm tra productId và colorId với thuộc tính của đối tượng product
                if (${requestScope.productdetail.id} === productId && '${requestScope.productdetail.colorId}' === colorId) {
                    return true;
                } else {
                    return false;
                }
            }

            // Tạm thời sử dụng console để kiểm tra kết quả, bạn có thể thay đổi để thực hiện các hành động khác
            console.log('Current Product ID:', getCurrentProductId());
        </script>
    </body>


    <!-- molla/product.html  22 Nov 2019 09:55:05 GMT -->
</html>