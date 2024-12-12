<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Charts - Kaiadmin Bootstrap 5 Admin Dashboard</title>
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                        <h3 class="fw-bold mb-3">Biểu đồ</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Số lượng người dùng mới theo từng tháng</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="lineChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Doanh số năm (theo từng tháng)</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="barChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Doanh số theo từng hãng</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas
                                                id="pieChart"
                                                style="width: 50%; height: 50%"
                                                ></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Doanh thu từng tuần trong tháng</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="barChartWeek"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="footer">
                    <div class="container-fluid d-flex justify-content-between">
                        <nav class="pull-left">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="http://www.themekita.com">
                                        ThemeKita
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#"> Help </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#"> Licenses </a>
                                </li>
                            </ul>
                        </nav>
                        <div class="copyright">
                            2024, made with <i class="fa fa-heart heart text-danger"></i> by
                            <a href="http://www.themekita.com">ThemeKita</a>
                        </div>
                        <div>
                            Distributed by
                            <a target="_blank" href="https://themewagon.com/">ThemeWagon</a>.
                        </div>
                    </div>
                </footer>
            </div>

            <!-- Custom template | don't include it in your project! -->
            <div class="custom-template">
                <div class="title">Settings</div>
                <div class="custom-content">
                    <div class="switcher">
                        <div class="switch-block">
                            <h4>Logo Header</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="selected changeLogoHeaderColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="selected changeLogoHeaderColor"
                                    data-color="blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="purple"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="light-blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="green"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="orange"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="red"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="white"
                                    ></button>
                                <br />
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="dark2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="purple2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="light-blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="green2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="orange2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="red2"
                                    ></button>
                            </div>
                        </div>
                        <div class="switch-block">
                            <h4>Navbar Header</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="purple"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="light-blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="green"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="orange"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="red"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="white"
                                    ></button>
                                <br />
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="dark2"
                                    ></button>
                                <button
                                    type="button"
                                    class="selected changeTopBarColor"
                                    data-color="blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="purple2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="light-blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="green2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="orange2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="red2"
                                    ></button>
                            </div>
                        </div>
                        <div class="switch-block">
                            <h4>Sidebar</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="selected changeSideBarColor"
                                    data-color="white"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeSideBarColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeSideBarColor"
                                    data-color="dark2"
                                    ></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="custom-toggle">
                    <i class="icon-settings"></i>
                </div>
            </div>
            <!-- End Custom template -->
        </div>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <!-- Chart JS -->
        <script src="assets/js/plugin/chart.js/chart.min.js"></script>
        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>
        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo2.js"></script>
        <script>

            document.addEventListener('DOMContentLoaded', function () {
                function createLineChart(data) {
                    var lineChart = document.getElementById("lineChart");
                    var myLineChart = new Chart(lineChart, {
                        type: "line",
                        data: {
                            labels: Object.keys(data.listusermonth),
                            datasets: [
                                {
                                    label: "Người dùng mới",
                                    borderColor: "#1d7af3",
                                    pointBorderColor: "#FFF",
                                    pointBackgroundColor: "#1d7af3",
                                    pointBorderWidth: 2,
                                    pointHoverRadius: 4,
                                    pointHoverBorderWidth: 1,
                                    pointRadius: 4,
                                    backgroundColor: "transparent",
                                    fill: true,
                                    borderWidth: 2,
                                    data: Object.values(data.listusermonth),
                                },
                            ],
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            legend: {
                                position: "bottom",
                                labels: {
                                    padding: 10,
                                    fontColor: "#1d7af3",
                                },
                            },
                            tooltips: {
                                bodySpacing: 4,
                                mode: "nearest",
                                intersect: 0,
                                position: "nearest",
                                xPadding: 10,
                                yPadding: 10,
                                caretPadding: 10,
                            },
                            layout: {
                                padding: {left: 15, right: 15, top: 15, bottom: 15},
                            },
                        },
                    });
                }

                fetch('/CellCity/chart')
                        .then(response => response.json())
                        .then(data => {
                            createLineChart(data);
                        })
                        .catch(error => console.error('Error fetching pie chart data:', error));

            });


            document.addEventListener('DOMContentLoaded', function () {
                function createBarChart(data) {
                    var pieChart = document.getElementById('barChart');
                    var myBarChart = new Chart(barChart, {
                        type: "bar",
                        data: {
                            labels: Object.keys(data.saleChartData),
                            datasets: [
                                {
                                    label: "Doanh số",
                                    backgroundColor: "rgb(23, 125, 255)",
                                    borderColor: "rgb(23, 125, 255)",
                                    data: Object.values(data.saleChartData),
                                },
                            ],
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                yAxes: [
                                    {
                                        ticks: {
                                            beginAtZero: true,
                                        },
                                    },
                                ],
                            },
                        },
                    });
                }

                fetch('/CellCity/chart')
                        .then(response => response.json())
                        .then(data => {
                            createBarChart(data);
                        })
                        .catch(error => console.error('Error fetching pie chart data:', error));

            });

            document.addEventListener('DOMContentLoaded', function () {
                function createBarChartWeek(data) {
                    var barChartWeek = document.getElementById('barChartWeek');
                    var myBarChart = new Chart(barChartWeek, {
                        type: "bar",
                        data: {
                            labels: Object.keys(data.saleChartWeekData),
                            datasets: [
                                {
                                    label: "Doanh số",
                                    backgroundColor: "rgb(23, 125, 255)",
                                    borderColor: "rgb(23, 125, 255)",
                                    data: Object.values(data.saleChartWeekData),
                                },
                            ],
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                yAxes: [
                                    {
                                        ticks: {
                                            beginAtZero: true,
                                        },
                                    },
                                ],
                            },
                        },
                    });
                }
                fetch('/CellCity/chart')
                        .then(response => response.json())
                        .then(data => {
                            createBarChartWeek(data);
                        })
                        .catch(error => console.error('Error fetching pie chart data:', error));

            });

            document.addEventListener('DOMContentLoaded', function () {
                // Function to create the pie chart with fetched data
                function createPieChart(data) {
                    var pieChart = document.getElementById('pieChart');
                    var myPieChart = new Chart(pieChart, {
                        type: "pie",
                        data: {
                            datasets: [{
                                    data: Object.values(data.pieData),
                                    backgroundColor: ["#1d7af3", "#f3545d", "#fdaf4b", "#8142ff", "#b2b6be", "#22cfcf"],
                                    borderWidth: 0,
                                }],
                            labels: Object.keys(data.pieData),
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            legend: {
                                position: "bottom",
                                labels: {
                                    fontColor: "rgb(154, 154, 154)",
                                    fontSize: 11,
                                    usePointStyle: true,
                                    padding: 20,
                                },
                            },
                            pieceLabel: {
                                render: "percentage",
                                fontColor: "white",
                                fontSize: 14,
                            },
                            tooltips: false,
                            layout: {
                                padding: {
                                    left: 20,
                                    right: 20,
                                    top: 20,
                                    bottom: 20,
                                },
                            },
                        },
                    });
                }

                // Fetch data from the servlet
                fetch('/CellCity/chart')
                        .then(response => response.json())
                        .then(data => {
                            createPieChart(data);
                        })
                        .catch(error => console.error('Error fetching pie chart data:', error));
            });
        </script>
    </body>
</html>
