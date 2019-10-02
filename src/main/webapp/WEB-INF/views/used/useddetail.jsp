<%@page import="com.rhymes.app.used.model.ProductsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css"	
	href="<%=request.getContextPath() %>/css/used/silde.css">
 <%
 	ProductsDto dto = (ProductsDto)request.getAttribute("dto");
	String arr[] = dto.getPhoto_list();
 %>
</head>
<body>
<div style="background-color: gray">
	<hr id="_hr">
		
<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
        <c:set var="img" value="<%=arr %>"/>
			<c:forEach var="i" items="${img }" varStatus="status">
			 <li data-color="#1abc9c">              
				<img src="/upload/${i }">
             </li>
			</c:forEach>
          </ul>
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
                
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->  
                 
      </div>
  
   </div>

  <div id="div_title"><h2>${dto.title }</h2></div>
  <div id="div_price"><h5>${dto.price }</h5></div>
  <div id="div_like"><h5>${dto.likes }</h5></div>
  <div id="div_readcount"><h5>${dto.readcount }</h5></div> 
  <div id="div_rdate"><h5>${dto.rdate }</h5></div>
  <div id="div_blacklist"><h5><a href="#">신고하기</a></h5></div>
  <div id="div_place"><h5>거래지역 : ${dto.place }</h5></div>
  
  <div id="div_like_button">
  	<button type="button" id="_likebtn">찜 ${dto.likes }</button>
  </div>
	
  <div id="div_notes_button">
  	<button type="button" id="_notesbtn">쪽지 보내기</button>
  </div>

</div>
	<div id="map" style="width:100%;height:350px;"></div>
<div id="sub_wrap">
<h1>서브 구역</h1>
<h5>상품정보 ${dto.content }</h5>
<h5>거래지역 ${dto.place }</h5>
<h5>카테고리 ${dto.category }</h5>



</div>
	<script type="text/javascript">
	//current position
	var pos = 0;
	//number of slides
	var totalSlides = $('#slider-wrap ul li').length;
	//get the slide width
	var sliderWidth = $('#slider-wrap').width();


	$(document).ready(function(){
	    
	    
	    /*****************
	     BUILD THE SLIDER
	    *****************/
	    //set width to be 'x' times the number of slides
	    $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
	    
	    //next slide    
	    $('#next').click(function(){
	        slideRight();
	    });
	    
	    //previous slide
	    $('#previous').click(function(){
	        slideLeft();
	    });
	    
	    
	    
	    /*************************
	     //*> OPTIONAL SETTINGS
	    ************************/
	    //automatic slider
	    var autoSlider = setInterval(slideRight, 3000);
	    
	    //for each slide 
	    $.each($('#slider-wrap ul li'), function() { 

	       //create a pagination
	       var li = document.createElement('li');
	       $('#pagination-wrap ul').append(li);    
	    });
	    
	    //counter
	    countSlides();
	    
	    //pagination
	    pagination();
	    
	    //hide/show controls/btns when hover
	    //pause automatic slide when hover
	    $('#slider-wrap').hover(
	      function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
	      function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
	    );
	    
	    

	});//DOCUMENT READY
	    


	/***********
	 SLIDE LEFT
	************/
	function slideLeft(){
	    pos--;
	    if(pos==-1){ pos = totalSlides-1; }
	    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
	    
	    //*> optional
	    countSlides();
	    pagination();
	}


	/************
	 SLIDE RIGHT
	*************/
	function slideRight(){
	    pos++;
	    if(pos==totalSlides){ pos = 0; }
	    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
	    
	    //*> optional 
	    countSlides();
	    pagination();
	}



	    
	/************************
	 //*> OPTIONAL SETTINGS
	************************/
	function countSlides(){
	    $('#counter').html(pos+1 + ' / ' + totalSlides);
	}

	function pagination(){
	    $('#pagination-wrap ul li').removeClass('active');
	    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
	}
	</script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bf45b993c5f0c0b5cb3c002d2b1ed28&libraries=services"></script>
<script>
var address = '${dto.place}';

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">거래장소</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
	
	
</body>
</html>