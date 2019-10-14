<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<% String ctx = request.getContextPath(); %>

<!-- 아이콘 활용을 위한 font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/wishlist.css">
<script type="text/javascript" src="<%=ctx%>/js/member/mypage/content/wishlist.js"></script>
</head>
<sec:authentication property="principal" var="prc"/>
<input type="hidden" value="${prc.username }" id="_currUserId">
<div class="mypage_main_content_title" align="left">
	<h3>찜 목록</h3>
</div>

<div class="form-group">
	<div class="form-header tbl_wishlist_head">
	<div class="form-row">
		<div class="col-md-2 img_wishlist_item">
			<p>전체선택</p>
			<div class="switch_box box_1">
				<input type="checkbox" class="switch_1" id="_chk_head">
			</div>
		</div>
		<div class="col-md-8 detail_wishlist_item">
			상품설명
		</div>
		<div class="col-md-2 writenew_waiting_item">
		</div>
	</div>
	</div>
	
	<div class="body_wishlist">
	<c:forEach items="${wishList }" var="dto">
		<div class="form-row wishlist_row" id="itemrow_${dto.p_seq }">
			<div class="col-md-2 chk_wishlist_item">				
				<div class="switch_box box_1">
					<input type="checkbox" class="switch_1 chk_item">
				</div>
			</div>			

			<div class="col-md-2 img_wishlist_item" align="left">
				<img src="<%=ctx %>/upload/store/${dto.photo1_file }" onerror="this.src='https://i.ytimg.com/vi/vWMCCZEkrKg/maxresdefault.jpg'">
			</div>
			<div class="col-md-6 detail_wishlist_item">
				<div class="form-row">${dto.p_name }</div>
				<div class="form-row">${dto.p_title }</div>
				<div class="form-row"><fmt:formatNumber value="${dto.p_price }" pattern="###,###,###" />원</div>
			</div>

			<div class="col-md-2 writenew_waiting_item">
				<div class="wishlist_body_btns" align="center">
					<input type="button" class="btn btn-default btn_order_body btn_write_review" value="장바구니 담기"><br>
					<input type="button" class="btn btn-default btn_order_body btn_delete_item" value="삭제">
				</div>				
			</div>
		</div>
	</c:forEach>
	</div>
	
	<div class="form-header tbl_wishlist_footer">
	<div class="form-row">
		<div class="col-md-12 tbl_wishlist_overall_btns">
			<input type="button" class="btn btn-rhy-full" value="선택품목 주문">
			<input type="button" class="btn btn-rhy-border" value="선택품목 삭제">
		</div>
	</div>
	</div>
</div>


</html>