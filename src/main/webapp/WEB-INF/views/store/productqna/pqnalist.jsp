<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<div id="button.wrap">

			<span class="button blue">
				<button type="button" id="_btnWrite">상품문의</button>
			</span>
		</div>
		<form action="/Rhymes/store/productDetail" name="frmForm1" id="_frmFormSearch" method="get">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>        
		
		<!--비밀글 -->
		<jsp:useBean id="spqna" class="com.rhymes.app.customer.util.PqnaSecret" scope="page"/>     
		<!-- 답변 -->
		<jsp:useBean id="uqna" class="com.rhymes.app.customer.util.PqnaArrow" scope="page"/>    
		 
		    
		<table class="list_table" style="width:85%" >
		<colgroup>
			<col width="50"><col width="600"><col width="100"><col width="150">
		</colgroup>
		<thead>
		<tr>
			<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
		</tr>
		</thead>
		
		<tbody>
		<c:if test="${empty pqnalist }">
			<tr>
				<td colspan="4">문의가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="pqna" items="${pqnalist }" varStatus="vs">
		<tr class="_hover_tr">
			<td>${vs.count }</td>
			<td style="text-align: left;" onclick="pqnadetail(${pqna.seq})">
			
			<!-- 비밀글 이미지-->
			<jsp:setProperty property="secret" name="spqna" value="${pqna.secret }"/>
			<jsp:getProperty property="arrow" name="spqna"/> <!-- getSecret 호출 -->		
			<!-- 답변 이비지-->
			<jsp:setProperty property="depth" name="uqna" value="${pqna.depth }"/>
			<jsp:getProperty property="arrow" name="uqna"/> <!-- getArrow 호출 -->		
					${pqna.title }
			</td>
			<td>${pqna.id }</td>
			<td>${pqna.wdate }</td>
		</tr>
		<tr class="detail" id='detail${pqna.seq}'>
			<td></td>
			<td colspan="2" align="left">
			<div style="white-space:pre-line;">
			${pqna.content }
			</div>
			</td>
			<td>
		
			<div>
			<span class="button blue">
				<button type="button" class="btn" onclick="PqnaAnswer('${pqna.seq }')">답변</button>
			</span>
			<span class="button blue">
				<button type="button" class="btn" onclick="PqnaUpdate('${pqna.seq }')">수정</button>
			</span>
			<span class="button blue">
				<button type="button" class="btn" onclick="PqnaDelete('${faq.seq }')">삭제</button>
			</span>
			</div>
			</td>
		</tr>
		</c:forEach>
		
		<tr>
		<th colspan="4" align="center">
		<!-- 페이징 -->
		<div id="paging_wrap"> 
			<jsp:include page="/WEB-INF/views/store/product_paging.jsp" flush="false">
				<jsp:param name="pageNumber" value="${pageNumber }"/>
				<jsp:param name="totalRecordCount" value="${totalRecordCount }"/>
				<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }"/>
				<jsp:param name="recordCountPerPage" value="${recordCountPerPage }"/>
			</jsp:include>
			
		<!-- hidden 을 통해서 값을 넘겨주기 -->
		<input type="hidden" name="pageNumber" id="_pageNumber" value="0"> 
		
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">	
		</div>
		<!-- 페이징끝 --> 
		</th>
		</tr>
		
		</tbody>
		</table>
		
		</form>

</div>    


<!-- 상품문의 -->
<script type="text/javascript">
/* 클릭시 내용보이기 */
$(".detail").hide();

function pqnadetail(seq){
	
	if($("#detail"+seq).css("display")=="none"){
		$(".detail").hide();
		$("#detail"+seq).show();
	
	}else{
		$("#detail"+seq).hide();
	}
}
/* 버튼 */
function PqnaAnswer( seq ) {
	location.href = "pqnaanswer?seq=" + seq;
}
function PqnaDelete( seq ) {
	location.href = "pqnadelete?seq=" + seq;
}
function PqnaUpdate( seq ) {
	location.href = "pqnaupdate?seq=" + seq;
}

$("#_btnWrite").click(function () { 
	location.href = "pqnawrite";
});

function goPage( pageNumber) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 

	$("#_frmFormSearch").attr("action", "/productqna/pqnalist").submit(); //
	
}

</script>  