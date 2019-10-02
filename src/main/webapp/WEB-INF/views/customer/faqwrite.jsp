<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   

<form id="_frmForm" action="faqupload">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<table class="detail_table">
<col width="100"><col width="200"><col width="100"><col width="300">

<tr>
	<th>카테고리</th>
	<td colspan="3">
		<select id="category" name="category">
		  <option value="" selected="selected">선택</option>
		  <option value="회원문의">회원문의</option>
	      <option value="주문/결제">주문/결제</option>
	      <option value="취소/교환/반품">취소/교환/반품</option>
	      <option value="배송문의">배송문의</option>
	      <option value="쿠폰/적립금">쿠폰/적립금</option>
	      <option value="서비스 이용 및 기타">서비스 이용 및 기타</option>
		</select>
	</td>
</tr>

<tr>
	<th>제목</th>
	<td colspan="3">
		<input type="text" name="title" style="width: 95%;" id="title" >
	</td>
</tr>

<tr>
	<th>작성자</th>
	<td colspan="3">
		<input type="text" name="id" size="50">
		<!--readonly value="${login.id }"  -->
	</td>
</tr>

<tr>
	<th>내용</th>
	<td colspan="3">
		<textarea style="height: 268px;width: 1025px;" name="content" id="content"></textarea>
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

	$("#_frmForm").attr("action", "faqupload").submit(); //
});

$("#_btnBack").click(function () {

	location.href = "faqlist";
});

$("#_btnWrite").mousedown(function() {
	if($("#category").val()==""){
		alert("카테고리를 선택해주세요");
		return;
	}else if($("#content").val()==""){
		alert("내용을 입력해주세요");
		return;
	}else if($("#title").val()==""){
		alert("제목을 입력해주세요");
		return;
	}
});
</script>       
    