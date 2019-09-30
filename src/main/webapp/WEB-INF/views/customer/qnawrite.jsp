<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   
   
<form id="_frmForm" action="qnaupload" method="post" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>    
<table class="detail_table">
<col width="100"><col width="200"><col width="100"><col width="300">

<tr>
	<th rowspan="2">제목</th>
	<td colspan="3">
		<select id="category" name="category">
		  <option value="" selected="selected">선택</option>
		  <option value="배송문의">배송문의</option>
	      <option value="취소/교환/반품">취소/교환/반품</option>
	      <option value="주문결제문의">주문결제문의</option>
	      <option value="회원정보문의">회원정보문의</option>
	      <option value="쿠폰/적립금">쿠폰/적립금</option>
	      <option value="서비스 이용 및 기타">서비스 이용 및 기타</option>
		</select>
	</td>
</tr>
<tr>
	<td colspan="3"><input type="text" name="title"></td>
</tr>

<tr>
	<th>주문번호</th>
	<td>주문번호선택</td>
</tr>


<tr>
	<th>작성자</th>
	<td colspan="3">
	<input type="text" name="id" size="50">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td colspan="3">
		<textarea rows="" cols="" name="content"></textarea>
	</td>
</tr>

<tr>
	<th>이미지</th>
	<td colspan="3">
		<input type="file" name="fileload" style="width: 400px">
	</td>
</tr>
</table>    

<div id="button.wrap">
	<span class="button blue">
		<button type="button" id="_btnWrite">저장</button>
	</span>
		<span class="button blue">
		<button type="button" id="_btnBack">목록</button>
	</span>
</div>

</form>

<script type="text/javascript">

$("#_btnWrite").click(function () {

	$("#_frmForm").attr("action", "qnaupload").submit(); //
});

$("#_btnBack").click(function () {

	location.href = "qnalist";
});

</script>
    