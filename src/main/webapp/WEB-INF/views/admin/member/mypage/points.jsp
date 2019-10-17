<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<script type="text/javascript" src="<%=ctx %>/js/admin/events/points.js"></script>

<!-- Begin Page Content -->
<div class="container-fluid">
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">적립금 관리</h1>
<p class="mb-4">적립금 지급-차감 및 이력 조회</p>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">적립금 목록</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="dataTable_length">
					<form action="<%=ctx %>/admin/mypage/points" id="_frm" method="post">	
						<input type="hidden" name="pageNum" id="_currPageNum" value="${pDto.pageNum }">				
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						 <select style="width: 100px;" name="recordCountPerPage" aria-controls="dataTable" onchange="conditionChanged();"
							class="custom-select custom-select-sm form-control form-control-sm">
							<option value="10" 
								<c:out value="${pDto.recordCountPerPage == '10'? 'selected':'' }"/>>10</option>
							<option value="25"
								<c:out value="${pDto.recordCountPerPage == '25'? 'selected':'' }"/>>25</option>
							<option value="50"
								<c:out value="${pDto.recordCountPerPage == '50'? 'selected':'' }"/>>50</option>
							<option value="100"
								<c:out value="${pDto.recordCountPerPage == '100'? 'selected':'' }"/>>100</option>
						</select>
					</div>
				</div>
				<!-- 검색 -->
				<div class="col-sm-12 col-md-6">
					<div id="dataTable_filter"
						class="searchPosition dataTables_filter">
						<select id="_s_category" name="cond" onchange="conditionChanged();" class="custome-select border-0 pr-3 searchSelect">
							<option value="" selected="selected">선택</option>
							<option value="1"
								<c:out value="${pDto.cond == '1'? 'selected':'' }"/>>아이디</option>
							<option value="2"
								<c:out value="${pDto.cond == '2'? 'selected':'' }"/>>쿠폰번호</option>
						</select>
						<input type="search" id="_s_keyword" name="keyword" class="searchText form-control-sm" placeholder="" aria-controls="dataTable" style="width: 150px"
							value="${pDto.keyword }">
						<button class="btn btn-primary" type="button">
							<i class="fas fa-search fa-sm" id="_btnSearch" onclick="conditionChanged();"></i>
						</button>
					</div>
				</div>				
				</form><!-- /검색 -->				
			</div>
		
			
			
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">			
				<thead>
					<tr align="center">
						<th class="list_checkbox"><input type="checkbox"
							name='allckeck' onclick='allchecks(this.checked)' id='_allck'>
						</th>
						<th class="sorting">No<input type="hidden" name="sorting" id="_sorting"></th>
						<th class="sorting">ID</th>
						<th class="sorting">내용</th>
						<th class="sorting">적립액</th>
						<th class="sorting">사용금액</th>
						<th class="sorting">사용가능금액</th>
						<th class="sorting">만료일</th>
						<th class="sorting">쿠폰번호</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty pointsList }">
						<tr align="center">
							<td colspan="9" align="center">검색결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="c" items="${pointsList }" varStatus="vs">
						<tr align="center">
							<td class="list_checkbox"><input type="checkbox"
								name='allck' value="${c.seq }"></td>
							<td>${c.seq }</td>	
							<td class="list_id"><a href="mem_update?id=${c.id }">${c.id }</a></td>
							<td>${c.comment }</td>							
							<td>${c.amount }</td>
							<td>${c.used_amount }</td>
							<td>${c.totalAmount}</td>
							<td>${c.expdate }</td>
							<td>${c.coup_code }</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		
			<div class="col-sm-12 col-md-7"><!-- 페이징 네비게이션 시작 -->
				<div class="dataTables_paginate paging_simple_numbers"
					id="dataTable_paginate">
					<!-- 페이징 -->
					<div id="paging_wrap">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						        <span class="sr-only">Previous</span>
						      </a>
						    </li>
						    
						    <c:forEach begin="${pDto.firstNavIndex }" end="${pDto.lastNavIndex }" step="1" var="i">
						    	<li class="page-item"><a class="page-link page-num" href="#">${i }</a></li>
						    </c:forEach>
						    
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						        <span class="sr-only">Next</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div><!-- 페이징 네비게이션 끝 -->					
				</div>
			</div>
		</div>
	</div>
</div>

</div><!-- /.container-fluid -->

</html>