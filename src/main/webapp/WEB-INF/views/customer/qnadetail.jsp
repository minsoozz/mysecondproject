<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<table class="detail_table">
<col width="100"><col width="200"><col width="100"><col width="300">

<tr>
	<th rowspan="2">제목</th>
	<td colspan="3">${qna.category }</td>
</tr>
<tr>
	<td colspan="3">${qna.title }</td>
</tr>

<tr>
	<th>주문번호</th>
	<td>${qna.orderno }</td>
</tr>


<tr>
	<th>작성자</th>
	<td colspan="3">${qna.id }</td>
</tr>

<tr>
	<th>작성일</th>
	<td>${qna.wdate }</td>
	<th>답변상태</th>
	<td>답변상태</td>
</tr>
<tr>
	<td colspan="4">
	<div style="white-space:pre-line;">
	<img alt="" src="/upload/customer/${qna.filename }" style="height: 30%">
	${qna.content }
	</div>
	</td>
</tr>
</table>
<div>
		<form action="qnaanswer" method="get">
				<input type="hidden" name="seq" value="${qna.seq }">
				<input type="submit" class="customer-btn2" value="댓글">
			</form>
</div>

<!-- 수정삭제버튼 -->

<div>
<!-- 코어태그 추가하기 -->
		<button type="button"  class="customer-btn2" onclick="QnaDelete('${qna.seq }','${qna.step }','${qna.ref }')">삭제</button>
		<button type="button"  class="customer-btn2" onclick="QnaUpdate('${qna.seq }')">수정</button>

</div>


<script type="text/javascript">

function QnaDelete( seq ,step,ref ) {
	location.href = "qnadelete?seq="+seq+"&step="+step+"&ref="+ref;
}
function QnaUpdate( seq ) {
	location.href = "qnaupdate?seq="+seq;
}

</script>    