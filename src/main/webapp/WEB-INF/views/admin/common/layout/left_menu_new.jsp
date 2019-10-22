<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="prc" />
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>left_menu_new</title>
</head>

<!-- Sidebar -->

<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/main">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			RHYME<sup>b</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active">
		<a class="nav-link" href="/admin/main">
			<i class="fas fa-fw fa-tachometer-alt"></i>
			<span>Dashboard</span>
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">


	<c:if test="${prc ne 'anonymousUser' }">
		<c:forEach items="${prc.authorities  }" var="auth">
			<c:if test="${auth eq 'ROLE_ADMIN' }">
				<!-- Heading -->
				<div class="sidebar-heading">MANAGEMENT</div>

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
					<i class="fas fa-fw fa-folder"></i>
					<span>회원관리</span>
				</a>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">member management</h6>
							<a class="collapse-item" href="/admin/memlist">회원 리스트</a>
							<a class="collapse-item" href="/admin/mem_c_list">업체 리스트</a>
						</div>
					</div>
				</li>

				<!-- 통계 차트 -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseChart" aria-expanded="true" aria-controls="collapseUtilities">
						<i class="fas fa-fw fa-chart-area"></i>
						<span>통계</span>
					</a>
					<div id="collapseChart" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">CHART</h6>
							<a class="collapse-item" href="/admin/chart/salary">매출 통계</a>
							<a class="collapse-item" href="/admin/chart/member">회원 통계</a>
							<a class="collapse-item" href="/admin/chart/category">카테고리별 통계</a>
							<a class="collapse-item" href="/admin/chart/product">상품 통계</a>
						</div>
					</div>
				</li>
				
				<!-- DB 액셀 다운로드 -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseExcel" aria-expanded="true" aria-controls="collapseUtilities">
						<i class="fas fa-fw fa-chart-area"></i>
						<span>DB 다운로드</span>
					</a>
					<div id="collapseExcel" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">CHART</h6>
							<a class="collapse-item" href="/admin/excel/move">DB 액셀 다운로드</a>
						</div>
					</div>
				</li>
				
				<!-- 고객센터 -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCustomer" aria-expanded="true" aria-controls="collapseTwo">
						<i class="fas fa-fw fa-folder"></i>
						<span>고객센터</span>
					</a>
					<div id="collapseCustomer" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">Customer Center</h6>
							<a class="collapse-item" href="/admin/customercenter/noticelist">공지사항</a>
							<a class="collapse-item" href="/admin/customercenter/faqlist">자주하는질문</a>
							<a class="collapse-item" href="/admin/customercenter/qnalist">1:1질문</a>
						</div>
					</div>
				</li>

				<!-- Divider -->
				<hr class="sidebar-divider" />

				<!-- Heading -->
				<div class="sidebar-heading">${c_name }</div>

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEvent" aria-expanded="true" aria-controls="collapseTwo">
						<i class="fas fa-fw fa-folder"></i>
						<span>이벤트관리</span>
					</a>
					<div id="collapseEvent" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">Events</h6>
							<a class="collapse-item" href="/admin/mypage/coupon">쿠폰 관리</a>
							<a class="collapse-item" href="/admin/mypage/points">적립금</a>
							<a class="collapse-item" href="/admin/event/eventlist">이벤트</a>
						</div>
					</div>
				</li>
			</c:if>
		</c:forEach>
	</c:if>



	<!-- Nav Item - Pages Collapse Menu -->
	<c:if test="${prc ne 'anonymousUser' }">
		<c:forEach items="${prc.authorities  }" var="auth">
			<c:if test="${auth eq 'ROLE_SELLER' }">

				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
						<i class="fas fa-fw fa-folder"></i>
						<span>상품관리</span>
					</a>
					<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">PRODUCT MANAGE</h6>
							<a class="collapse-item" href="/admin/company/register">상품등록</a>
							<a class="collapse-item" href="/admin/company/productlist">상품조회</a>
							<a class="collapse-item" href="/admin/company/productoperlist">상품수정/삭제/SALE등록</a>
							<a class="collapse-item" href="/admin/company/saleproductmanage">SALE상품관리</a>
							<a class="collapse-item" href="login.html">재고관리</a>
						</div>
					</div>
				</li>

				<!-- 주문관리 -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#admin_payment" aria-expanded="true" aria-controls="collapsePages">
						<i class="fas fa-fw fa-folder"></i>
						<span>주문관리</span>
					</a>
					<div id="admin_payment" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">PAYMENT MANAGE</h6>
							<a class="collapse-item" href="/admin/payment/exchange">교환관리</a>
							<a class="collapse-item" href="/admin/payment/refund">환불관리</a>
							<a class="collapse-item" href="/admin/payment/cancel">결제취소</a>
							<a class="collapse-item" href="/admin/payment/success">결제성공</a>
							<a class="collapse-item" href="/admin/payment/finish">결제완료</a>
						</div>
					</div>
				</li>
			</c:if>
		</c:forEach>
	</c:if>
	<!-- Nav Item - Charts -->
	<!--   <li class="nav-item">
    <a class="nav-link" href="charts.html">
      <i class="fas fa-fw fa-chart-area"></i>
      <span>Charts</span></a>
  </li> -->

	<!-- Nav Item - Tables -->
	<!-- <li class="nav-item">
    <a class="nav-link" href="tables.html">
      <i class="fas fa-fw fa-table"></i>
      <span>Tables</span></a>
  </li> -->

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block" />

	<!-- Sidebar Toggler (Sidebar) -->
	<!--   <div class="text-center d-none d-md-inline">
    <button class="rounded-circle border-0" id="sidebarToggle"></button>
  </div> -->

</ul>


</html>