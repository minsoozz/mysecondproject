<%@page import="com.rhymes.app.used.model.ProductsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
tr{
	border: 1px solid black; 
}
</style>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/used/silde.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/used/detail.css">
 <%
 	ProductsDto dto = (ProductsDto)request.getAttribute("dto");
	String arr[] = dto.getPhoto_list();
 %>
 </head>
<!-- <body> -->
<div id="detail_wrap" style="background-color: gray">
	<hr id="_hr">
		
<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
        <c:set var="img" value="<%=arr %>"/>
			<c:forEach var="i" items="${img }" varStatus="status">
			 <li data-color="#1abc9c">              
				<img src="/upload/used/${i }">
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

  <div id="div_title_wrap">
  <div id="div_title"><h2>제목 :${dto.title }</h2></div>
  <div id="div_price"><h5>가격 : 
  <fmt:formatNumber pattern="#,###"
value="${dto.price }" />원</h5></div>
  
  <div id="div_like"><h5>좋아요 : <span id="_likes">${dto.likes }</span></h5></div>
  <div id="div_readcount"><h5>조회수 : ${dto.readcount }</h5></div> 
  <div id="div_rdate"><h5>등록일 : <fmt:formatDate value="${dto.rdate }" pattern="yyyy-MM-dd "/></h5></div>
  <div id="div_blacklist">
 	 <c:if test="${userloginid ne null}">
 		<h5><a href="#none" id="mybtn">신고하기</a></h5>
	 </c:if>

	 <c:if test="${userloginid eq null}">
 	    <h5><a href="#none" class="gologin">신고하기</a></h5>
  	 </c:if>
  </div>  
  <div id="div_category"><h5>카테고리 ${dto.category }</h5></div>  
  <div id="div_like_button">
  	<!-- <button type="button" id="_likebtn">찜</button> -->
  	
  	<!-- 좋아요 기능 시작!!! -->
  	<c:choose>
  		<c:when test="${userloginid ne null }">
  			<c:if test="${login.islike == 'true' }">
	  			<a href='javascript: like_func()'><img id="likeimg" alt="" src="/img/used-img/likeAf.png" style="width: 50px" height="50px" id="like_img"></a>
  			</c:if>
			  		<c:if test="${login.islike == 'false' }">
  				<a href='javascript: like_func()'><img id="likeimg" alt="" src="/img/used-img/like.png" style="width: 50px" height="50px" id="like_img"></a>
  			</c:if>
  		</c:when>
  	<c:otherwise>
  		<a href="#none" class="gologin"><img alt="" src="/img/used-img/like.png" style="width: 50px" height="50px"></a>
  	</c:otherwise>
  	</c:choose>
  </div>
	
  <div id="div_notes_button">
  	<button type="button" id="_notesbtn">쪽지 보내기</button>
  </div>
  </div>
  
 	<div id="div_content">
 		<h5>상품정보 ${dto.content }</h5>
 	</div>

	<div id="map" style="width:400px;height:300px;">
	</div>
	
	<c:if test="${login.userid eq dto.s_id}">
	<div id="div_btn">
		<button type="button" id="_updatebtn" name="updatebtn">수정</button>
		<button type="button" id="_deletebtn" name="deletebtn">삭제</button>
	</div>
	</c:if>
</div>

<div id="sub_wrap" align="center">
<h1>댓글 구역</h1>
<div id="_addcomments">
</div>
<table>
<tr>
	<td>
		<textarea rows="3" cols="80" id="_comments" name="comments" placeholder="댓글을 입력하세요"></textarea>
		<br>
		  <div>
			<a href="#" onclick="addComment('${dto.seq}')">등록</a>
		  </div>
	</td>
</tr>
</table>


