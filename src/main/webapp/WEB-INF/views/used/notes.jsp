<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String ctx = request.getContextPath(); %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="<%=ctx %>/js/used/notes.js"></script>
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/notes.css">

</head>
<body>
<input type="hidden" id="_loginid" name="loginid" value="${userloginid }"> 
<button type="button" id="_send" name="send">쪽지 보내기</button>

<c:if test="${dto.subscribe eq 0 }">	<!-- 수신 설정 -->
	<a href='javascript: subscribe_func()'><img id="bellimg" alt="" src="/img/used-img/bell.png" style="width: 50px" height="50px" id="like_img"></a>
</c:if>

<c:if test="${dto.subscribe eq 1 }"> 	<!-- 수신거부 설정 -->
		<a href='javascript: subscribe_func()'><img id="bellimg" alt="" src="/img/used-img/bellAf.png" style="width: 50px" height="50px" id="like_img"></a>
</c:if>

<div class="review_main_wrap">
	<ul class="nav nav-tabs" id="review_main_nav_tab" role="tablist">
		<li class="nav-item review_main_nav_tab_item">
			<a class="nav-link active" id="waiting_items-tab" data-toggle="tab" href="#_waiting_items" role="tab" 
			aria-controls="_waiting_items" aria-selected="true">받은 쪽지함</a>
		</li>
		<li class="nav-item review_main_nav_tab_item">
			<a class="nav-link" id="written_reviews-tab" data-toggle="tab" href="#_written_reviews" role="tab" 
			aria-controls="_written_reviews" aria-selected="false">보낸 쪽지함</a>
		</li>		
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<!-- 받은 쪽지함 탭 시작 -->
		<div class="tab-pane active" id="_waiting_items" role="tabpanel" aria-labelledby="waiting_items-tab">
		<br><br>
		<table border="1" id="_ntable">
		<col width="150"><col width="400"><col width="150"><col width="40">
		<tr>
			<th>보낸사람</th><th>내용</th><th>날짜</th><th>삭제</th>					
		</tr>
		<c:forEach items="${rlist }" var="notes" varStatus="i">
			<c:if test="${notes.recv_del eq 'N' }">
		<tr>
			<td align="center"><a href="#none" seq="${notes.seq }" onclick="notesdetail(this)">${notes.send_id }</a></td>
			<td><div id="_content"><a href="#none"  seq="${notes.seq }" onclick="notesdetail(this)">${notes.content }</a></div></td>
			<td>${notes.data_send }</td><td><button type="button" id="rbtn" value="${notes.seq }" send_id="${notes.send_id }">삭제</button></td>	
		</tr>	
			</c:if>
		</c:forEach>
		
		<c:if test="${empty slist }">
		<tr><td colspan="4" align="center">
		받은 쪽지가 없습니다</td>
		</tr>					
		</c:if>
		
		</table>
		</div><!-- 받은 쪽지함 탭 끝 -->
		
		<!-- 보낸 쪽지함 탭 시작 -->
		<div class="tab-pane" id="_written_reviews" role="tabpanel" aria-labelledby="written_reviews-tab">
				<br><br>
		<table border="1" id="_ntable">
		<col width="150"><col width="400"><col width="150"><col width="40">
		<tr>
			<th>받는사람</th><th>내용</th><th>날짜</th><th>삭제</th>					
		</tr>
		<c:forEach items="${slist }" var="notes" varStatus="i">
			<c:if test="${notes.send_del eq 'N' }">
		<tr>
			<td align="center"><a href="#none" seq="${notes.seq }" onclick="notesdetail(this)">${notes.recv_id }</a></td>
			<td><div id="_content"><a href="#none"  seq="${notes.seq }" onclick="notesdetail(this)">${notes.content }</a></div></td>
			<td>${notes.data_send }</td><td><button type="button" id="sbtn" value="${notes.seq }" recv_id="${notes.recv_id }">삭제</button></td>	
		</tr>	
			</c:if>
		</c:forEach>
		
		<c:if test="${empty rlist }">
		<tr><td colspan="4" align="center">
		보낸 쪽지가 없습니다</td>
		</tr>					
		</c:if>					
		
		</table>
		</div><!-- 보낸 쪽지함 탭 끝 -->
	</div>
</div>



<script type="text/javascript">
function subscribe_func(){
	
	var subscribe = "${dto.subscribe}";
	var id = "${dto.userid}";
	
	$.ajax({
		url:"/mypage/subscribe",
		type:"get",
		data : {
			subscribe : subscribe,
			id : id
		},
		success:function(num){
			if(num == 1){
				$("#bellimg").attr("src","/img/used-img/bellAf.png");
			} else if (num == 0){
				$("#bellimg").attr("src","/img/used-img/bell.png");
			}
		},
		error:function(e){
			alert(e);
		}
	})
}

</script>


</body>

</html>