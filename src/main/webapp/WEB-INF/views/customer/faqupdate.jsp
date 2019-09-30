<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
    
<form id="_frmForm" action="faqupdateAf">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="seq" value="${faqdto.seq }">
    
<table class="detail_table">
<col width="100"><col width="200"><col width="100"><col width="300">



<tr>
	<th>카테고리</th>
	<td colspan="3"> 
		<select id="category" name="category"> 
		  <option value="">선택</option>
		  <option value="회원문의" <c:if test="${faqdto.category eq '회원문의'}">selected</c:if>>회원문의</option>
	      <option value="주문/결제" <c:if test="${faqdto.category eq '주문/결제'}">selected</c:if>>주문/결제</option>
	      <option value="취소/교환/반품" <c:if test="${faqdto.category eq '취소/교환/반품'}">selected</c:if>>취소/교환/반품</option>
	      <option value="배송문의" <c:if test="${faqdto.category eq '배송문의'}">selected</c:if>>배송문의</option>
	      <option value="쿠폰/적립금" <c:if test="${faqdto.category eq '쿠폰/적립금'}">selected</c:if>>쿠폰/적립금</option>
	      <option value="서비스 이용 및 기타" <c:if test="${faqdto.category eq '서비스 이용 및 기타'}">selected</c:if>>서비스 이용 및 기타</option>
	</select>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td colspan="3">
		<input type="text" name="title" size="100%" value="${faqdto.title }">
	</td>
</tr>

<tr>
	<th>작성자</th>
	<td colspan="3">
		<input type="text" name="id" size="100%" value="${faqdto.id }">
		<!--readonly value="${login.id }"  -->
	</td>
</tr>

<tr>
	<th>내용</th>
	<td colspan="3">
		<textarea rows="" cols="100%" name="content">${faqdto.content }</textarea>
	</td>
</tr>
</table>

<div id="button.wrap">
	<span class="button blue">
		<button type="button" id="_btnUpdate">수정</button>
	</span>
		<span class="button blue">
		<button type="button" id="_btnBack">목록</button>
	</span>
</div>
</form>


<script type="text/javascript">

$("#_btnUpdate").click(function () {

	$("#_frmForm").attr("action", "faqupdateAf").submit(); //
});

$("#_btnBack").click(function () {

	location.href = "faqlist";
});



</script>  