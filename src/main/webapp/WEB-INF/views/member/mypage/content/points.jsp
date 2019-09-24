<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% String ctx = request.getContextPath(); %>
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
			695 원
		</div>
	</div>
</div>

</html>