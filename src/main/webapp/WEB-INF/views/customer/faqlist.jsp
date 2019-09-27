<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<div id="button.wrap">
	<span class="button blue">
		<button type="button" id="_btnWrite">자주하는질문쓰기</button>
	</span>
</div>
        
<table style="width:85%" >
<colgroup>
	<col width="50"><col width="100"><col width="600">
</colgroup>
<tr>
<th>
	<select id="_s_category" name="s_category">
	  <option value="" selected="selected">선택</option>
	  <option value="memberq" <c:out value="${s_category == 'memverq'? 'selected':'' }"/>>회원문의</option>
      <option value="orderq"<c:out value="${s_category == 'orderq'? 'selected':'' }"/>>주문/결제</option>
      <option value="cancleq"<c:out value="${s_category == 'cancleq'? 'selected':'' }"/>>취소/교환/반품</option>
      <option value="deliveryq"<c:out value="${s_category == 'deliveryq'? 'selected':'' }"/>>배송문의</option>
      <option value="cuponq"<c:out value="${s_category == 'cuponq'? 'selected':'' }"/>>쿠폰/적립금</option>
      <option value="serviceq"<c:out value="${s_category == 'serviceq'? 'selected':'' }"/>>서비스 이용 및 기타</option>
	</select>
</th>
</tr>
</table>    
    
<table class="list_table" style="width:85%" >
<colgroup>
	<col width="50"><col width="100"><col width="600">
</colgroup>
<thead>
<tr>
	<th>번호</th><th>카테고리</th><th>제목</th>
</tr>
</thead>

<tbody>
<c:forEach var="faq" items="${faqlist }" varStatus="vs">
<tr class="_hover_tr">
	<td>${vs.count }</td>
	<td>${faq.category }</td>
	<td style="text-align: left;">
		<a href="noticedetail?seq=${faq.seq}">
			${faq.title }
		</a>
	</td>
	
</tr>
</c:forEach>

<tr>
<th colspan="3">
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
	location.href = "faqwrite";
});

function goPage( pageNumber ) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frmFormSearch").attr("action", "faqlist").submit(); //
	
}

$("#_btnSearch").click(function () {
	//alert("클릭");
	$("#_frmFormSearch").attr("action", "faqlist").submit(); //
});

</script>