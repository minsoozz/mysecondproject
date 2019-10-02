<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="prc"/>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head> 
<meta charset="UTF-8">

<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
                
                    <!--  맨위에 sns 아이콘들 -->
                    <div class="top_social_bar">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>


                    </div>
                </div>
                
               
                
                <!--  Login Register Area  -->
                <div class="col-7 col-xs-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <div class="login_register_area d-flex">
                        	<c:choose>
                        		<c:when test="${prc eq 'anonymousUser' }">
                        			<div class="login">
		                                <a href="<%=ctx%>/member/login">Sign in</a>
		                            </div>
		                            <div class="register">
		                                <a href="regi.jsp">Sign up</a>
		                            </div>                        			                        			                       			
                        		</c:when>
                        		<c:otherwise>
                        			<div class="header_mypage_wrap">
		                                <a href="<%=ctx%>/mypage/orderlog">MyPage</a>
		                            </div>
                        			 <div class="logout">
		                                <form action="<%=ctx%>/logout" method="post">
		                                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		                                	<input type="submit" value="logout" style="z-index: 100; margin-right:600px;">
		                                </form>
		                            </div>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                        
                        <!-- 
                         Search Button Area
                        <div class="search_button">
                            <a class="searchBtn" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                        </div>
                        
                        Search Form
                        <div class="search-hidden-form">
                            <form action="#" method="get">
                                <input type="search" name="search" id="search-anything" placeholder="검색어를 입력하세요...">
                                <input type="submit" value="" class="d-none">
                                <span class="searchBtn"><i class="fa fa-times" aria-hidden="true"></i></span>
                            </form>
                        </div>
                         -->
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
                                    <a class="nav-link" href="#">WOMEN</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">MEN</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">MARKET</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">EVENT</a>
                                </li>
                                <li class="nav-item">
                           			<a class="nav-link" href="/Rhymes/noticelist">CUSTOMER CENTER</a>
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
	</script>
	</body>




</html>