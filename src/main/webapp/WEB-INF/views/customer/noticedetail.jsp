<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


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
	<div style="white-space:pre-line;">
	<img alt="" src="../upload/${noticedto.filename }" style="height: 30%">
	${noticedto.content }
	</td>
	</div>
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
<br><br><br>
<table class="before_table">
<col width="50"><col width="650">
<tr style="border-top: 3px solid #E0FF8B;">
	<td style="border-right: 1px solid #EFEFEF;">이전글<img alt="" src="../img/customer-img/up.png" height="18px;" width="18px;" align="right" style="padding-right: 5px"> </td>
	<td><a href="noticedetail?seq=${beforedto.seq}">${beforedto.title }</a></td>
</tr>
<tr style="border-bottom: 3px solid #E0FF8B;">
	<td style="border-right: 1px solid #EFEFEF;">다음글<img alt="" src="../img/customer-img/down.png" height="18px;" width="18px;" align="right" style="padding-right: 5px"></td>
	<td><a href="noticedetail?seq=${afterdto.seq}">${afterdto.title }</a></td>
<tr> 

</tr>
</table>


<script type="text/javascript">

function NoticeDelete( seq ) {
	location.href = "noticedelete?seq=" + seq;
}
function NoticeUpdate( seq ) {
	location.href = "noticeupdate?seq=" + seq;
}

</script>    