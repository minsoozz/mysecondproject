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
<link rel="stylesheet" href="/css/member/mypage/content/coupon.css">
</head>
<div class="mypage_main_content_title" align="left">
	<h3>쿠폰</h3>
</div>

<div class="form-group">
	<div class="form-row regi_new_coupon">
		<div class="col-md-12" align="center">
			<div class="form-row">
				<div class="col-md-6" align="center">
					<input type="text" class="form-control coupon_input" placeholder="쿠폰 번호를 입력해 주세요.">
				</div>
				<div class="col-md-3" align="center">
					<input type="button" class="btn btn-default coupon_input" id="_btn_regi_new_coupon" value="쿠폰 등록">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-12" align="left">
					<small id="_coupon_input_info">쿠폰에 하이픈("-")이 포함되어 있을경우 하이픈("-")을 반드시 입력해주세요.</small>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="form-row coupon_list">		
		<div class="col-md-12" align="center">
			<div class="form-row">
				<div class="col-md-9" align="left">
					<small id="_coupon_list_info">쿠폰에 적용 대상 상품이 명시되어 있는 경우, 해당 상품 구매 시에만 사용이 가능합니다.</small>
				</div>
				<div class="col-md-3" align="right">
					<small id="_coupon_list_amount">사용가능 쿠폰 : 1장</small>
				</div>
			</div>
			<div class="form-row coupon_table_head tbl-rhy-head">
				<div class="col-md-7" align="center">
					쿠폰명
				</div>
				<div class="col-md-1" align="center">
					기능
				</div>
				<div class="col-md-1" align="center">
					할인/적립
				</div>
				<div class="col-md-2" align="center">
					사용가능기간
				</div>
				<div class="col-md-1" align="center">
					사용여부
				</div>
			</div>
			<div class="form-row coupon_table_body tbl-rhy-body">
				<div class="col-md-7" align="center">
					<!-- <small class="txt_coupon_info">고객감사 7% 할인쿠폰(최대 1만원 할인, ~9/30)</small> -->
					<p class="txt_coupon_info">고객감사 7% 할인쿠폰(최대 1만원 할인, ~9/30)</p>
					<small class="txt_coupon_info_sub form-text text-muted">최대 1만원 할인, 컬리패스 상품 제외</small>
				</div>
				<div class="col-md-1" align="center">
					할인
				</div>
				<div class="col-md-1" align="center">
					7%
				</div>
				<div class="col-md-2" align="center">
					19-09-02 ~ 19-09-30
				</div>
				<div class="col-md-1" align="center">
					미사용
				</div>
			</div>
		</div>
	</div>
</div>


</html>