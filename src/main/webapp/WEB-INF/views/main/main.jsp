<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String ctx = request.getContextPath(); %>


<!DOCTYPE html>
<html lang="en">
<head> 
 <meta charset="UTF-8">
 
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Core Stylesheet -->
    <link href="/css/main/common/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="/css/main/responsive/responsive.css" rel="stylesheet">

</head> 

<body>

    <div align="center" id="mainbanner">
    <c:if test ="${dto.mainbanner_type eq 'VIDEO'}" >
    	<video src='/upload/mainresource/${dto.mainbanner_file}' style="width: 90%;height: 10%" loop="loop" autoplay="autoplay"></video>
    	<%-- <video src="/upload/mainresource/${dto.mainbanner_file }"width="90%" height="10%" loop="loop" autoplay="autoplay"></video> --%>						
    </c:if>

	<c:if test = "${dto.mainbanner_type eq 'PHOTO'}" >
    	<img src="/upload/mainresource/${dto.mainbanner_file}" style="width: 1850px; height: 800px"></img>     
    </c:if>
   </div>

   <br><br><br><br><br><br>


<h4 style="margin-left: 60px; color: gray">BEST</h4>
<br>
<!-- ****** Welcome Post Area Start ****** -->
    <section class="welcome-post-sliders owl-carousel">

        <!-- Single Slide -->
        <div class="welcome-single-slide">
            <!-- Post Thumb -->
            <img src="" alt="XXXXXXXXXXXXXXX">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                    <a href="#">May 19, 2017</a>
                    <a href="#">5 Comment</a>
                </div>
                <a href="#">
                    <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
                </a>
            </div>
        </div>

        <!-- Single Slide -->
        <div class="welcome-single-slide">
            <!-- Post Thumb -->
            <img src="/img/main-img/slide-img/789.jpg" alt="">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                    <a href="#">May 19, 2017</a>
                    <a href="#">5 Comment</a>
                </div>
                <a href="#">
                    <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
                </a>
            </div>
        </div>

        <!-- Single Slide -->
        <div class="welcome-single-slide">
            <!-- Post Thumb -->
            <img src="/img/main-img/slide-img/789.jpg" alt="">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                    <a href="#">May 19, 2017</a>
                    <a href="#">5 Comment</a>
                </div>
                <a href="#">
                    <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
                </a>
            </div>
        </div>

        <!-- Single Slide -->
        <div class="welcome-single-slide">
            <!-- Post Thumb -->
            <img src="/img/main-img/slide-img/789.jpg" alt="">
            <!-- Overlay Text -->
            <div class="project_title"> 
                <div class="post-date-commnents d-flex">
                    <a href="#">May 19, 2017</a>
                    <a href="#">5 Comment</a>
                </div>
                <a href="#">
                    <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
                </a>
            </div>
        </div>

        <!-- Single Slide -->
        <div class="welcome-single-slide">
            <!-- Post Thumb -->
            <img src="/img/main-img/slide-img/789.jpg" alt="">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                    <a href="#">May 19, 2017</a>
                    <a href="#">5 Comment</a>
                </div>
                <a href="#">
                    <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
                </a>
            </div>
        </div>
 
    </section>
    <!-- ****** Welcome Area End ****** -->

   <br><br><br><br><br><br>   <br><br><br><br><br><br>


   
   
   <div class="thumbnail-wrapper"> 
	   <div class="thumbnail"> 
		   <div class="centered"> 
		   	<img src="/upload/mainresource/${dto.photo1_file}"></img> 
		   </div> 
	   </div> 
	   <div id="bannertext" align="center">
	   <h3 style="color: black">${dto.photo1_title}</h3>
     <br>
     <p style="font-size: 15px">${dto.photo1_content}</p>     
     <a href="#" class="mainbuybtn">구매하기</a>
     </div>
   </div>
   <br><br><br><br><br><br>
   
    <div align="center">
    <video src='/upload/mainresource/${dto.video1_file}' style="width: 90%; height: 10%" loop="loop" autoplay="autoplay"></video>
     <br><br>
     <h3 style="color: black">${dto.video1_title}</h3>
     <br> 
	<p style="font-size: 15px">${dto.video1_content}</p>
     <a href="#" class="mainbuybtn">구매하기</a>
   </div>
   <br><br><br><br><br><br>

       
     <div class="thumbnail-wrapper"> 
	   <div class="thumbnail"> 
		   <div class="centered"> 
		   	<img src="/upload/mainresource/${dto.photo2_file}"></img> 
		   </div> 
	   </div> 
	   <div id="bannertext" align="center">
	   <h3 style="color: black">${dto.photo2_title}</h3>
     <br>
     <p style="font-size: 15px">${dto.photo2_content}</p>     
     <a href="#" class="mainbuybtn">구매하기</a>
     </div>
   </div>
   <br><br><br><br><br><br>

   
  <div align="center">
    <video src='/upload/mainresource/${dto.video2_file}' style="width: 80%;height: 10%;" loop="loop" autoplay="autoplay"></video>
     <br><br>
     <h3 style="color: black">${dto.video2_title}</h3>
     <br> 
	<p style="font-size: 15px">${dto.video2_content}</p>    
     <a href="#" class="mainbuybtn">구매하기</a>
   </div>
   <br><br><br><br><br><br>
    <!-- 추천 상품 끝 -->



<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

<script id="rendered-js">
      $('.header').on('click', '.search-toggle', function (e) {
  var selector = $(this).data('selector');

  $(selector).toggleClass('show').find('.search-input').focus();
  $(this).toggleClass('active');

  e.preventDefault();
});

    </script>
    
    </body>
   
   
    