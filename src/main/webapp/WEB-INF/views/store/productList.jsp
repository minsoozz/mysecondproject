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
 
<div class='mainDiv'>
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