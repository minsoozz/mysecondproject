<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<% String ctx = request.getContextPath(); %>

<!-- 아이콘 활용을 위한 font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>


<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/points.css">
</head>
<div class="mypage_main_content_title" align="left">
	<h3>적립금</h3>
</div>

<div class="form-group">
	<div class="form-row user_point_info">
		<div class="col-md-6">
			<div class="form-row">		
				<div class="col-md-6">
					현재 적립금 : 
				</div>			
				<div class="col-md-6">
					4,000원
				</div> 
			</div>
		</div>					
		<div class="col-md-6">
			<div class="form-row">		
				<div class="col-md-6">
					소멸 예정 적립금 : 
				</div>			
				<div class="col-md-6">
					0원
				</div> 
			</div>
		</div>
	</div>
</div>

<div class="form-group user_point_detail">
	<div class="form-row user_point_info_title">
		<div class="col-md-2">
			날짜			
		</div>
		<div class="col-md-6">
			내용 
		</div>
		<div class="col-md-2">
			유효기간			
		</div>
		<div class="col-md-2">
			금액			
		</div>
	</div>
	<div class="form-row user_point_info_content">
		<div class="col-md-2">
			19.09.17			
		</div>
		<div class="col-md-6">
			[구매적립] 주문(1568601875323) 5% 적립 
		</div>
		<div class="col-md-2">
			20.09.30			
		</div>
		<div class="col-md-2">
			+ 695 원
		</div>
	</div>
</div>

<div class="points_paging" align="center">
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>

</html>