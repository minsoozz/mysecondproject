<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<% String ctx = request.getContextPath(); %>
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/wishlist.css">
</head>

<div class="mypage_main_content_title" align="left">
	<h3>늘 사는 것</h3>
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