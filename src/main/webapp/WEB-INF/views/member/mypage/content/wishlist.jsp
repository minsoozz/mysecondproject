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
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/wishlist.css">
</head>

<div class="mypage_main_content_title" align="left">
	<h3>찜 목록</h3>
</div>

<div class="form-group">
	<div class="form-header">
	<div class="form-row">
		<div class="col-md-2 img_wishlist_item">
			<input type="checkbox">
		</div>
		<div class="col-md-8 detail_wishlist_item">
			상품설명
		</div>
		<div class="col-md-2 writenew_waiting_item">
			<div class="wishlist_body_btns" align="center">
				<input type="button" class="btn btn-default btn_order_body btn_write_review" value="장바구니 담기"><br>
				<input type="button" class="btn btn-default btn_order_body" value="삭제">
			</div>				
		</div>
	</div>
	</div>
	
	<c:forEach items="${wishlist }" var="dto">
		<div class="form-row">
			<div class="col-md-2 img_wishlist_item">
				<input type="checkbox">
			</div>
			<div class="col-md-2 img_wishlist_item">
				<img src="<%=ctx %>/upload/store/${dto.photo1_file }" onerror="this.src='https://i.ytimg.com/vi/vWMCCZEkrKg/maxresdefault.jpg'">
			</div>
			<div class="col-md-6 detail_wishlist_item">
				<div class="form-row">${dto.p_name }</div>
				<div class="form-row">${dto.p_title }</div>
				<div class="form-row">${dto.p_price }개 구매</div>
			</div>
			<div class="col-md-2 writenew_waiting_item">
				<div class="wishlist_body_btns" align="center">
					<input type="button" class="btn btn-default btn_order_body btn_write_review" value="장바구니 담기"><br>
					<input type="button" class="btn btn-default btn_order_body" value="삭제">
				</div>				
			</div>
		</div>
	</c:forEach>
</div>


<div class="mypage_main_content_body">
	<div class="body_wishlist" align="left">
		<div class="tbl_wishlist_wrap">
			<table class="tbl_wishlist">
				<col width="150"><col width="650"><col width="300">
				<thead class="tbl_wishlist_head">
					<tr>
						<th><input type="checkbox"></th>
						<th>상품정보</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody class="tbl_wishlist_body">
					<tr>
						<th class="td_chk" align="center"><input type="checkbox"></th>
						<td>
							<div class="wishlist_body_details">
								<div class="detail_thumbnail">
									<img alt="" src="//img-cf.kurly.com/shop/data/goods/1476063504425s0.jpg">
								</div>
								<div class="detail_text">
									<dl>
										<dd>저탄소 GAP 청도 반시</dd>
										<dd>5,000원</dd>
									</dl>
								</div>
							</div>					
						</td>
						<td>
							<div class="wishlist_body_btns" align="center">
								<input type="button" class="btn btn-default btn_order_body btn_write_review" value="장바구니 담기"><br>
								<input type="button" class="btn btn-default btn_order_body" value="삭제">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>


</html>