<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<table class="detail_table">
<col width="100"><col width="200"><col width="100"><col width="300">

<tr>
	<th>제목</th>
	<td colspan="3">${noticedto.title }</td>
</tr>

<tr>
	<th>작성자</th>
	<td colspan="3">${noticedto.id }</td>
</tr>

<tr>
	<th>작성일</th>
	<td>${noticedto.wdate }</td>
	<th>조회수</th>
	<td>${noticedto.readcount }</td>
</tr>
<tr>
	<td colspan="4">
	<img alt="" src="../upload/${noticedto.filename }" style="height: 30%">
	${noticedto.content }
	</td>
</tr>

</table>


<!-- 수정삭제버튼 -->

<div>
<!-- 코어태그 추가하기 -->
	<span class="button blue">
		<button type="button" class="btn" onclick="NoticeDelete('${noticedto.seq }')">삭제</button>
	</span>
	<span class="button blue">
		<button type="button" class="btn" onclick="NoticeUpdate('${noticedto.seq }')">수정</button>
	</span>

</div>
</body>
</html>



<script type="text/javascript">

function NoticeDelete( seq ) {
	location.href = "noticedelete?seq=" + seq;
}
function NoticeUpdate( seq ) {
	location.href = "noticeupdate?seq=" + seq;
}

</script>    