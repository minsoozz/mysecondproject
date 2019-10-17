<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/mypage_main_left.css">
<script type="text/javascript" src="<%=ctx%>/js/member/mypage/mypage_main_left.js"></script>
</head>



<div class="mypage_main_left_title" align="left">
	<h3>마이페이지</h3>	
</div>

<div class="btn-group-vertical" align="left">
	<button type="button" class="btn btn-default btn_inner" onclick="location.href='<%=ctx%>/mypage/orderlog';">
		<div align="left" class="btn_inner_title">주문 내역</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default" onclick="location.href='<%=ctx%>/mypage/wishlist';">
		<div align="left" class="btn_inner_title">찜 목록</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default" onclick="location.href='<%=ctx%>/mypage/review';">
		<div align="left" class="btn_inner_title">상품후기</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default" onclick="location.href='<%=ctx%>/mypage/points';">
		<div align="left" class="btn_inner_title">적립금</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default" onclick="location.href='<%=ctx%>/mypage/coupon';">
		<div align="left" class="btn_inner_title">쿠폰</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default" onclick="location.href='<%=ctx%>/mypage/notes';">
		<div align="left" class="btn_inner_title">쪽지함</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default" onclick="location.href='#';">
		<div align="left" class="btn_inner_title">판매목록</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default" onclick="location.href='#';">
		<div align="left" class="btn_inner_title">교환/환불</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
	<button type="button" class="btn btn-default" onclick="location.href='<%=ctx%>/mypage/personal';">
		<div align="left" class="btn_inner_title">개인 정보 수정</div>
		<div align="right" class="btn_inner_ico"><i class="fas fa-angle-right"></i></div>		
	</button>
</div>
<form action="/logout" method="post" style="margin-top: 100px;">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="submit" value="로그아웃" class="btn btn-rhy-full">
</form>
</html>