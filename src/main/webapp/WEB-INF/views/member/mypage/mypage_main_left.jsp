<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/mypage_main_left.css">
</head>

<div class="mypage_main_left_title" align="left">
	<h3>마이페이지</h3>
</div>


<div class="btn-group-vertical" align="left">
	<button type="button" class="btn btn-default btn_inner">
		<div align="left" class="btn_inner_title">주문 내역</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default">
		<div align="left" class="btn_inner_title">늘 사는 것</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default">
		<div align="left" class="btn_inner_title">상품후기</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default">
		<div align="left" class="btn_inner_title">적립금</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default">
		<div align="left" class="btn_inner_title">쿠폰</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default">
		<div align="left" class="btn_inner_title">개인 정보 수정</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>	
</div>

</html>