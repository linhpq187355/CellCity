<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            function previewImages() {
                var preview = document.getElementById('image-preview');
                preview.innerHTML = '';
                var files = document.getElementById('image-input').files;

                for (var i = 0; i < files.length; i++) {
                    var file = files[i];
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        var img = new Image();
                        img.src = e.target.result;
                        preview.appendChild(img);
                    }

                    reader.readAsDataURL(file);
                }
            }
        </script>

        <style>
            #image-preview img {
                max-width: 125px; /* Hoặc bất kỳ kích thước nào bạn muốn */
                max-height: 100px;
            }
            label{
                font-weight: bold !important;
            }
        </style>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link rel="stylesheet" href="assets/css/demo.css" />
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
            </div>
            <!-- End Sidebar -->

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
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Thêm sản phẩm</h3>
                            <ul class="breadcrumbs mb-3">
                                <li class="nav-home">
                                    <a href="#">
                                        <i class="icon-home"></i>
                                    </a>
                                </li>
                                <li class="separator">
                                    <i class="icon-arrow-right"></i>
                                </li>
                                <li class="nav-item">
                                    <a href="#">Quản lí sản phẩm</a>
                                </li>
                                <li class="separator">
                                    <i class="icon-arrow-right"></i>
                                </li>
                                <li class="nav-item">
                                    <a href="#">Tất cả sản phẩm</a>
                                </li>
                                <li class="separator">
                                    <i class="icon-arrow-right"></i>
                                </li>
                                <li class="nav-item">
                                    <a href="#">Chỉnh sửa sản phẩm</a>
                                </li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Nhập thông tin sản phẩm</div>
                                    </div>

                                    <div class="card-body">
                                        <c:set value="${requestScope.user}" var="u"></c:set>
                                            <form action="editUser" method="post">
                                                <div class="row tab">

                                                    <div class="col-md-6 col-lg-6">
                                                        <input type="text" name="id" value="${u.userId}" hidden>
                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Tên người dùng</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Tên sản phẩm"
                                                                name="name"
                                                                value="${u.name}"
                                                                />
                                                        </div>

                                                    </div>
                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Địa chỉ</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Tên sản phẩm"
                                                                name="address"
                                                                value="${u.address}"
                                                                />
                                                        </div>

                                                    </div>
                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Email</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="email"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Tên sản phẩm"
                                                                name="email"
                                                                value="${u.email}"
                                                                />
                                                        </div>

                                                    </div>
                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >SĐT</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="tel"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Tên sản phẩm"
                                                                name="phone"
                                                                value="${u.phone}"
                                                                />
                                                        </div>

                                                    </div>



                                                </div>
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Tên đăng nhập</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Tên sản phẩm"
                                                                name="username"
                                                                value="${u.username}"
                                                                />
                                                        </div>

                                                    </div>
                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Mật khẩu</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Tên sản phẩm"
                                                                name="pass"
                                                                value="${u.password}"
                                                                />
                                                        </div>

                                                    </div>
                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Role</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Tên sản phẩm"
                                                                name="role"
                                                                value="${u.role}"
                                                                />
                                                        </div>

                                                    </div>
                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Số dư</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Tên sản phẩm"
                                                                name="amount"
                                                                value="${u.amount}"
                                                                />
                                                        </div>

                                                    </div>




                                                </div>

                                            </div>
                                            <div class="card-action">
                                                <button class="btn btn-success" type="submit">Lưu</button>
                                                <button class="btn btn-danger" type="reset">Tải lại</button>
                                            </div>

                                        </form>

                                    </div>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

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

    </body>
</html>

</html>
