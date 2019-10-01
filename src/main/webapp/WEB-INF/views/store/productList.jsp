<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- security ajax -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
 
<!-- Core Stylesheet -->
<link href="/css/common/style.css" rel="stylesheet">

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

<style>

body{

	font: Open Sans;
	min-height: 100%;
	box-sizing: border-box;	
}

.mainDiv{
	border: 1px solid red;
	width:80%;
	height:auto;
	background-color: blue;
	margin:0 auto;
	position: fixed;
}

.subDiv{
	margin:0 auto;
	display:table;
	background-color: yellow;
	width:90%;
	height:auto;
	text-align: center;
	vertical-align: middle;
	left:50%;
	margin-top:5px;
	align:center;
}

.eachDiv{
	display:inline-block;
	border: 1px solid black;
	width: auto;
	float:left;
	margin-bottom: 3%;
	margin-top: 1px;
	margin-left:2%;
	margin-right:1%;
	text-align: center;
	background-color: orange;
}

</style>
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
                            
                            <div class="login">
                                <a href="a.jsp">Login</a>
                            </div>
                            <div class="join">
                                <a href="a.jsp">Join</a>
                            </div>
                            <div class="mypage">
                                <a href="a.jsp">Mypage</a>
                            </div>
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

				<a href="#" id="logo">logo</a>

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

<div class='mainDiv'>
	<!-- ★ csrf 예방을 위한 코드추가 -->
	<div class='subDiv' align='center' ">
	<c:forEach items="${plist }" var="pro" varStatus="vs">
	<div class='eachDiv' style="cursor:pointer;" onclick="detail(${pro.p_seq })"> 
		<img alt="사진없음" src="/upload/${pro.photo1_file }" style="width:250px;height:250px;" style="margin:3%;"><br>
		<font size="5px"><b>${pro.p_name }</b></font><br>
		<font size="4px">&#8361;${pro.p_price2 }<br>
		<font size="3px">(${pro.p_color })</font>
	</div>	
	</c:forEach>
	</div>
</div>               
<form action="/Rhymes/store/productDetail" id="moveFrm" method="get">
	<%-- <!-- ★ csrf 예방을 위한 코드추가 -->
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
	<input type="hidden" id="p_seq" name="p_seq" value="0">
	<div align='center'>
		<!-- <input type="submit" value="상품 등록" > -->
	</div>
</form>


 <!-- ****** Footer Menu Area Start ****** -->
    <div id="footer_wrap">
    <footer id="footer_wrap"style="align-content: center;">
        <div class="container"style="align-content: center;">
            <div class="row "style="align-content: center;">
                <div class="col-12" style="align-content: center;">
                <br><br>
                <div style="align-content: center;">
                    <div style="float:left;  padding-left: 50px"> 
                        <h4>COMPANY</h4>
                        <div>
						<h6>ABOUT US</h6>
						<p>
						<br>© 2019 <a style="color: #B7DC57">RHYMES</a> - ALL RIGHTS RESERVED.
						<br>ALL IMAGES HAVE BEEN TAKEN BY RHYMES.
						<br>RHYMESb | TEL. +82-2-3486-9600
						<br>459, GANGNAM-DAERO, SEOCHO-GU, SEOUL, KOREA.
						<br>MAIL-ORDER LICENCE 2019-SEOULGANGNAM-0920
						<br>BUSINESS LICENCE 520-88-190920
						</p>
						</div>
                    </div>
                    
                  <div style="float:left; padding-left: 200px">
					<h4>STORES</h4>
						<div>
							<h6 style="color: #B7DC57">RHYMES</a></h6>
							<p>TEL. +82-2-3486-9600<br/>
							459, GANGNAM-DAERO, SEOCHO-GU, SEOUL, KOREA.<br/></p>
							
							<h6 style="color: #B7DC57">RHYMES OUTLET</a></h6>
							<p>TEL. +82-2-3486-9600<br/>
							459, GANGNAM-DAERO, SEOCHO-GU, BAEKAM BLD 5F,<br/>
							SEOUL, KOREA.<br/></p>							
						</div>
					</div>
                    </div>
                </div>
            </div> 
        </div>
<br><br>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Copywrite Text -->
                    <div class="copy_right_text text-center">
                        <p>Copyright @2019 All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>


    <!-- ****** Footer Menu Area End ****** -->

<!-- 상품 상세정보 이동 -->
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

function detail(seq){
	$("#p_seq").val(seq); 
	$("#moveFrm").submit();
	
}

/* 가격 comma */
 $(document).ready(function(){
	// var money = $(".commamoney").text();
	 //alert(money);
 });
 
</script>

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
	
    <!-- ****** Footer Menu Area End ****** -->
    
    <!-- Jquery-2.2.4 js -->
   <script src="../js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
   <script src="../js/bootstrap/popper.min.js"></script>
       <!-- Bootstrap-4 js -->
   <script src="../js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins JS -->
    <script src="../js/others/plugins.js"></script>
    <!-- Active JS -->
    <script src="../js/active.js"></script>
	
</body>
</html>