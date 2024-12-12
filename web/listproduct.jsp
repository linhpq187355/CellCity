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



        </script>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Bạn có chắc muốn xóa sản phẩm này không?")) {
                    window.location = "delpro?id=" + id;
                }
            }
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link rel="stylesheet" href="assets/css/demo.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                            <h3 class="fw-bold mb-3">Tất cả sản phẩm</h3>
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
                                    <a href="listproo">Tất cả sản phẩm</a>
                                </li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <!-- Modal -->
                                        <div class="table-responsive">
                                            <% if (session.getAttribute("successMessageDelete") != null) { %>
            alert('<%= session.getAttribute("successMessageDelete") %>');
                                                <% session.removeAttribute("successMessageDelete"); %>
                                                <% } else if (session.getAttribute("errorMessageDelete") != null) { %>
            alert('<%= session.getAttribute("errorMessageDelete") %>');
                                                <% session.removeAttribute("errorMessageDelete"); %>
                                                <% } %>
                                            <table
                                                id="add-row"
                                                class="display table table-striped table-hover"
                                                >
                                                <thead>

                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th>Mô tả</th>
                                                        <th>Hãng</th>
                                                        <th>Bảo hành</th>
                                                        <th>Ngày thêm</th>
                                                        <th>Ngày sửa</th>
                                                        <th style="width: 10%">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.listpro}" var="lp">

                                                        <tr data-url="listproadmin?id=${lp.productId}">

                                                            <td>${lp.productId}</td>
                                                            <td>${lp.name}</td>
                                                            <td class="descriptionCell" style="max-width: 200px; /* Điều chỉnh chiều rộng tối đa của ô */
                                                                white-space: nowrap;
                                                                overflow: hidden;
                                                                text-overflow: ellipsis;">${lp.description}</td>
                                                    <script>
    $(document).ready(function () {
        var descriptionCell = $('.descriptionCell');
        var descriptionText = descriptionCell.text().trim(); // Lấy nội dung mô tả và loại bỏ khoảng trắng thừa
        var maxLength = 200; // Độ dài tối đa bạn muốn hiển thị

        if (descriptionText.length > maxLength) {
            var trimmedText = descriptionText.substring(0, maxLength) + '...';
            descriptionCell.text(trimmedText);
        }
    });
                                                    </script>

                                                    <td>
                                                        <c:forEach items="${requestScope.listcat}" var="lcat">
                                                            <c:if test="${lcat.categoryId == lp.categoryId}">
                                                                ${lcat.categoryName}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        ${lp.warrantyPeriod}
                                                    </td>
                                                    <td>
                                                        ${lp.createdDate}
                                                    </td>
                                                    <td>
                                                        ${lp.lastUpdatedDate}
                                                    </td>
                                                    <td>
                                                        <div class="form-button-action">
                                                            <button
                                                                type="button"
                                                                data-bs-toggle="tooltip"
                                                                title=""
                                                                class="btn btn-link btn-primary btn-lg"
                                                                data-original-title="Edit Task"
                                                                >
                                                                <a href="updateproadmin?id=${lp.productId}"><i class="fa fa-edit"></i></a>
                                                            </button>
                                                            <button
                                                                type="button"
                                                                data-bs-toggle="tooltip"
                                                                title=""
                                                                class="btn btn-link btn-danger"
                                                                data-original-title="Remove"
                                                                >
                                                                <a href="javascript:void(0);" onclick="doDelete('${lp.productId}')"><i class="fa fa-times"></i></a>
                                                            </button>
                                                        </div>
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
                                                                    $(document).ready(function () {
                                                                        $("#basic-datatables").DataTable({});

                                                                        $("#multi-filter-select").DataTable({
                                                                            pageLength: 5,
                                                                            initComplete: function () {
                                                                                this.api()
                                                                                        .columns()
                                                                                        .every(function () {
                                                                                            var column = this;
                                                                                            var select = $(
                                                                                                    '<select class="form-select"><option value=""></option></select>'
                                                                                                    )
                                                                                                    .appendTo($(column.footer()).empty())
                                                                                                    .on("change", function () {
                                                                                                        var val = $.fn.dataTable.util.escapeRegex($(this).val());

                                                                                                        column
                                                                                                                .search(val ? "^" + val + "$" : "", true, false)
                                                                                                                .draw();
                                                                                                    });

                                                                                            column
                                                                                                    .data()
                                                                                                    .unique()
                                                                                                    .sort()
                                                                                                    .each(function (d, j) {
                                                                                                        select.append(
                                                                                                                '<option value="' + d + '">' + d + "</option>"
                                                                                                                );
                                                                                                    });
                                                                                        });
                                                                            },
                                                                        });

                                                                        // Add Row
                                                                        $("#add-row").DataTable({
                                                                            pageLength: 5,
                                                                        });

                                                                        var action =
                                                                                '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

                                                                        $("#addRowButton").click(function () {
                                                                            $("#add-row")
                                                                                    .dataTable()
                                                                                    .fnAddData([
                                                                                        $("#addName").val(),
                                                                                        $("#addPosition").val(),
                                                                                        $("#addOffice").val(),
                                                                                        action,
                                                                                    ]);
                                                                            $("#addRowModal").modal("hide");
                                                                        });
                                                                    });
                                                                    const rows = document.querySelectorAll("table tbody tr");

                                                                    // Thêm sự kiện click cho từng hàng
                                                                    rows.forEach(row => {
                                                                        row.addEventListener("click", (event) => {
                                                                            // Kiểm tra nếu nhấp vào phần tử là button hoặc icon thì không chuyển hướng
                                                                            if (event.target.tagName.toLowerCase() === 'button' || event.target.tagName.toLowerCase() === 'i') {
                                                                                return;
                                                                            }

                                                                            // Lấy URL từ thuộc tính data-url
                                                                            const url = row.getAttribute("data-url");
                                                                            if (url) {
                                                                                // Chuyển hướng tới URL
                                                                                window.location.href = url;
                                                                            }
                                                                        });
                                                                    });
        </script>

    </body>
</html>
