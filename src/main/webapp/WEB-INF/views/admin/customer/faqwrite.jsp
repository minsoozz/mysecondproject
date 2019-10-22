<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/customer/customerlist.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content_main</title>

</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">고객센터</h1>
	<p class="mb-4">자주하는질문</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">자주하는질문  글작성</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<form id="_frmForm" action="faqupload">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table style="width:100%;"class="table table-bordered">
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
							<input type="text" name="id" size="50" value="${id }" readonly>
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea style="height: 268px;width: 1025px;" name="content" id="contents"></textarea>
					</td>
				</tr>
				
				</table>
				
				<div id="button.wrap">
						<button type="button" class="clickBtn" id="_btnWrite">저장</button>
						<button type="button" class="clickBtn" id="_btnBack">목록</button>
				</div>
				
				</form>
			</div>
		</div>
	</div>

</div>


</html>

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
	}else if($("#contents").val()==""){
		alert("내용을 입력해주세요");
		return;
	}else if($("#title").val()==""){
		alert("제목을 입력해주세요");
		return;
	}
});
</script>       
    