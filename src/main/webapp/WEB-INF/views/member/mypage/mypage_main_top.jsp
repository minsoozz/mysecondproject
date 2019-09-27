<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MypageMainTop</title>

<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/mypage_main_top.css">

</head>
<body>

<!-- <div id="_mypage_wrap" class="mypage_wrap" align="center"> -->
	<div id="_mypage_top" class="mypage_top" align="center"><!-- 배경화면 -->
		<div id="_mypage_top_user" class="mypage_top_user" align="center"><!-- ul영역설정 -->
			<ul id="_mypage_top_list" class="mypage_top_list">
				<li id="_grade_user" class="grade_user mypage_top_list_item">
					<div id="_grade_user_summary" class="grade_user_summary">
						<p>첫구매우대</p>
						<p>김라임님</p>
						<p>5%적립+무료배송 (2만원 이상 주문 시)</p>
					</div>
					<div id="_grade_user_detail" class="grade_user_detail">
						<input type="button" class="btn btn-primary" value="전체등급 보기">
						<input type="button" class="btn btn-primary" value="다음 달 예상등급 보기">
					</div>
				</li>
				<li id="_points_user" class="points_user mypage_top_list_item">
					<a>적립금</a>
					<a>695 원</a>
					<a>소멸 예정 0원</a>
				</li>
				<li id="_coupon_user" class="coupon_user mypage_top_list_item">
					<a>쿠폰</a>
					<a>2개 > </a>
				</li>
				<li id="_membership_user" class="membership_user mypage_top_list_item">
					<a>R패스</a>
					<a>알아보기 > </a>
				</li>			
			</ul>	
		</div>	
	</div>
	
	<div>
	
	</div>
<!-- </div> -->

</body>
</html>