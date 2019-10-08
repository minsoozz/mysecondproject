<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="menu_table">
	<h2>민수마켓</h2>
	<ul style="width: 100%">
		<li class="title"><a href="usedlist">게시판 목록</a></li>
		<li class="menu_item"><a href="#none" id="usedwrite">판매 등록</a></li>
	</ul>
</div>

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
				alert("판매자격이 없습니다");
			}
			
		},
		error:function(e){
			alert(e);
		}	
	})		
	
	})
})


</script>