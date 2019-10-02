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
	<img alt="" src="../upload/${qna.filename }" style="height: 30%">
	${qna.content }
	</td>
</tr>
</table>
<div>
		<form action="qnaanswer" method="get">
				<input type="hidden" name="seq" value="${qna.seq }">
				<input type="submit" class="btn" value="댓글">
			</form>
</div>

<!-- 수정삭제버튼 -->

<div>
<!-- 코어태그 추가하기 -->
	<span class="button blue">
		<button type="button" class="btn" onclick="QnaDelete('${qna.seq }')">삭제</button>
	</span>
	<span class="button blue">
		<button type="button" class="btn" onclick="QnaUpdate('${qna.seq }')">수정</button>
	</span>
</div>


<script type="text/javascript">

function QnaDelete( seq ) {
	location.href = "qnadelete?seq="+seq;
}
function QnaUpdate( seq ) {
	location.href = "qnaupdate?seq="+seq;
}

</script>    