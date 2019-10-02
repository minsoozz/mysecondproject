<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="_frmForm" action="noticeupload" method="post" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<table class="detail_table">
<col width="100"><col width="200"><col width="100"><col width="300">

<tr>
	<th>제목</th>
	<td colspan="3">
		<input type="text" name="title" id="title" style="width: 95%;">
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

</body>
</html>

<script type="text/javascript">

$("#_btnWrite").click(function () {

	$("#_frmForm").attr("action", "noticeupload").submit(); //
});

$("#_btnBack").click(function () {

	location.href = "noticelist";
});


$(function () {
	//""없게
	$("#_btnWrite").mousedown(function() {
		if($("#title").val()==""){
			alert("제목을 입력해주세요");
			return;
		}else if($("#content").val()==""){
			alert("내용을 입력해주세요");
			return;
		}
	});
});	


</script> 