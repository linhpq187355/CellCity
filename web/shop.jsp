<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="vi">


    <!-- molla/category-4cols.html  22 Nov 2019 10:02:52 GMT -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Tất cả sản phẩm</title>
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
        <link rel="stylesheet" href="assets/css/bootstrap.min_2.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/plugins/nouislider/nouislider.css">
        <script src="https://kit.fontawesome.com/f5cbf3afb2.js" crossorigin="anonymous"></script>
        <style>
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
                                        <button class="btn btn-primary" type="submit" style="background: transparent;color: #000"><i class="icon-search"></i></button>
                                        <input type="search" class="form-control" name="search" id="q" placeholder="Tìm kiếm sản phẩm ..." value="${requestScope.search}" required>
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
                                                <h4 class="compare-product-title"><a href="signin?direct=shop">Đăng nhập</a></h4>
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
                                </div>
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
                                                <h4 class="compare-product-title"><a href="logout?direct=shop">Đăng xuất</a></h4>
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
                                                            <c:forEach items="${requestScope.listpro}" var="listallproduct">
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
                                </div>
                            </div>
                        </c:if>
                    </div><!-- End .container -->
                </div><!-- End .header-middle -->

                <div class="header-bottom sticky-header">
                    <div class="container">


                        <div class="header-center">
                            <nav class="main-nav">
                                <ul class="menu sf-arrows">
                                    <li>
                                        <a href="home">Trang chủ</a>
                                    </li>
                                    <li class="megamenu-container active">
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
                        <h1 class="page-title">Tất cả sản phẩm</h1>
                    </div><!-- End .container -->
                </div><!-- End .page-header -->
                <nav aria-label="breadcrumb" class="breadcrumb-nav mb-2">
                    <div class="container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>

                            <li class="breadcrumb-item active" aria-current="page">Tất cả sản phẩm</li>
                        </ol>
                    </div><!-- End .container -->
                </nav><!-- End .breadcrumb-nav -->

                <div class="page-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9">
                                <div class="toolbox">
                                    <div class="toolbox-left">
                                        <div class="toolbox-info">
                                            Tổng số <span>${totalProducts}</span> Sản phẩm
                                        </div><!-- End .toolbox-info -->
                                    </div><!-- End .toolbox-left -->

                                    <div class="toolbox-right">
                                        <div class="toolbox-sort">
                                            <label for="sortby">Sắp xếp theo:</label>
                                            <div class="select-custom">
                                                <select name="sortby" id="sortby" class="form-control" onchange="updateSortAndSubmit()">
                                                    <option value="all"
                                                            <c:if test="${requestScope.sortBy eq 'all' || empty requestScope.sortBy}">
                                                                selected="selected"
                                                            </c:if>>Tất cả</option>
                                                    <option <c:if test="${requestScope.sortBy eq 'new'}">
                                                            selected="selected"
                                                        </c:if> value="new">Mới nhất</option>
                                                    <option <c:if test="${requestScope.sortBy eq 'price-high'}">
                                                            selected="selected"
                                                        </c:if> value="price-high">Giá cao nhất</option>
                                                    <option <c:if test="${requestScope.sortBy eq 'price-low'}">
                                                            selected="selected"
                                                        </c:if> value="price-low">Giá thấp nhất</option>
                                                </select>
                                            </div>
                                        </div><!-- End .toolbox-sort -->

                                    </div><!-- End .toolbox-right -->
                                </div><!-- End .toolbox -->

                                <div class="products mb-3">
                                    <div class="row justify-content-center">
                                        <c:set value="0" var="index"></c:set>
                                        <c:forEach items="${requestScope.slicedProducts}" var="slicedProducts">
                                            <div class="col-6 col-md-4 col-lg-4 col-xl-3">
                                                <div class="product product-7 text-center">
                                                    <figure class="product-media">
                                                        <c:if test="${slicedProducts.is_sale==1}">
                                                            <span class="product-label label-new">Sale</span>
                                                        </c:if>
                                                        <c:forEach items="${requestScope.listpro}" var="listpro">
                                                            <c:if test="${listpro.productId == slicedProducts.productID}">
                                                                <c:forEach items="${requestScope.listallfirstimage}" var="listallfirstimage">
                                                                    <c:if test="${listallfirstimage.productId == listpro.productId}">
                                                                        <a href="product?id=${slicedProducts.id}">
                                                                            <img src="${listallfirstimage.imageUrl}" alt="Product image" class="product-image">
                                                                        </a>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:if>

                                                        </c:forEach>
                                                        <div class="product-action">
                                                            <a href="buy?id=${slicedProducts.id}&quan=1" class="btn-product btn-cart"><span>Thêm vào giỏ hàng</span></a>
                                                        </div><!-- End .product-action -->
                                                    </figure><!-- End .product-media -->
                                                    <c:forEach items="${requestScope.listpro}" var="listpro">
                                                        <c:if test="${listpro.productId == slicedProducts.productID}">
                                                            <div class="product-body">
                                                                <c:forEach items="${requestScope.listcat}" var="listcat">
                                                                    <c:if test="${listcat.categoryId == listpro.categoryId}">
                                                                        <div class="product-cat">
                                                                            <a href="#">${listcat.categoryName}</a>
                                                                        </div>
                                                                    </c:if>

                                                                </c:forEach>
                                                                <!-- End .product-cat -->
                                                                <c:forEach items="${requestScope.listallcolor}" var="listallcolor">
                                                                    <c:if test="${listallcolor.id == slicedProducts.colorId}">
                                                                        <h3 class="product-title"><a href="product?id=${slicedProducts.id}">${listpro.name} ${slicedProducts.rom}GB ${slicedProducts.ram}GB ${listallcolor.name}</a></h3><!-- End .product-title -->
                                                                    </c:if>
                                                                </c:forEach>
                                                                <div class="product-price">
                                                                    <c:if test="${slicedProducts.is_sale==1}">
                                                                        <span class="new-price"><fmt:formatNumber value="${slicedProducts.sale_price}" type="number" groupingUsed="true"/></span>
                                                                        <span class="old-price">Giá cũ <fmt:formatNumber value="${slicedProducts.price}" type="number" groupingUsed="true"/></span>
                                                                    </c:if>
                                                                    <c:if test="${slicedProducts.is_sale!=1}">
                                                                        <fmt:formatNumber value="${slicedProducts.price}" type="number" groupingUsed="true"/>

                                                                    </c:if>
                                                                </div><!-- End .product-price -->
                                                                <div class="ratings-container">
                                                                    <div class="full-stars-example-two1">
                                                                        <div class="rating-group1">
                                                                            <label style="font-size: 15px" aria-label="1 star" class="rating__label1" for="rating-1"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                            <input readonly class="rating__input1" id="rating-1" type="radio"
                                                                                   <c:if test="${requestScope.listRatingPro[index] ==1}">
                                                                                       checked
                                                                                   </c:if>
                                                                                   >
                                                                            <label style="font-size: 15px" aria-label="2 stars" class="rating__label1" for="rating-2"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                            <input readonly class="rating__input1" id="rating-2" type="radio"
                                                                                   <c:if test="${requestScope.listRatingPro[index] ==2}">
                                                                                       checked
                                                                                   </c:if>
                                                                                   >
                                                                            <label style="font-size: 15px" aria-label="3 stars" class="rating__label1" for="rating-3"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                            <input readonly class="rating__input1" id="rating-3" type="radio"
                                                                                   <c:if test="${requestScope.listRatingPro[index] ==3}">
                                                                                       checked
                                                                                   </c:if>
                                                                                   >
                                                                            <label style="font-size: 15px" aria-label="4 stars" class="rating__label1" for="rating-4"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                            <input readonly class="rating__input1" id="rating-4" type="radio"
                                                                                   <c:if test="${requestScope.listRatingPro[index] ==4}">
                                                                                       checked
                                                                                   </c:if>
                                                                                   >
                                                                            <label style="font-size: 15px" aria-label="5 stars" class="rating__label1" for="rating-5"><i class="rating__icon1 rating__icon--star1 fa fa-star"></i></label>
                                                                            <input readonly class="rating__input1" id="rating-5" type="radio"
                                                                                   <c:if test="${requestScope.listRatingPro[index] ==5}">
                                                                                       checked
                                                                                   </c:if>
                                                                                   >
                                                                        </div>
                                                                    </div>
                                                                </div><!-- End .rating-container -->

                                                                <!-- End .product-nav -->
                                                            </div>
                                                        </c:if>

                                                    </c:forEach>
                                                    <!-- End .product-body -->
                                                </div><!-- End .product -->
                                            </div>
                                            <c:set value="${index+1}" var="index"></c:set>
                                        </c:forEach>
                                    </div><!-- End .row -->
                                </div><!-- End .products -->



                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item ${requestScope.currentPage == 1 ? 'disabled' : ''}">
                                            <a class="page-link page-link-prev" aria-label="Previous" href="#" onclick="submitPage(${requestScope.currentPage - 1})">
                                                <span aria-hidden="true"><i class="icon-long-arrow-left"></i></span>Prev
                                            </a>
                                        </li>

                                        <c:forEach begin="1" end="${totalPages}" varStatus="page">
                                            <li class="page-item ${currentPage == page.index ? 'active' : ''}">
                                                <a class="page-link" href="#" onclick="submitPage(${page.index})">${page.index}</a>
                                            </li>
                                        </c:forEach>

                                        <li class="page-item">
                                            <span class="page-link page-item-total">of ${totalPages}</span>
                                        </li>

                                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                            <a class="page-link page-link-next" href="#" aria-label="Next" onclick="submitPage(${currentPage + 1})">
                                                Next <span aria-hidden="true"><i class="icon-long-arrow-right"></i></span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>


                            </div><!-- End .col-lg-9 -->
                            <aside class="col-lg-3 order-lg-first">
                                <form id="filter-form" action="shop">
                                    <input type="hidden" name="page" id="page" value="${requestScope.currentPage}" />
                                    <input type="hidden" name="search" id="search" value="${requestScope.search}" />
                                    <input type="hidden" name="sortby" id="hidden-sortby"
                                           <c:if test="${empty requestScope.sortBy}">
                                               value="all"
                                           </c:if>
                                           <c:if test="${!empty requestScope.sortBy}">
                                               value="${requestScope.sortBy}"
                                           </c:if>
                                           />
                                    <div class="sidebar sidebar-shop">
                                        <div class="widget widget-clean">
                                            <label>Bộ lọc:</label>
                                            <a href="shop" class="sidebar-filter-clear">Xóa tất cả</a>
                                        </div><!-- End .widget widget-clean -->

                                        <div class="widget widget-collapsible">
                                            <h3 class="widget-title">
                                                <a data-toggle="collapse" href="#widget-1" role="button" aria-expanded="true" aria-controls="widget-1">
                                                    Hãng
                                                </a>
                                            </h3><!-- End .widget-title -->

                                            <div class="collapse show" id="widget-1">
                                                <div class="widget-body">
                                                    <div class="filter-items filter-items-count">

                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" name="cid" class="custom-control-input" id="cat-0" value="0" 
                                                                       <c:if test="${param.cid == '0' || empty param.cid}">
                                                                           checked="checked"
                                                                       </c:if>
                                                                       >
                                                                <label class="custom-control-label" for="cat-0">Tất cả</label>
                                                            </div><!-- End .custom-checkbox -->
                                                        </div>
                                                        <c:set value="0" var="index"/>
                                                        <c:forEach items="${requestScope.listcat}" var="listcat">
                                                            <div class="filter-item">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" name="cid" class="custom-control-input" id="cat-${listcat.categoryId}" value="${listcat.categoryId}"
                                                                           <c:forEach items="${requestScope.listcid}" var="lc">
                                                                               <c:if test="${listcat.categoryId==lc}">checked="checked"</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="custom-control-label" for="cat-${listcat.categoryId}">${listcat.categoryName}</label>
                                                                </div><!-- End .custom-checkbox -->
                                                                <span class="item-count">${requestScope.countByCat[index]}</span>
                                                            </div>
                                                            <c:set value="${index+1}" var="index"/>
                                                        </c:forEach>            <!-- End .filter-item -->
                                                    </div><!-- End .filter-items -->
                                                </div><!-- End .widget-body -->
                                            </div><!-- End .collapse -->
                                        </div><!-- End .widget -->

                                        <div class="widget widget-collapsible">
                                            <h3 class="widget-title">
                                                <a data-toggle="collapse" href="#widget-2" role="button" aria-expanded="true" aria-controls="widget-2">
                                                    Chip xử lí
                                                </a>
                                            </h3><!-- End .widget-title -->

                                            <div class="collapse show" id="widget-2">
                                                <div class="widget-body">
                                                    <div class="filter-items">
                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="chip-0" name="chipset" value=""
                                                                       <c:if test="${param.chipset == '' || empty param.chipset}">
                                                                           checked="checked"
                                                                       </c:if>
                                                                       >
                                                                <label class="custom-control-label" for="chip-0">Tất cả</label>
                                                            </div><!-- End .custom-checkbox -->
                                                        </div>
                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="chip-1" name="chipset" value="apple a"
                                                                       <c:forEach items="${requestScope.chipsetlist}" var="chipsetlist">
                                                                           <c:if test="${chipsetlist== 'apple a'}">checked="checked"</c:if>
                                                                       </c:forEach>
                                                                       >
                                                                <label class="custom-control-label" for="chip-1">Apple A</label>
                                                            </div><!-- End .custom-checkbox -->
                                                        </div><!-- End .filter-item -->

                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="chip-2" name="chipset" value="snapdragon"
                                                                       <c:forEach items="${requestScope.chipsetlist}" var="chipsetlist">
                                                                           <c:if test="${chipsetlist== 'snapdragon'}">checked="checked"</c:if>
                                                                       </c:forEach>
                                                                       >
                                                                <label class="custom-control-label" for="chip-2">Snapdragon</label>
                                                            </div><!-- End .custom-checkbox -->
                                                        </div><!-- End .filter-item -->

                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="chip-3" name="chipset" value="mediatek"
                                                                       <c:forEach items="${requestScope.chipsetlist}" var="chipsetlist">
                                                                           <c:if test="${chipsetlist== 'mediatek'}">checked="checked"</c:if>
                                                                       </c:forEach>
                                                                       >
                                                                <label class="custom-control-label" for="chip-3">Mediatek</label>
                                                            </div><!-- End .custom-checkbox -->
                                                        </div><!-- End .filter-item -->

                                                        <!-- End .filter-item -->
                                                    </div><!-- End .filter-items -->
                                                </div><!-- End .widget-body -->
                                            </div><!-- End .collapse -->
                                        </div><!-- End .widget -->

                                       

                                        <div class="widget widget-collapsible">
                                            <h3 class="widget-title">
                                                <a data-toggle="collapse" href="#widget-4" role="button" aria-expanded="true" aria-controls="widget-4">
                                                    Kích thước màn hình
                                                </a>
                                            </h3><!-- End .widget-title -->

                                            <div class="collapse show" id="widget-4">
                                                <div class="widget-body">
                                                    <div class="filter-items">
                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="screensize-0" name="screensize" value="0"
                                                                       <c:if test="${param.screensize == '0' || empty param.screensize}">
                                                                           checked="checked"
                                                                       </c:if>
                                                                       >
                                                                <label class="custom-control-label" for="screensize-0">Tất cả</label>
                                                            </div><!-- End .custom-checkbox -->
                                                        </div>
                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="screensize-1" name="screensize" value="1"
                                                                       <c:forEach items="${requestScope.screenSize}" var="screenSize">
                                                                           <c:if test="${screenSize== '1'}">checked="checked"</c:if>
                                                                       </c:forEach>
                                                                       >
                                                                <label class="custom-control-label" for="screensize-1">Dưới 6 inch</label>
                                                            </div><!-- End .custom-checkbox -->
                                                        </div><!-- End .filter-item -->

                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="screensize-2" name="screensize" value="2"
                                                                       <c:forEach items="${requestScope.screenSize}" var="screenSize">
                                                                           <c:if test="${screenSize== '2'}">checked="checked"</c:if>
                                                                       </c:forEach>
                                                                       >
                                                                <label class="custom-control-label" for="screensize-2">6.0 - 6.5 inch</label>
                                                            </div><!-- End .custom-checkbox -->
                                                        </div><!-- End .filter-item -->

                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="screensize-3" name="screensize" value="3"
                                                                       <c:forEach items="${requestScope.screenSize}" var="screenSize">
                                                                           <c:if test="${screenSize== '3'}">checked="checked"</c:if>
                                                                       </c:forEach>
                                                                       >
                                                                <label class="custom-control-label" for="screensize-3">Trên 6.5 inch</label>
                                                            </div><!-- End .custom-checkbox -->
                                                        </div><!-- End .filter-item -->
                                                    </div><!-- End .filter-items -->
                                                </div><!-- End .widget-body -->
                                            </div><!-- End .collapse -->
                                        </div><!-- End .widget -->

                                        <div class="widget widget-collapsible">
                                            <h3 class="widget-title">
                                                <a data-toggle="collapse" href="#widget-5" role="button" aria-expanded="true" aria-controls="widget-5">
                                                    Giá 
                                                </a>
                                            </h3><!-- End .widget-title -->

                                            <div class="collapse show" id="widget-5">
                                                <div class="widget-body">
                                                    <div class="filter-price">
                                                        <div class="filter-price-text">
                                                            Phạm vi:
                                                            <span id="filter-price-range"></span>
                                                        </div><!-- End .filter-price-text -->

                                                        <div id="price-slider"></div><!-- End #price-slider -->
                                                    </div><!-- End .filter-price -->
                                                </div><!-- End .widget-body -->
                                            </div><!-- End .collapse -->
                                        </div>
                                        <input type="hidden" id="price-from" name="priceFrom" value="${requestScope.minPr != null ? requestScope.minPr : 0}">
                                        <input type="hidden" id="price-to" name="priceTo" value="${requestScope.maxPr != null ? requestScope.maxPr : 60000000}"><!-- End .widget -->
                                    </div>
                                </form>
                                <!-- End .sidebar sidebar-shop -->
                            </aside><!-- End .col-lg-3 -->
                        </div><!-- End .row -->
                    </div><!-- End .container -->
                </div><!-- End .page-content -->
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
        <script src="assets/js/wNumb.js"></script>
        <script src="assets/js/bootstrap-input-spinner.js"></script>
        <script src="assets/js/nouislider.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script>
                                                // Wait for the DOM to be fully loaded
                                                document.addEventListener('DOMContentLoaded', function () {
                                                    var priceSlider = document.getElementById('price-slider');
                                                    var priceFromInput = document.getElementById('price-from');
                                                    var priceToInput = document.getElementById('price-to');
                                                    var priceForm = document.getElementById('filter-form');
                                                    var filterPriceRange = document.getElementById('filter-price-range');

                                                    var initialPriceFrom = parseFloat(priceFromInput.value);
                                                    var initialPriceTo = parseFloat(priceToInput.value);
                                                    noUiSlider.create(priceSlider, {
                                                        start: [initialPriceFrom, initialPriceTo], // Starting values
                                                        connect: true,
                                                        range: {
                                                            'min': 0,
                                                            'max': 60000000
                                                        },
                                                        step: 100000, // Step size
                                                        tooltips: [true, true], // Show tooltips
                                                        format: {
                                                            to: function (value) {
                                                                return value.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ',') + ' VNĐ';
                                                            },
                                                            from: function (value) {
                                                                return Number(value.replace(/[\ VNĐ,]/g, ''));
                                                            }
                                                        }
                                                    });

                                                    // Update the display value

                                                    priceSlider.noUiSlider.on('update', function (values, handle) {
                                                        filterPriceRange.innerHTML = values.join(' - ');
                                                        var fromValue = priceSlider.noUiSlider.get()[0].replace(/[\ VNĐ,]/g, '');
                                                        var toValue = priceSlider.noUiSlider.get()[1].replace(/[\ VNĐ,]/g, '');

                                                        priceFromInput.value = fromValue;
                                                        priceToInput.value = toValue;
                                                    });
                                                    priceSlider.noUiSlider.on('change', function () {
                                                        priceForm.submit();
                                                    });
                                                });
                                                document.addEventListener('DOMContentLoaded', function () {
                                                    const allCheckbox = document.getElementById('cat-0');
                                                    const otherCheckboxes = document.querySelectorAll('input[name="cid"]:not(#cat-0)');
                                                    const form = document.getElementById('filter-form');

                                                    allCheckbox.addEventListener('change', function () {
                                                        if (allCheckbox.checked) {
                                                            otherCheckboxes.forEach(checkbox => {
                                                                checkbox.checked = false;
                                                                checkbox.disabled = true; // Vô hiệu hóa checkbox
                                                            });
                                                            document.getElementById('page').value = 1;
                                                            form.submit(); // Tự động submit form
                                                        } else {
                                                            otherCheckboxes.forEach(checkbox => {
                                                                checkbox.disabled = false; // Bật lại checkbox
                                                            });
                                                        }
                                                    });

                                                    otherCheckboxes.forEach(checkbox => {
                                                        checkbox.addEventListener('change', function () {
                                                            if (checkbox.checked) {
                                                                allCheckbox.checked = false;
                                                                allCheckbox.disabled = false; // Bật lại checkbox "Tất cả"
                                                            }
                                                            document.getElementById('page').value = 1;
                                                            form.submit(); // Tự động submit form
                                                        });
                                                    });

                                                    form.addEventListener('submit', function (event) {
                                                        if (allCheckbox.checked) {
                                                            otherCheckboxes.forEach(checkbox => {
                                                                checkbox.disabled = true; // Vô hiệu hóa checkbox để không gửi giá trị của chúng
                                                            });
                                                        } else {
                                                            allCheckbox.disabled = false; // Bật lại checkbox "Tất cả"
                                                        }
                                                    });
                                                });
                                                document.addEventListener('DOMContentLoaded', function () {
                                                    const allCheckbox = document.getElementById('chip-0');
                                                    const otherCheckboxes = document.querySelectorAll('input[name="chipset"]:not(#chip-0)');
                                                    const form = document.getElementById('filter-form');

                                                    allCheckbox.addEventListener('change', function () {
                                                        if (allCheckbox.checked) {
                                                            otherCheckboxes.forEach(checkbox => {
                                                                checkbox.checked = false;
                                                                checkbox.disabled = true; // Vô hiệu hóa checkbox
                                                            });
                                                            document.getElementById('page').value = 1;
                                                            form.submit(); // Tự động submit form
                                                        } else {
                                                            otherCheckboxes.forEach(checkbox => {
                                                                checkbox.disabled = false; // Bật lại checkbox
                                                            });
                                                        }
                                                    });

                                                    otherCheckboxes.forEach(checkbox => {
                                                        checkbox.addEventListener('change', function () {
                                                            if (checkbox.checked) {
                                                                allCheckbox.checked = false;
                                                                allCheckbox.disabled = false; // Bật lại checkbox "Tất cả"
                                                            }
                                                            document.getElementById('page').value = 1;
                                                            form.submit(); // Tự động submit form
                                                        });
                                                    });

                                                    form.addEventListener('submit', function (event) {
                                                        if (allCheckbox.checked) {
                                                            otherCheckboxes.forEach(checkbox => {
                                                                checkbox.disabled = true; // Vô hiệu hóa checkbox để không gửi giá trị của chúng
                                                            });
                                                        } else {
                                                            allCheckbox.disabled = false; // Bật lại checkbox "Tất cả"
                                                        }
                                                    });
                                                });
                                                function submitPage(page) {
                                                    document.getElementById('page').value = page;
                                                    document.getElementById('filter-form').submit();
                                                }
                                                document.addEventListener('DOMContentLoaded', function () {
                                                    const allCheckbox = document.getElementById('screensize-0');
                                                    const otherCheckboxes = document.querySelectorAll('input[name="screensize"]:not(#screensize-0)');
                                                    const form = document.getElementById('filter-form');

                                                    allCheckbox.addEventListener('change', function () {
                                                        if (allCheckbox.checked) {
                                                            otherCheckboxes.forEach(checkbox => {
                                                                checkbox.checked = false;
                                                                checkbox.disabled = true; // Vô hiệu hóa checkbox
                                                            });
                                                            document.getElementById('page').value = 1;
                                                            form.submit(); // Tự động submit form
                                                        } else {
                                                            otherCheckboxes.forEach(checkbox => {
                                                                checkbox.disabled = false; // Bật lại checkbox
                                                            });
                                                        }
                                                    });

                                                    otherCheckboxes.forEach(checkbox => {
                                                        checkbox.addEventListener('change', function () {
                                                            if (checkbox.checked) {
                                                                allCheckbox.checked = false;
                                                                allCheckbox.disabled = false; // Bật lại checkbox "Tất cả"
                                                            }
                                                            document.getElementById('page').value = 1;
                                                            form.submit(); // Tự động submit form
                                                        });
                                                    });

                                                    form.addEventListener('submit', function (event) {
                                                        if (allCheckbox.checked) {
                                                            otherCheckboxes.forEach(checkbox => {
                                                                checkbox.disabled = true; // Vô hiệu hóa checkbox để không gửi giá trị của chúng
                                                            });
                                                        } else {
                                                            allCheckbox.disabled = false; // Bật lại checkbox "Tất cả"
                                                        }
                                                    });
                                                });
                                                function updateSortAndSubmit() {
                                                    var select = document.getElementById("sortby");
                                                    var hiddenSortby = document.getElementById("hidden-sortby");
                                                    hiddenSortby.value = select.value;
                                                    document.getElementById('page').value = 1;
                                                    document.getElementById("filter-form").submit();
                                                }
                                                document.addEventListener('DOMContentLoaded', function () {
                                                    var searchInput = document.getElementById('q');
                                                    var searchForm = document.getElementById('searchForm');

                                                    searchInput.addEventListener('keydown', function (event) {
                                                        if (event.key === 'Enter') {
                                                            event.preventDefault(); // Ngăn chặn hành động mặc định
                                                            searchForm.submit();    // Gửi form
                                                        }
                                                    });
                                                });
        </script>
    </body>


    <!-- molla/category-4cols.html  22 Nov 2019 10:02:55 GMT -->
</html>