<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="prc"/>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>left_menu_new</title>
</head>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

  <!-- Sidebar - Brand -->
  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/main">
    <div class="sidebar-brand-icon rotate-n-15">
      <i class="fas fa-laugh-wink"></i>
    </div>
    <div class="sidebar-brand-text mx-3">RHYME<sup>b</sup></div>
  </a>

  <!-- Divider -->
  <hr class="sidebar-divider my-0">

  <!-- Nav Item - Dashboard -->
  <li class="nav-item active">
    <a class="nav-link" href="/admin/main">
      <i class="fas fa-fw fa-tachometer-alt"></i>
      <span>Dashboard</span></a>
  </li>

  <!-- Divider -->
  
  <c:if test="${prc ne 'anonymousUser' }">
	<c:forEach items="${prc.authorities  }" var="auth">
		<c:if test="${auth eq 'ROLE_ADMIN' }">
		
		<hr class="sidebar-divider">
		  <!-- Heading -->
		  <div class="sidebar-heading">
		    Interface
		  </div>
		  
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

			  <!-- Nav Item - Utilities Collapse Menu -->
			  <li class="nav-item">
			    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
			      <i class="fas fa-fw fa-chart-area"></i>
			      <span>통계</span>
			    </a>
			    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			      <div class="bg-white py-2 collapse-inner rounded">
			        <h6 class="collapse-header">------</h6>
			        <a class="collapse-item" href="utilities-color.html">-</a>
			        <a class="collapse-item" href="utilities-border.html">-</a>
			        <a class="collapse-item" href="utilities-animation.html">-</a>
			        <a class="collapse-item" href="utilities-other.html">-</a>
			      </div>
			    </div>
			  </li>
		</c:if>
  	</c:forEach>
  </c:if>
  <!-- Divider -->
  <hr class="sidebar-divider"/>
	<c:if test="${prc ne 'anonymousUser' }">
		<c:forEach items="${prc.authorities  }" var="auth">
			<c:if test="${auth eq 'ROLE_SELLER' }">
			  <!-- Heading -->
			  <div class="sidebar-heading">
			    Addons
			  </div>
			
			  <!-- Nav Item - Pages Collapse Menu -->
			  <li class="nav-item">
			    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
			      <i class="fas fa-fw fa-folder"></i>
			      <span>Pages</span>
			    </a>
			    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			      <div class="bg-white py-2 collapse-inner rounded">
			        <h6 class="collapse-header">Login Screens:</h6>
			        <a class="collapse-item" href="login.html">Login</a>
			        <a class="collapse-item" href="register.html">Register</a>
			        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
			        <div class="collapse-divider"></div>
			        <h6 class="collapse-header">Other Pages:</h6>
			        <a class="collapse-item" href="404.html">404 Page</a>
			        <a class="collapse-item" href="blank.html">Blank Page</a>
			      </div>
			    </div>
			  </li>
 		 </c:if>
  	</c:forEach>
  </c:if>

  <!-- Nav Item - Charts -->
  <li class="nav-item">
    <a class="nav-link" href="charts.html">
      <i class="fas fa-fw fa-chart-area"></i>
      <span>Charts</span></a>
  </li>

  <!-- Nav Item - Tables -->
  <li class="nav-item">
    <a class="nav-link" href="tables.html">
      <i class="fas fa-fw fa-table"></i>
      <span>Tables</span></a>
  </li>

  <!-- Divider -->
  <hr class="sidebar-divider d-none d-md-block"/>

  <!-- Sidebar Toggler (Sidebar) -->
  <div class="text-center d-none d-md-inline">
    <button class="rounded-circle border-0" id="sidebarToggle"></button>
  </div>

</ul>


</html>