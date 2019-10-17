 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/companyadmin/productmanage/productupdate.css">
<style>
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- 상품기본정보 modal -->
	<div class="basicinfo_modal">
		<div class="basicinfo_modal-content">
			<div align='center'>
			<table border='0' id="basicinfo_udt-table">
				<colgroup><col width="40%"><col width="60%"></colgroup>
				<tr>
					<th>상품명</th>
					<td><input type="text" value="${pDto.p_name }""></td>
				</tr>	
				<tr>
					<th>상품 코드</th>
					<td><input type="text" value="${pDto.cp_code }"></td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td>
						<input type="text" class="upt_price" style="width:70%;"  
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
							onchange="numberWithCommas(this.value)"
							value="<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" />"
							<%-- value="<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" /> --%>">&nbsp;원
					</td>
				</tr>
				<tr>
					<th>상품 색상</th>
					<td>
						<select id="colorSelect" style="margin-top: 10px;">
							<option value="">-SELECTION-</option>
							<option value="BLACK">BLACK</option>
							<option value="LIME">LIME</option>
							<option value="WHITE">WHITE</option>
							<option value="WHITE">OFFWHITE</option>
							<option value="RED">RED</option>
							<option value="ORANGE">ORANGE</option>
							<option value="YELLOW">YELLOW</option>
							<option value="BLUE">BLUE</option>
							<option value="BLUE">SKYBLUE</option>
							<option value="GREEN">GREEN</option>
							<option value="NAVY">NAVY</option>
							<option value="GREY">GREY</option>
							<option value="PURPLE">PURPLE</option>
							<option value="PURPLE">PINK</option>
							<option value="PURPLE">MIX</option>
						</select>
					</td>
				</tr>
			</table>
			</div>
		</div>
	</div>
	
	<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
			상품관리 >
			<a href="/admin/company/productoperlist">상품 수정/삭제</a> >
			상품 수정
			</h6>
		</div>
	
	<!-- 상품기본정보 수정 -->
	<div id="updateDiv">
		<div style="margin-bottom: 30px;"><strong>상품기본정보수정</strong></div>
		
		<div style="float:left">
			<img src="/upload/store/${pDto.photo1_file }"  style="width:200px; height:200px; border-radius: 100%; margin-left: 50px;">
		</div>
		<div style="margin-left: 330px; margin-top: 40px">
			<%-- <b>상품명</b>&nbsp;${pDto.p_name }<br>
			<b>가격</b>&nbsp;<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" /> 원 --%>
			<table id="basicinfo-table">
			<colgroup>
				<col width="160px"><col width="200px">
			</colgroup>
				<tr>
					<th>상품 번호</th>
					<td>${pDto.p_seq }</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>${pDto.p_name }</td>
				</tr>
				<tr>
					<th>상품 코드</th>
					<td>${pDto.cp_code }</td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" />원</td>
				</tr>
				<tr>
					<th>상품 색상</th>
					<td>${pDto.p_color }</td>
				</tr>
				<tr>
					<th>상품 카테고리</th>
					<td>${pDto.c1_name }&nbsp;&#47;&nbsp;${pDto.c2_name }&nbsp;&#47;&nbsp;${pDto.c3_name }</td>
				</tr>
				<tr>
					<th>상품 등록일</th>
					<td>${pDto.rdate }</td>
				</tr>
			
			</table>
			
			
		</div>
		<br><br>
		<div align="center">
			<button type="button" class="basicinfo_update-btn"><b>수정</b></button>
		</div>		
	</div>
	<!-- 상품이미지 수정 -->
	<div id="updateDiv">
		<strong>상품이미지 수정</strong>
		<div>
		
		</div>
		<button type="button"><b>수정</b></button>
	</div>
	
	<!-- 상품 상세내용 수정 -->
	<div id="updateDiv">
		<strong>상품상세내용 수정</strong>
		<div>
		
		</div>
		<button type="button"><b>수정</b></button>
	</div>

</div>
<!-- /.container-fluid -->

<!-- End of Main Content -->

<!--------------------------------- SCRIPT ZONE --------------------------------->
<script>
$(document).on('click', '.basicinfo_update-btn', function(){
	$(".basicinfo_modal").fadeIn();
});

function numberWithCommas(x) {
	
    $(".upt_price").val(x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    
}

</script>



</html>