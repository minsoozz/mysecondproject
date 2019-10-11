<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Member List</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/admin/member/memberlist.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/admin/member/paging.css">
</head>

<!-- Begin Page Content -->
<div class="container-fluid">

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">회원관리</h1>
<p class="mb-4">회원조회, 수정, 정지</p>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="dataTable_length">
					<form action="memlist" id="_frm" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						 <select style="width: 100px;" name="recordCountPerPage" aria-controls="dataTable"
						 	onchange="dataTable_length()"
							class="custom-select custom-select-sm form-control form-control-sm">
							<option value="10" 
								<c:out value="${recordCountPerPage == '10'? 'selected':'' }"/>>10</option>
							<option value="25"
								<c:out value="${recordCountPerPage == '25'? 'selected':'' }"/>>25</option>
							<option value="50"
								<c:out value="${recordCountPerPage == '50'? 'selected':'' }"/>>50</option>
							<option value="100"
								<c:out value="${recordCountPerPage == '100'? 'selected':'' }"/>>100</option>
						</select>
					</div>
				</div>
				<!-- 검색 -->
				<div class="col-sm-12 col-md-6">
					<div id="dataTable_filter"
						class="searchPosition dataTables_filter">
						
						
												
						<select id="_s_category" name="s_category" onchange="categorychange()" class="searchSelect">
							<option value="" selected="selected">선택</option>
							<option value="01"
								<c:out value="${s_category == '01'? 'selected':'' }"/>>아이디</option>
							<option value="02"
								<c:out value="${s_category == '02'? 'selected':'' }"/>>이메일</option>
							<option value="03"
								<c:out value="${s_category == '03'? 'selected':'' }"/>>종류</option>
							<option value="04"
								<c:out value="${s_category == '04'? 'selected':'' }"/>>전화번호</option>
						</select>
						<input type="search" id="_s_keyword" name="s_keyword" class="searchText form-control-sm" placeholder="" aria-controls="dataTable" style="width: 150px">
						<button class="btn btn-primary" type="button">
							<i class="fas fa-search fa-sm" id="_btnSearch"></i>
						</button>
						<!-- hidden 을 통해서 값을 넘겨주기 -->
						<input type="hidden" name="pageNumber" id="_pageNumber" value="0">
						<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
					</div>
				</div>
				<!-- /검색 -->
				
			</div>
		
			
			
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			
				<thead>
					<tr align="center">
						<th class="list_checkbox"><input type="checkbox"
							name='allckeck' onclick='allchecks(this.checked)' id='_allck'>
						</th>
						<th class="sorting">ID<input type="hidden" name="sorting" id="_sorting"></th>	<!-- 1 -->
						<th class="sorting">Name</th>											<!-- 2 -->
						<th class="sorting">Address</th>										<!-- 3 -->
						<th class="sorting">Email</th>											<!-- 4 -->
						<th class="sorting">Phone</th>											<!-- 5 -->
						<th class="sorting">Social</th>											<!-- 6 -->
						<th class="sorting">date</th>											<!-- 7 -->
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty memlist }">
						<tr align="center">
							<td colspan="8" align="center">검색결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="mem" items="${memlist }" varStatus="vs">
						<tr align="center">
							<td class="list_checkbox"><input type="checkbox"
								name='allck' value="${mem.seq }"></td>
							<td class="list_id"><a href="mem_update?id=${mem.userid }">${mem.userid }</a></td>
							<td class="list_name">${mem.username }</td>
							<td class="list_address">${mem.address }</td>
							<td class="list_email">${mem.useremail }</td>
							<td class="list_phone">${mem.phone }</td>
							<td class="list_social">${mem.social}</td>
							<td class="list_rdate">${mem.rdate }</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</from>
			<div class="col-sm-12 col-md-7">
				<div class="dataTables_paginate paging_simple_numbers"
					id="dataTable_paginate">
					<!-- 페이징 -->
					<div id="paging_wrap">
						<jsp:include page="/WEB-INF/views/admin/member/paging.jsp"
							flush="false">
							<jsp:param name="pageNumber" value="${pageNumber }" />
							<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
							<jsp:param name="pageCountPerScreen"
								value="${pageCountPerScreen }" />
							<jsp:param name="recordCountPerPage"
								value="${recordCountPerPage }" />
						</jsp:include>
					</div>
					<!-- 페이징끝 -->
					
				</div>
			</div>
		</div>
	</div>
</div>

</div>
<!-- /.container-fluid -->
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->




<script type="text/javascript">
function goPage( pageNumber ) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frm").attr("action", "memlist").submit(); //
	
}

$("#_btnSearch").click(function () {
	//alert("클릭");
	$("#_frm").attr("action", "memlist").submit(); //
	
});

</script>

<script type="text/javascript">

function allchecks(e) {
	// 모두 체크
	var arr = document.getElementsByName("allck");
	
	for(i=0; i<arr.length; i++){
		arr[i].checked = e;
	}
}

$("#delBtn").click(function(){
	
});

/* function selectMem(){
	$("#_frm").attr("action", "memlist").submit();
} */

// 리스트 갯수 뿌리기
function dataTable_length(){
	$("#_frm").attr("action", "memlist").submit();
}

// sorting
$(function(){
	$(".sorting").click(function() {
		var thNum = $(this).index();

		if(thNum == 1){
			$("#_sorting").val("ID");
			$("#_frm").attr("action", "memlist").submit();		
		}
		if(thNum == 2){
			$("#_sorting").val("NAME");
			$("#_frm").attr("action", "memlist").submit();		
		}
		if(thNum == 3){
			$("#_sorting").val("ADDRESS");
			$("#_frm").attr("action", "memlist").submit();		
		}
		if(thNum == 4){
			$("#_sorting").val("EMAIL");
			$("#_frm").attr("action", "memlist").submit();		
		}
		if(thNum == 5){
			$("#_sorting").val("PHONE");
			$("#_frm").attr("action", "memlist").submit();		
		}
		if(thNum == 6){
			$("#_sorting").val("SOCIAL");
			$("#_frm").attr("action", "memlist").submit();		
		}
		if(thNum == 7){
			$("#_sorting").val("RDATE");
			$("#_frm").attr("action", "memlist").submit();		
		}
		
	});
});

</script>


</html>