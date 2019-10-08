<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>left_menu</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/common/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/common/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/common/themify-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/common/metisMenu.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/common/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/common/slicknav.min.css">
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/common/typography.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/common/default-css.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/common/styles.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/common/responsive.css">
    <!-- modernizr css -->
    <script src="<%=request.getContextPath() %>/js/admin/modernizr-2.8.3.min.js"></script>
</head>
<body>

<!-- sidebar menu area start -->
        <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo">
                    <a href="main"><img src="<%=request.getContextPath() %>/img/admin/rhymemi.png" alt="logo"></a>
                </div>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                            <li class="active">
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-dashboard"></i><span>회원관리</span></a>
                                <ul class="collapse">
                                    <li class="active"><a href="memlist">회원 리스트</a></li>
                                    <li><a href="mem_cp">쿠폰/적립금</a></li>
                                    <li><a href="#">-	</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-layout-sidebar-left"></i><span>-----</span></a>
                                <ul class="collapse">
                                    <li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-pie-chart"></i><span>-----</span></a>
                                <ul class="collapse">
                                    <li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-palette"></i><span>-----</span></a>
                                <ul class="collapse">
                                    <li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-slice"></i><span>-----</span></a>
                                <ul class="collapse">
                                    <li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="fa fa-table"></i>
                                    <span>------</span></a>
                                <ul class="collapse">
                                    <li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								
                                </ul>
                            </li>
                            <li><a href="#"><i class="ti-map-alt"></i> <span>-----</span></a></li>
                            <li><a href="#"><i class="ti-receipt"></i> <span>-----</span></a></li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-layers-alt"></i> <span>-----</span></a>
                                <ul class="collapse">
                                    <li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="fa fa-exclamation-triangle"></i>
                                    <span>Error</span></a>
                                <ul class="collapse">
                                    <li><a href="404.html">Error 404</a></li>
                                    <li><a href="403.html">Error 403</a></li>
                                    <li><a href="500.html">Error 500</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="fa fa-align-left"></i> <span>-----</span></a>
                                <ul class="collapse">
                                    <li><a href="#">-</a></li>
      								<li><a href="#">-</a></li>
      								
                                    <li><a href="#" aria-expanded="true">-----</a>
                                        <ul class="collapse">
                                            <li><a href="#">-</a></li>
		      								<li><a href="#">-</a></li>
		      								<li><a href="#">-</a></li>
		      								
                                        </ul>
                                    </li>
                                    <li><a href="#">------</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- sidebar menu area end -->
        
    <!-- jquery latest version -->
    <script src="<%=request.getContextPath() %>/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="<%=request.getContextPath() %>/js/bootstrap/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/admin/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/admin/metisMenu.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery/jquery.slimscroll.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery/jquery.slicknav.min.js"></script>

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- all line chart activation -->
    <script src="<%=request.getContextPath() %>/js/chart/line-chart.js"></script>
    <!-- all pie chart -->
    <script src="<%=request.getContextPath() %>/js/chart/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="<%=request.getContextPath() %>/js/others/plugins.js"></script>
    <script src="<%=request.getContextPath() %>/js/others/scripts.js"></script>

</body>
</html>