</div>


  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">신고하기</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body">
				<ul class="list">
					<li><input type="radio" name="list" class="list-checkbox"
						id="list-input1" checked /> <label for="list-input1"
						class="title">광고(상점홍보,낚시글,도배글)</label>
						<div class="desc">
							<div>
								<a href="#none" val="상점홍보" class="modal_text">상점홍보</a><br>
								<a href="#none" val="낚시글" class="modal_text">낚시글</a><br>
								<a href="#none" val="도배글" class="modal_text">도배글</a><br>
								<a href="#none" val="타사이트,어플 광고" class="modal_text">타사이트,어플 광고</a>
							</div>
						</div></li>
					<li><input type="radio" name="list" class="list-checkbox"
						id="list-input2" /> <label for="list-input2"
						class="title">물품정보 부정확(카테고리,가격,사진)</label>
						<div class="desc">
							<div>
								<a href="#none" val="카테고리가 잘못됨" class="modal_text">카테고리가 잘못됨</a><br>
								<a href="#none" val="가격이 잘못됨" class="modal_text">가격이 잘못됨</a><br>
								<a href="#none" val="사진이 잘못됨" class="modal_text">사진이 잘못됨</a><br>
								<a href="#none" val="상품명이 잘못됨" class="modal_text">상품명이 잘못됨</a>
							</div>
						</div></li>
					<li><input type="radio" name="list" class="list-checkbox"
						id="list-input3" /> <label for="list-input3" class="title">거래 금지 품목(담배,주류,장물)</label>
						<div class="desc">
							<div>
								<a href="#none" val="담배/주류" class="modal_text">담배/주류</a><br>
								<a href="#none" val="장물(분실폰,분실의류..)" class="modal_text">장물(분실폰,분실의류..)</a><br>
								<a href="#none" val="의약품류" class="modal_text">의약품류</a><br>
								<a href="#none" val="콘택트 렌즈" class="modal_text">콘택트 렌즈</a><br>
							</div>
						</div></li>
					<li><input type="radio" name="list" class="list-checkbox"
						id="list-input4" /> <label for="list-input4"
						class="title">언어폭력(비방,욕설,성희롱)</label>
						<div class="desc">
							<div>
								<a href="#none" val="비방/욕설" class="modal_text">비방/욕설</a><br>
								<a href="#none" val="성희롱" class="modal_text">성희롱</a>
							</div>
						</div></li>
					<li><input type="radio" name="list" class="list-checkbox"
						id="list-input5" /> <label for="list-input5"
						class="title">기타사유(직접입력)</label>
						<div class="desc">
							<div>
							
							<textarea cols="60" rows="3" id="modal_area"></textarea>
							<br>
							<button type="button" class="modal_btn" style="color: black">등록</button>
							</div>
						</div></li>
				</ul>
			</div>
			<div class="modal-footer">
			<!-- 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			 --></div>
		</div>

	</div>
  </div>

<script type="text/javascript">

function gologin(){
	 var con_test = confirm("로그인이 필요합니다 로그인 페이지로 이동하시겠습니까?");	/* 문자를 보낼껀지 물어본다 */
	 
	 if(con_test == true){
		location.href="/member/login";
   }
	 
	 else if(con_test == false){
  		
	 }
}

$(document).ready(function(){
	
	
	
	$(".gologin").click(function() {
		gologin();
	})
	
	$("#mybtn").click(function(){
        $("#myModal").modal();
    });
    
    $(".modal_text").click(function(){
     	var str = 	$(this).attr('val')
    	var seq = "${dto.seq }";
    	var id = "${userloginid }";
    	var b_id = "${dto.s_id}";
    	
     	$.ajax({
     		url:"/used/blacklist",
     		type:"get",
     		data:{
     			str:str,
     			seq:seq,
     			id:id,
     			b_id:b_id
     		},
     		success:function(data){
     			var count = parseInt(data);
     			
     			if(count > 0) {
     			       $("#myModal").modal('hide');
     			        alert("신고가 완료되었습니다");
     			} else {
     				alert("오류 관리자한테 문의~");
     			}
     		},
     		error:function(e){
     			alert(e);
     		}
     	});
     	

    
    
    });
    
    $(".modal_btn").click(function(){
     var str =  $("#modal_area").val()
     var seq = "${dto.seq }";
 	 var id = "${login.userid }";
 	 var b_id = "${dto.s_id}";
 	
  	$.ajax({
  		url:"/used/blacklist",
  		type:"get",
  		data:{
  			str:str,
  			seq:seq,
  			id:id,
  			b_id:b_id
  		},
  		success:function(data){
  			var count = parseInt(data);
  			
  			if(count > 0) {
  			       $("#myModal").modal('hide');
  			        alert("신고가 완료되었습니다");
  			} else {
  				alert("오류 관리자한테 문의~");
  			}
  		},
  		error:function(e){
  			alert(e);
  		}
  	});
     
     
    });
    

});



//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();

var myref;
var wid;
var next_backup;		// 댓글 html 백업
var mydiv_backup;		// 수정,삭제 html 백업

var myseq;
var my;
var next;	// tr 밑에 줄..
var mydiv;									// div로 묶인 수정,삭제 제거

var myseq2;
var my2;
var next2;
var mydiv2;

var next_backup2;		// 답글 html 백업
var mydiv_backup2;		// 답글 html 백업

