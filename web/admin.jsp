<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link rel="apple-touch-icon" sizes="180x180" href="images/logobe.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/logobe.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/logobe.png">
        <link rel="manifest" href="assets/images/icons/site.html">
        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: [
                        "Font Awesome 5 Solid",
                        "Font Awesome 5 Regular",
                        "Font Awesome 5 Brands",
                        "simple-line-icons",
                    ],
                    urls: ["assets/css/fonts.min.css"],
                },
                active: function () {
                    sessionStorage.fonts = true;
                },
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link rel="stylesheet" href="assets/css/demo.css" />
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Bạn có chắc muốn xóa người dùng này không?")) {
                    window.location = "deleteUser?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <div class="sidebar" data-background-color="dark">
                <div class="sidebar-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="admin" class="logo">
                                <img
                                    src="images/Yellow Modern Gadget Store Logo (1).png"
                                    alt="navbar brand"
                                    class="navbar-brand"
                                    height="40"
                                    style="border-radius: 20px "
                                    />
                            </a>
                            <div class="nav-toggle">
                                <button class="btn btn-toggle toggle-sidebar">
                                    <i class="gg-menu-right"></i>
                                </button>
                                <button class="btn btn-toggle sidenav-toggler">
                                    <i class="gg-menu-left"></i>
                                </button>
                            </div>
                            <button class="topbar-toggler more">
                                <i class="gg-more-vertical-alt"></i>
                            </button>
                        </div>
                        <!-- End Logo Header -->
                    </div>
                <c:if test="${sessionScope.account.role==0}">
                    
                    <div class="sidebar-wrapper scrollbar scrollbar-inner">
                        <div class="sidebar-content">
                            <ul class="nav nav-secondary">
                                <li class="nav-item active">
                                    <a
                                        data-bs-toggle="collapse"
                                        href="#dashboard"
                                        aria-expanded="false"
                                        >
                                        <i class="fas fa-home"></i>
                                        <p>Trang chủ</p>
                                    </a>
                                </li>
                                <li class="nav-section">
                                    <span class="sidebar-mini-icon">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </span>
                                    <h4 class="text-section">Chi tiết</h4>
                                </li>
                                <li class="nav-item">
                                    <a data-bs-toggle="collapse" href="#base">
                                        <i class="fas fa-layer-group"></i>
                                        <p>Quản lí sản phẩm</p>
                                        <span class="caret"></span>
                                    </a>
                                    <div class="collapse" id="base">
                                        <ul class="nav nav-collapse">
                                            <li>
                                                <a href="listproadmin?id=0">
                                                    <span class="sub-item">Tất cả sản phẩm  và các phiên bản</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="listproo">
                                                    <span class="sub-item">Tất cả sản phẩm</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="addoption">
                                                    <span class="sub-item">Thêm sản phẩm</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a data-bs-toggle="collapse" href="#sidebarLayouts">
                                        <i class="fas fa-th-list"></i>
                                        <p>Quản lí người dùng</p>
                                        <span class="caret"></span>
                                    </a>
                                    <div class="collapse" id="sidebarLayouts">
                                        <ul class="nav nav-collapse">
                                            <li>
                                                <a href="listuser">
                                                    <span class="sub-item">Tất cả người dùng</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a data-bs-toggle="collapse" href="#forms">
                                        <i class="fas fa-pen-square"></i>
                                        <p>Quản lí đơn hàng</p>
                                        <span class="caret"></span>
                                    </a>
                                    <div class="collapse" id="forms">
                                        <ul class="nav nav-collapse">
                                            <li>
                                                <a href="listAllOrder">
                                                    <span class="sub-item">Tất cả đơn hàng</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a href="chart.jsp">
                                        <i class="far fa-chart-bar"></i>
                                        <p>Biểu đồ/Thống kê</p>

                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:if>

            </div>
            <!-- End Sidebar -->
            <c:if test="${sessionScope.account.role !=0 || sessionScope.account == null}">
                <h3 style="margin-top: 20px; margin-left: 290px">Bạn không phải là admin!</h3>
            </c:if>
            <c:if test="${sessionScope.account.role ==0}">
                <div class="main-panel">
                    <div class="main-header">
                        <div class="main-header-logo">
                            <!-- Logo Header -->
                            <div class="logo-header" data-background-color="dark">
                                <a href="index.html" class="logo">
                                    <img
                                        src="assets/img/kaiadmin/logo_light.svg"
                                        alt="navbar brand"
                                        class="navbar-brand"
                                        height="20"
                                        />
                                </a>
                                <div class="nav-toggle">
                                    <button class="btn btn-toggle toggle-sidebar">
                                        <i class="gg-menu-right"></i>
                                    </button>
                                    <button class="btn btn-toggle sidenav-toggler">
                                        <i class="gg-menu-left"></i>
                                    </button>
                                </div>
                                <button class="topbar-toggler more">
                                    <i class="gg-more-vertical-alt"></i>
                                </button>
                            </div>
                            <!-- End Logo Header -->
                        </div>
                        <!-- Navbar Header -->
                        <nav
                            class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
                            >
                            <div class="container-fluid">

                                <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                                    <li class="nav-item topbar-user dropdown hidden-caret">
                                        <a
                                            class="dropdown-toggle profile-pic"
                                            data-bs-toggle="dropdown"
                                            href="#"
                                            aria-expanded="false"
                                            >
                                            <div class="avatar-sm">
                                                <img
                                                    src="images/avatar-15.png"
                                                    alt="..."
                                                    class="avatar-img rounded-circle"
                                                    />
                                            </div>
                                            <span class="profile-username">
                                                <span class="fw-bold">${sessionScope.account.name}</span>
                                            </span>
                                        </a>
                                        <ul class="dropdown-menu dropdown-user animated fadeIn">
                                            <div class="dropdown-user-scroll scrollbar-outer">
                                                <li>
                                                    <a class="dropdown-item" href="logout?direct=home">Đăng xuất</a>
                                                </li>
                                            </div>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                        <!-- End Navbar -->
                    </div>

                    <div class="container">
                        <div class="page-inner">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card card-secondary">
                                        <div class="card-body skew-shadow">
                                            <h1>${requestScope.numOfPro}</h1>
                                            <h5 class="op-8">Số lượng mặt hàng</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card card-secondary bg-secondary-gradient">
                                        <div class="card-body bubble-shadow">
                                            <h1>${requestScope.numOfQuan}</h1>
                                            <h5 class="op-8">Sản phẩm trong kho</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card card-secondary bg-secondary-gradient">
                                        <div class="card-body curves-shadow">
                                            <h1><fmt:formatNumber value="${requestScope.doanhthu}" type="number" groupingUsed="true"/>đ</h1>
                                            <h5 class="op-8">Doanh thu tháng</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card card-round">
                                        <div class="card-body">
                                            <div class="card-head-row card-tools-still-right">
                                                <div class="card-title">Khách hàng mới</div>
                                                <div class="card-tools">
                                                    <div class="dropdown">
                                                        <button
                                                            class="btn btn-icon btn-clean me-0"
                                                            type="button"
                                                            id="dropdownMenuButton"
                                                            data-bs-toggle="dropdown"
                                                            aria-haspopup="true"
                                                            aria-expanded="false"
                                                            >
                                                            <i class="fas fa-ellipsis-h"></i>
                                                        </button>
                                                        <div
                                                            class="dropdown-menu"
                                                            aria-labelledby="dropdownMenuButton"
                                                            >
                                                            <a class="dropdown-item" href="listuser">Toàn bộ khách hàng</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-list py-4">
                                                <c:forEach items="${requestScope.listNewUser}" var="listNewUser">
                                                    <div class="item-list">
                                                        <div class="avatar">
                                                            <img
                                                                src="images/avatar-15.png"
                                                                alt="..."
                                                                class="avatar-img rounded-circle"
                                                                />
                                                        </div>
                                                        <div class="info-user ms-3">
                                                            <div class="username">${listNewUser.name}</div>
                                                            <div class="status">${listNewUser.address}</div>
                                                        </div>
                                                        <button class="btn btn-icon btn-link btn-danger op-8">
                                                            <a href="javascript:void(0);" onclick="doDelete('${listNewUser.userId}')">
                                                                <i class="fas fa-times"></i>
                                                            </a>

                                                        </button>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="card card-round">
                                        <div class="card-header">
                                            <div class="card-head-row card-tools-still-right">
                                                <div class="card-title">Đơn hàng mới</div>
                                                <div class="card-tools">
                                                    <div class="dropdown">
                                                        <button
                                                            class="btn btn-icon btn-clean me-0"
                                                            type="button"
                                                            id="dropdownMenuButton"
                                                            data-bs-toggle="dropdown"
                                                            aria-haspopup="true"
                                                            aria-expanded="false"
                                                            >
                                                            <i class="fas fa-ellipsis-h"></i>
                                                        </button>
                                                        <div
                                                            class="dropdown-menu"
                                                            aria-labelledby="dropdownMenuButton"
                                                            >
                                                            <a class="dropdown-item" href="listAllOrder">Tất cả đơn hàng</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body p-0">
                                            <div class="table-responsive">
                                                <!-- Projects table -->
                                                <table class="table align-items-center mb-0">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th scope="col">Tên người nhận</th>
                                                            <th scope="col" class="text-end">Ngày đặt hàng</th>
                                                            <th scope="col" class="text-end">Thành tiền</th>
                                                            <th scope="col" class="text-end">Trạng thái</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.listNewOrder}" var="listNewOrder">
                                                            <tr>
                                                                <th scope="row">
                                                                    ${listNewOrder.shipping_name}
                                                                </th>
                                                                <td class="text-end">${listNewOrder.orderDate}</td>
                                                                <td class="text-end">${listNewOrder.totalAmount}</td>
                                                                <td class="text-end">
                                                                    <span>${listNewOrder.status}</span>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </c:if>


        </div>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

        <!-- Chart JS -->
        <script src="assets/js/plugin/chart.js/chart.min.js"></script>

        <!-- jQuery Sparkline -->
        <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

        <!-- Chart Circle -->
        <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>

        <!-- Bootstrap Notify -->
        

        <!-- jQuery Vector Maps -->
        <script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
        <script src="assets/js/plugin/jsvectormap/world.js"></script>

        <!-- Sweet Alert -->
        <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>

        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo.js"></script>
        <script src="assets/js/demo.js"></script>
        <script>
                                                                $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
                                                                    type: "line",
                                                                    height: "70",
                                                                    width: "100%",
                                                                    lineWidth: "2",
                                                                    lineColor: "#177dff",
                                                                    fillColor: "rgba(23, 125, 255, 0.14)",
                                                                });

                                                                $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
                                                                    type: "line",
                                                                    height: "70",
                                                                    width: "100%",
                                                                    lineWidth: "2",
                                                                    lineColor: "#f3545d",
                                                                    fillColor: "rgba(243, 84, 93, .14)",
                                                                });

                                                                $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
                                                                    type: "line",
                                                                    height: "70",
                                                                    width: "100%",
                                                                    lineWidth: "2",
                                                                    lineColor: "#ffa534",
                                                                    fillColor: "rgba(255, 165, 52, .14)",
                                                                });
        </script>
    </body>
</html>
