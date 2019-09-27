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
	<link rel="stylesheet" type="text/css"	
	href="<%=request.getContextPath() %>/css/used/detail.css">
 <%
 	ProductsDto dto = (ProductsDto)request.getAttribute("dto");
	String arr[] = dto.getPhoto_list();
 %>
</head>
<body>
<div id="content_wrap" style="background-color: gray">
	<hr id="_hr">
		
<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
        <c:set var="img" value="<%=arr %>"/>
			<c:forEach var="i" items="${img }" varStatus="status">
			 <li data-color="#1abc9c">
                <div>
                    <h3>${i }</h3>
                    <span>${i }</span>
                </div>                
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
	
</body>
</html>