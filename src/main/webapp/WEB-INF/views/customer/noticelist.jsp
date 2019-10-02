<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>



<div id="button.wrap">
	<span class="button blue">
		<button type="button" id="_btnWrite">공지사항쓰기</button>
	</span>
</div>

<table class="list_table" style="width:85%" >
<colgroup>
	<col width="50"><col width="300"><col width="100"><col width="100"><col width="50">
</colgroup>

<thead>
<tr>
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
</tr>
</thead>

<tbody>
<c:if test="${empty noticelist}">
	<tr>
		<td colspan="4">검색결과가 없습니다. 다시 검색하여 주세요.</td>
	</tr>
</c:if>
<c:forEach var="notice" items="${noticelist }" varStatus="vs">
<tr class="_hover_tr">
	<td>${vs.count }</td>
	<td style="text-align: left;">
		<a href="noticedetail?seq=${notice.seq}">
			${notice.title }
		</a>
	</td>
	<td>${notice.id }</td>
	<td>
		<font size="1">string.${notice.wdate }(0.10)</font>
	</td>
	<td>${notice.readcount }</td>
	
</tr>
</c:forEach>

<tr>
<th colspan="5" align="center">
<!-- 페이징 -->
<div id="paging_wrap"> 
	<jsp:include page="/WEB-INF/views/customer/paging.jsp" flush="false">
		<jsp:param name="pageNumber" value="${pageNumber }"/>
		<jsp:param name="totalRecordCount" value="${totalRecordCount }"/>
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }"/>
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }"/>
	</jsp:include>
</div>
<!-- 페이징끝 --> 
</th>
</tr>

<tr>
<th colspan="5">
<!-- 검색 -->
<div class="box_border" style="margin-top: 5px; margin-bottom: 10px">
<form action="" name="frmForm1" id="_frmFormSearch" method="POST">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
<tr>
	<td>검색:</td>
	<td style="padding-left: 0px">
		<select id="_s_category" name="s_category">
			<option value="" selected="selected">선택</option>
		  <option value="title" <c:out value="${s_category == 'title'? 'selected':'' }"/>>제목</option>
	      <option value="content"<c:out value="${s_category == 'content'? 'selected':'' }"/>>내용</option>
	      <option value="writer"<c:out value="${s_category == 'writer'? 'selected':'' }"/>>작성자</option>
		</select>
	</td>
	<td style="padding-left: 0px">
		<input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword }">
	</td>
	<td style="padding-left: 0px">
		<span class="buttonsearch">
			<img id="_btnSearch" alt="" src="../img/customer-img/searchb.png" style="height: 30px; height: 30px; border: 1px solid #D8D8D8;">
		</span>
	</td>
</tr>
</table>
<!-- hidden 을 통해서 값을 넘겨주기 -->
<input type="hidden" name="pageNumber" id="_pageNumber" value="0"> 
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
</form>
</div>
<!-- 검색끝 -->
</th>
</tr>
</tbody>
</table>
 


<script type="text/javascript">

$("#_btnWrite").click(function () { 
	location.href = "noticewrite";
});

</script>    

<script type="text/javascript">

function goPage( pageNumber ) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frmFormSearch").attr("action", "noticelist").submit(); //
	
}

$("#_btnSearch").click(function () {
	//alert("클릭");
	$("#_frmFormSearch").attr("action", "noticelist").submit(); //
});

</script>