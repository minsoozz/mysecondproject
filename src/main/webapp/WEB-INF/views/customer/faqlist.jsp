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
<form action="faqlist" name="frmForm1" id="_frmFormSearch" method="POST">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>        
<table style="width:85%" >
<colgroup>
	<col width="50"><col width="100"><col width="600">
</colgroup>
<tr>
<th>
	<select id="_s_category" name="s_category" onchange="categorychange()">
	  <option value="" selected="selected">선택</option>
	  <option value="01" <c:out value="${s_category == '01'? 'selected':'' }"/>>회원문의</option>
      <option value="02"<c:out value="${s_category == '02'? 'selected':'' }"/>>주문/결제</option>
      <option value="03"<c:out value="${s_category == '03'? 'selected':'' }"/>>취소/교환/반품</option>
      <option value="04"<c:out value="${s_category == '04'? 'selected':'' }"/>>배송문의</option>
      <option value="05"<c:out value="${s_category == '05'? 'selected':'' }"/>>쿠폰/적립금</option>
      <option value="06"<c:out value="${s_category == '06'? 'selected':'' }"/>>서비스 이용 및 기타</option>
	</select>
</th>
</tr>
</table>    
    
<table class="list_table" style="width:85%" >
<colgroup>
	<col width="50"><col width="100"><col width="600"><col width="150">
</colgroup>
<thead>
<tr>
	<th>번호</th><th>카테고리</th><th colspan="2">제목</th>
</tr>
</thead>

<tbody>
<c:if test="${empty faqlist }">
	<tr>
		<td colspan="4">검색결과가 없습니다. 다시 검색하여 주세요.</td>
	</tr>
</c:if>
<c:forEach var="faq" items="${faqlist }" varStatus="vs">
<tr class="_hover_tr">
	<td>${vs.count }</td>
	<td>${faq.category }</td>
	<td colspan="2" style="text-align: left;" onclick="faqdetail(${faq.seq})">
			${faq.title }
	</td>
</tr>
<tr class="detail" id='detail${faq.seq}'>
	<td><img alt="" src="../img/customer-img/answer.PNG" height="12px" width="24px;" align="top"> </td>
	<td colspan="2" align="left">
	<div style="white-space:pre-line;">
	${faq.content }
	</div>
	</td>
	<td>
	<div>
	<span class="button blue">
		<button type="button" class="btn" onclick="FaqUpdate('${faq.seq }')">수정</button>
	</span>
	<span class="button blue">
		<button type="button" class="btn" onclick="FaqDelete('${faq.seq }')">삭제</button>
	</span>
	</div>
	</td>
</tr>
</c:forEach>

<tr>
<th colspan="4" align="center">
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

<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
<tr>
	<td>검색:</td>
	<td style="padding-left: 0px">
		<input type="text" id="_s_keyword" name="s_keyword" value="">
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

</form>

<script type="text/javascript">
/* 클릭시 내용보이기 */
$(".detail").hide();

function faqdetail(seq){
	
	if($("#detail"+seq).css("display")=="none"){
		$(".detail").hide();
		$("#detail"+seq).show();
	
	}else{
		$("#detail"+seq).hide();
	}
}


/* 버튼 */
function FaqDelete( seq ) {
	location.href = "faqdelete?seq=" + seq;
}
function FaqUpdate( seq ) {
	location.href = "faqupdate?seq=" + seq;
}



function categorychange(  ){
	
	document.frmForm1.submit();
	
}



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