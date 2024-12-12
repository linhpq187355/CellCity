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
            var currentTab = 0; // Current tab is set to be the first tab (0)
            showTab(currentTab); // Display the current tab

            function showTab(n) {
                // This function will display the specified tab of the form ...
                var x = document.getElementsByClassName("tab");
                x[n].style.display = "block";
                // ... and fix the Previous/Next buttons:
                if (n === 0) {
                    document.getElementById("prevBtn").style.display = "none";
                } else {
                    document.getElementById("prevBtn").style.display = "inline";
                }
                if (n === (x.length - 1)) {
                    document.getElementById("nextBtn").innerHTML = "Submit";
                } else {
                    document.getElementById("nextBtn").innerHTML = "Next";
                }
                // ... and run a function that displays the correct step indicator:
                fixStepIndicator(n);
            }

            function nextPrev(n) {
                // This function will figure out which tab to display
                var x = document.getElementsByClassName("tab");
                // Exit the function if any field in the current tab is invalid:
                if (n === 1 && !validateForm())
                    return false;
                // Hide the current tab:
                x[currentTab].style.display = "none";
                // Increase or decrease the current tab by 1:
                currentTab = currentTab + n;
                // if you have reached the end of the form... :
                if (currentTab >= x.length) {
                    //...the form gets submitted:
                    document.getElementById("regForm").submit();
                    return false;
                }
                // Otherwise, display the correct tab:
                showTab(currentTab);
            }

            function validateForm() {
                // This function deals with validation of the form fields
                var x, y, i, valid = true;
                x = document.getElementsByClassName("tab");
                y = x[currentTab].getElementsByTagName("input");
                // A loop that checks every input field in the current tab:
                for (i = 0; i < y.length; i++) {
                    // If a field is empty...
                    if (y[i].value === "") {
                        // add an "invalid" class to the field:
                        y[i].className += " invalid";
                        // and set the current valid status to false:
                        valid = false;
                    }
                }
                // If the valid status is true, mark the step as finished and valid:
                if (valid) {
                    document.getElementsByClassName("step")[currentTab].className += " finish";
                }
                return valid; // return the valid status
            }

            function fixStepIndicator(n) {
                // This function removes the "active" class of all steps...
                var i, x = document.getElementsByClassName("step");
                for (i = 0; i < x.length; i++) {
                    x[i].className = x[i].className.replace(" active", "");
                }
                //... and adds the "active" class to the current step:
                x[n].className += " active";
            }
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
                max-width: 100px; /* Hoặc bất kỳ kích thước nào bạn muốn */
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
                                                <a class="dropdown-item" href="logout">Đăng xuất</a>
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
                                    Quản lí sản phẩm
                                </li>
                                <li class="separator">
                                    <i class="icon-arrow-right"></i>
                                </li>
                                <li class="nav-item">
                                    <a href="#">Thêm phiên bản sản phẩm</a>
                                </li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Nhập thông tin phiên bản</div>
                                    </div>
                                    <div class="card-body">
                                        <form action="addprodetail" method="post">
                                            <div class="row tab">

                                                <div class="col-md-6 col-lg-6">
                                                    <input type="text" name="proid" value="${requestScope.proid}" hidden>
                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Công nghệ màn hình</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Công nghệ màn hình"
                                                                name="screentech"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >RAM</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="number"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="RAM"
                                                                name="ram"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >ROM</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="number"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="ROM"
                                                                name="rom"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Camera trước</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Camera trước"
                                                                name="frontCam"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Camera sau</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Camera sau"
                                                                name="backCam"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Thời lượng pin</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="number"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Thời lượng pin"
                                                                name="pin"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Hệ điều hành</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Hệ điều hành"
                                                                name="os"

                                                                />
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-6 col-lg-6">

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >SIM</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="SIM"
                                                                name="sim"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Chip xử lí</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Chip xử lí"
                                                                name="chipSet"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Kích thước màn hình</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="text"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Kích thước màn hình"
                                                                name="screenSize"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Tần số quét</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="number"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Tần số quét"
                                                                name="refreshRate"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="exampleFormControlSelect1"
                                                               >Màu</label
                                                        >
                                                        <select
                                                            class="form-select"
                                                            id="exampleFormControlSelect1"
                                                            name="color"

                                                            >
                                                            <c:forEach items="${requestScope.listco}" var="lc">
                                                                <option value="${lc.id}">${lc.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-group form-inline">
                                                        <label
                                                            for="productname"
                                                            class="col-md-3 col-form-label"
                                                            >Số lượng</label
                                                        >
                                                        <div class="col-md-9 p-0">
                                                            <input
                                                                type="number"
                                                                class="form-control input-full"
                                                                id="productname"
                                                                placeholder="Số lượng"
                                                                name="stockQuantity"

                                                                />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="input-group mb-3">
                                                            <label class="col-md-3 col-form-label" for="price">Giá sản phẩm</label>
                                                            <span class="input-group-text">VNĐ</span>
                                                            <input
                                                                type="number"
                                                                class="form-control"
                                                                id="price"
                                                                aria-label="Amount (to the nearest dollar)"
                                                                name="price"
                                                                />
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="card-action">
                                                    <button class="btn btn-success" type="submit">Lưu</button>
                                                    <button class="btn btn-danger" type="reset">Tải lại</button>
                                                </div>
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