var count = 0;

$("#_deletebtn").click(function() {
	var seq = "${dto.seq}";
	location.href="/used/deleteProduct?seq="+seq;
})


$("#_updatebtn").click(function() {
	var seq = "${dto.seq}";
	location.href="/used/updateProduct?seq="+seq;
})


function like_func(){
	
 	$.ajax({		// 좋아요 버튼 클릭시
		url:"/used/addlikes",
		type:"get",
		data:{bno : "${dto.seq}",
			   mname : "${login.userid}"
		},
			success:function(num){
				if(num == 1){
					$("#likeimg").attr("src","/img/used-img/likeAf.png");
				} else if (num == 0){
					$("#likeimg").attr("src","/img/used-img/like.png");
				}
				likeCount();
			
			},
			error:function(e){
				alert("실패");
			}
	}) 
};


 function likeCount(){
	$.ajax({
		url:"/used/likeCount",
		type:"get",
		data: {
			bno : "${dto.seq}"
		},
		success:function(count){
			$("#_likes").html(count);
		},
		error:function(e){
			alert("error");
		}
	})
};

/* 페이지 로딩시 댓글 불러오기 */
$(function(){
    getCommentList();
});

/* 댓글 불러오기 Ajax */
 function getCommentList(){
	 $.ajax({
		url:"/used/getCommentsList",
		type:'get',
		data: {
			seq : "${dto.seq}"
		},
		success:function(data){
			
			var html = "";
			var cnt =  data.length;

			if(data.length > 0){
				html += "<div><table id='ctable'><col width='90'><col width='50'><col width='80'><col width='80'>";
				
			for(i=0; i<data.length; i++){
				var seq = data[i].seq;
				var id = data[i].id ;
				var loginid = "${login.userid}";
				var ref = data[i].ref;
				var depth = data[i].depth;
				
				
				var arrow = "<img src='/img/used-img/arrow.png' width='10px' height='10px'/>";
				
				if(depth > 0){
					html += "<tr><td>"+arrow+"&nbsp;"+data[i].id+"</td><td><a href='#none' value='"+data[i].id+"' onclick='answer_comment(this,"+seq+","+ref+")'>답글</a></td><td>"+data[i].rdate+"</td>";
						
				} else {
					html += "<tr><td>"+data[i].id+"</td><td><a href='#none' value='"+data[i].id+"' onclick='answer_comment(this,"+seq+","+ref+")'>답글</a></td><td>"+data[i].rdate+"</td>";
						
				}
				
				// html += "<tr><td>"+data[i].id+"</td><td><a href='#none' onclick='answer_comment(this,"+seq+","+ref+")''>답글</a></td><td>"+data[i].rdate+"</td>";
				
				if(loginid.trim() == id.trim()){
					html += "<td><div><a href='#none' onclick='update_comment(this,"+seq+")'>수정</a> | <a href='javascript: delete_comment(${dto.seq},"+seq+")'>삭제</a></div></td></tr>";				
				} else {
					html +="<td></td></tr>";	
				}
				
				
				
				html += "<tr><td colspan='4'>"+data[i].comments+"</td></tr>";
				html += "</div>";
	
			} 
				html += "</table>";
			
			} else {
				html += "<div>";
				html += "<table>";
				html += "<tr><td>등록된 댓글이 없습니다.</td></tr>";
				html += "</div>";
				html += "</table>";
				
			}
			
			$("#_addcomments").html(html);
				
		},
		error:function(r,s,e){
			alert("실패..");
		}
	 });
 };
 
 function addComment(seq){
	 
	 var loginid = "${login.userid}";
	 
	 if(loginid == null || loginid == ""){
		 gologin();
		 return;
	 }
	 
	 var text = $("#_comments").val();
	 
	 if(text == "" || text == null){
		 alert("빈칸이나 공백은 안됩니다");
		 $("#_comments").focus();
		 return;
		 
	 }
	 
	 $.ajax({
		url:'/used/addComments',
		type:'get',
		data:{
			parent:seq,
			comments:$("#_comments").val(),
			userid:"${login.userid}"
		},
		success:function(data){
			$("#_comments").val("")
			getCommentList();
		},
		error(e){
			
		}
	 });
 };
 
 function update_comment(th,seq){	// 수정버튼
	 count++;
 	 
 	 if(count >= 2){
 		 
 		 alert("수정은 동시에 두개를 할 수 없습니다");
 		 
 		 return;
 	 }
 
 
	 myseq = seq;
	 my = th;
	 next = $(my).parent().parent().parent().next().after();	// tr 밑에 줄..
	 mydiv = $(my).parent();									// div로 묶인 수정,삭제 제거
	 
//	 $(th).parent().parent().remove(); // 여기까지가 a 태그가 포함되어있다 
	 
	next_backup = next.html();		// 댓글 html 백업
	mydiv_backup = mydiv.html();	// 수정,삭제 html 백업
	
	
	 var comment_backup = next.text();	// 댓글 내용 백업

	 
	 next.html("<td colspan='4'><textarea rows='3' cols='75' id='_ucomments' name='ucomments'>"+comment_backup+"</textarea><a href='#none' onclick='updatecomment(${dto.seq},myseq)'>수정</a></td>");	
	 mydiv.html("<a href='#none' onclick='cancel(this)' >수정취소</a>");
	 
 }
 
 
 function answer_comment(th,seq,ref){
	 var wid = $(th).attr('value');
	 var loginid = "${login.userid}";
	 if(loginid == "" || loginid == null){
		 gologin();
		 return;
	 }
	 
	 count++;
	 
 	 if(count >= 2){
 		 
 		 alert("수정은 동시에 두개를 할 수 없습니다");
 		 

 		 return;
 	 }
	 myseq2 = seq;
	 myref = ref;
	 my2 = th;
	 next2 = $(my2).parent().parent().next().after();	// tr 밑에 줄..
	 mydiv2 = $(my2).parent();							// 답글
	 
	 
	next_backup2 = next2.html();	// 댓글 html 백업
	mydiv_backup2 = mydiv2.html();	// 수정,삭제 html 백업
	
	 next2.after("<tr id='_answer'><td colspan='4'><textarea rows='3' cols='75' placeholder='"+wid+"에게 답글 쓰기' id='_ucomments2' name='ucomments2'></textarea><a href='#none' onclick='insert_answer(${dto.seq},myseq2,myref)'>등록</a></td></tr>");	
	 mydiv2.html("<a href='#none' onclick='cancel2()' >취소</a>")
	
 }
 
 function insert_answer(parent,seq,ref){
	 var text = $("#_ucomments2").val();
	 
	 if (text == "" || text == null){
		 alert("빈칸이나 공백은 안됩니다");
		 $("#_ucomments2").focus();
		 	return;
	 }
	 
	 
	 $.ajax({
		 url:'/used/insertanswer',
	 	 type:'get',
	 	 data:{
	 		 parent : parent,
	 		 seq : seq,
	 		 comments : $("#_ucomments2").val(),
	 		 userid:"${login.userid}",
	 		 ref : ref
	 	 },
	 	 success : function(data){
	 		getCommentList();
	 		count = 0;
	 	 },
	 	 error(e){
	 		 alert("실패");
	 	 }
	 })
 }
 
 function cancel(th){
	 count = 0;
	 my = th;
	 next = $(my).parent().parent().parent().next().after();	// tr 밑에 줄..
	 mydiv = $(my).parent();									// div로 묶인 수정,삭제 제거

	 next.html(next_backup);
	 mydiv.html(mydiv_backup);
 }
 
 function cancel2(){
	 count = 0;
	 
	// next2.html(next_backup2);
	$("#_answer").remove();
	 mydiv2.html(mydiv_backup2);
 }
 
 function updatecomment(parent,myseq){
	 var text = $("#_ucomments").val();
	 if (text == "" || text == null){
		 alert("빈칸이나 공백은 안됩니다");
		 $("#_ucomments").fucus();
		 return;
	 }
	 
	 
	 $.ajax({
		 url:'/used/updateComment',
	 	 type:'get',
	 	 data:{
	 		 parent : parent,
	 		 seq : myseq,
	 		 comments : $("#_ucomments").val()
	 	 },
	 	 success : function(data){
	 		getCommentList();
	 		count = 0;
	 	 },
	 	 error(e){
	 		 alert("실패");
	 	 }
	 })
 }
 
 function delete_comment(parent,seq){
	 count = 0;	 
	 var con_test = confirm("댓글을 삭제하시겠습니까?");	/* 문자를 보낼껀지 물어본다 */
	 
	 if(con_test == true){


	 $.ajax({
		 url:'/used/deleteComment',
		 type:'get',
		 data:{
			 parent:parent,
			 seq:seq
		 },
		 success:function(data){
			 getCommentList();
		 },
		 error(e){
			 alert("실패");
		 }
	 })
   }
	 
	 else if(con_test == false){
  		
	 }
 }

 

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