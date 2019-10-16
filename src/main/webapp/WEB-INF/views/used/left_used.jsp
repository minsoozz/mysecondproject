<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<%-- <div class="sidenav">
	<h2>민수마켓</h2>
	<ul style="width: 100%">
		<li class="title"><a href="usedlist">게시판 목록</a></li>
 		 <c:if test="${userloginid ne null}">
		<li class="menu_item"><a href="#none" id="usedwrite">판매 등록</a></li>
		 </c:if>
		<c:if test="${userloginid eq null}">
   		</c:if>
	</ul>
</div>
 --%>
 
 

<div class="sidenav">

<font style="font-size: 15px;"><b>MARKET</b></font>
<hr width = "85%" color = "#DADCE0">
<a href="#">ALL</a>
 <a href="#">남성 의류</a>
 <a href="#">여성 의류</a>
 <a href="#">패션 잡화</a>
 <a href="#">뷰티 미용</a>
 <a href="#">무료 나눔</a>
 
 <c:if test="${userloginid ne null}">
 <a href="#none" id="usedwrite">판매 등록</a>
 </c:if>
 <c:if test="${userloginid eq null}">
 </c:if>
 
</div>






<body>
<script>

$(document).ready(function() {
	
	$("#usedwrite").click(function() {
		var id ="${login.userid}";
		
	$.ajax({
		url:"/used/getSeller",
		type:"get",
		data:{
			s_id:id
		},
		success:function(data){
			var count = parseInt(data);
			if(count > 0){
				location.href="usedwrite";
			} else {
				 var con_test = confirm("판매자 등록이 필요합니다 이동하시겠습니까?");	
				 
				 if(con_test == true){
			 			popupOpen();
				 }
					 else if(con_test == false){
					
					 }
			}
			
		},
		error:function(e){
			alert(e);
		}	
	})		
	
	})
})

function popupOpen(){
	var url= "popup";    //팝업창 페이지 URL
	var winWidth = 600;
    var winHeight = 600;
    
    var popupX = (window.screen.width / 2) - (580 / 2);
 	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

 	var popupY= (window.screen.height / 2) - (700 / 2);
 	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
    
    
    var popupOption= "width="+winWidth+", height="+winHeight + ", left="+ popupX + ", top="+ popupY;    //팝업창 옵션(optoin)
	window.open(url,"",popupOption);
}



//* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
    dropdownContent.style.display = "none";
  } else {
    dropdownContent.style.display = "block";
  }
});
}

</script>
</body>