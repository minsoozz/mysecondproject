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
		
	<form id="_rform">
		<select id="r_select">
			<option value="r_content" <c:out value="${select == 'content'? 'selected':'' }"/>>내용</option>
			<option value="r_id" <c:out value="${select == 'id'? 'selected':'' }"/>>보낸사람</option>
		</select>
		<input type="text" name="keyword" id="r_keyword" value="${keyword }">					
		<input type="button" value="검색" id="_rformbtn" name="formbtn">	
		
		<input type="hidden" name="r_pageNumber" id="_rpageNumber" value="${(empty pageNumber)?0:r_pageNumber }">
		<input type="hidden" name="r_recordCountPerPage" id="_recordCountPerPage" value="${(empty r_recordCountPerPage ? 0 : r_recordCountPerPage)}">	
		<input type="hidden" name="r_category" value="${category }">
		<input type="hidden" id="_loginid" name="loginid" value="${userloginid }">
	</form>
		<br>
		
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
		</table>
		
				<!-- 페이징 -->
 		<div id="paging_wrap">
			<jsp:include page="/WEB-INF/views/used/recvpaging.jsp" flush="false"> 	
				<jsp:param name="pageNumber" value="${r_pageNumber }" />
				<jsp:param name="totalRecordCount" value="${r_totalRecordCount }" />
				<jsp:param name="pageCountPerScreen" value="${r_pageCountPerScreen }" /> 
				<jsp:param name="recordCountPerPage" value="${r_recordCountPerPage }" />
			</jsp:include> 
		
		</div>
				
		
		<c:if test="${empty rlist }">
		<table>
		<tr><td colspan="4" align="center">
		받은 쪽지가 없습니다</td>
		</tr>					
		</table>
		</c:if>
		

		</div>
		<!-- 받은 쪽지함 탭 끝 -->
		
		
		
		
		
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
		
		<c:if test="${empty slist }">
		<tr><td colspan="4" align="center">
		보낸 쪽지가 없습니다</td>
		</tr>					
		</c:if>					
		
		</table>
		</div><!-- 보낸 쪽지함 탭 끝 -->
	</div>
</div>



<script type="text/javascript">

function goPage( pageNumber ) { /* pageNumber는 현재 페이지를 뜻한다 */
	$("#_rpageNumber").val(pageNumber);
	
	$("#_rform").attr("action","notes").submit();
}

$("#_rformbtn").click(function() {
	

    var keyword = $("#r_keyword").val();
	var select = $("#r_select").val();
	
	location.href="/mypage/notes?r_keyword="+keyword+"&r_select="+select; 
	
});

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