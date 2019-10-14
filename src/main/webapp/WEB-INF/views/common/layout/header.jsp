<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="prc"/>
<% String ctx = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">


<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->

<!-- Core Stylesheet -->
<link href="/css/main/common/style.css" rel="stylesheet">

<!-- Responsive CSS -->
<link href="/css/main/responsive/responsive.css" rel="stylesheet">

<!-- 아이콘 활용을 위한 font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
</head> 

<body>
    <!-- ****** Top Header Area Start ****** -->
    
    <div class="top_header_area">
        <div class="container">
            <div class="row">
                <div class="col-5 col-xs-6"> 
                    <div class="top_social_bar">

                    
                    <!--  맨위에 sns 아이콘들 -->
                    <div class="top_social_bar">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="https://www.instagram.com/rhymesstore/?igshid=16e3i1e5qn8aq"><i class="fa fa-instagram" aria-hidden="true"></i></a>

                    </div>


                    </div>
                </div>
                
                <!--  Login Register Area  -->
                <div class="col-7 col-xs-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <div class="login_register_area d-flex">
						<c:if test="${userloginid eq null}">    
                            <div class="login">
                                <a href="/member/login">Login</a>
                            </div>
                            <div class="join">
                                <a href="/member/regiMain">Join</a>
                            </div>
                            
                        </c:if>
                        
                        <c:if test="${userloginid ne null}">
                        
                        	<div class="">
                        		<span>안녕하세요 ${userloginid } 님  &nbsp;</span>
                        	</div>
                        	&nbsp;&nbsp;
                        	<div class="logout">
                        		<a href="/member/logout">Logout</a>                        		
                        	</div>
                            
                        </c:if>
                        
                        
						<div class="admin">
                       	<c:if test="${userloginid eq 'ADMIN' }">
                       		<a href="/admin/main">Admin</a>
                       	</c:if>
                       	</div>




                            <div class="mypage">
                                <a href="/mypage/orderlog">Mypage</a>
                            </div>
                            <c:if test="${userloginid ne null}">
                            <div class="cart">
                                <a href="/store/basket">Cart</a>
                            </div>
							</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Top Header Area End ****** -->    
    
<br><br>

    <!-- ****** Header Area Start ****** -->
    <header class="header_area">
        <div class="container">
            <div class="row">
            
                <!-- Logo Area Start -->
                <div class="col-12" >
                    <div class="logo_area text-center">

				<a href="<%=ctx%>/main" id="logo"><img src="/img/main-img/core-img/banner.png" style="width: 150px" ></img></a>

                    </div>
                </div>
            </div>
            
             
<div class="menuWrap">
<div class="blogmenu">
            <div class="row" >
                <div class="col-12">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#rhymesshop-nav" aria-controls="rhymesshop-nav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i> Menu</button>
                        
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="rhymesshop-nav">
                            <ul class="navbar-nav" id="rhymes-nav">
                            
                                <li class="nav-item">
                                    <a class="nav-link" href="/store/productList?c1_name=WOMEN">WOMEN</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/store/productList?c1_name=MEN">MEN</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/used/usedlist">MARKET</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">EVENT</a>
                                </li>
                                <li class="nav-item">
                           			<a class="nav-link" href="/customercenter/noticelist">CUSTOMER CENTER</a>
                           		</li>
                           		
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            </div>
            </div>
        </div>
    </header>
    
<a id="backToTop" class="scrolltop" href="#">
      <i class="fas fa-chevron-circle-up"></i>
    </a>
    
    <!-- ****** Header Area End ****** -->
       
    <!-- nav바 밑으로 내리면 상단에 고정시켜주는 코드-->
     <script type=text/javascript>
	$(document).ready(function(){
		
	    var nav = $('.menuWrap');
	    $(window).scroll(function () {
	        if ($(this).scrollTop() > 312) {
	            nav.addClass("float-menu");
	        }else {
	            nav.removeClass("float-menu");
	        }
	    });
	});
	
	jQuery(document).ready(function () {
        $(window).scroll(function () {
          if ($(this).scrollTop() > 100) {
            $('#backToTop').fadeIn(500);
          } else {
            $('#backToTop').fadeOut('slow');
          }
        });
        $('#backToTop').click(function (e) {
          e.preventDefault();
          $('html, body').animate({scrollTop: 0}, 200);
        });
      });
	
	
	</script> 
	</body>

</html>