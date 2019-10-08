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
<link rel="stylesheet" href="/css/member/mypage/content/orderlog.css">

</head>


<div class="body_wrap">
<div class="mypage_main_content_top">
	<div class="top_title" align="left">
		<h3>주문 내역</h3>
	</div>
	<div class="top_term" align="right">
		<select>
			<option>전체 기간</option>
			<option>1년</option>
			<option>2년</option>
		</select>
	</div>
	<br/><br/>
	<hr/>	
</div>

<div class="mypage_main_content_body">
	<div class="body_orderlog" align="left">
		<div class="body_orderlog_item">
			<div class="orderdate">
				<p>2019-09-16 (11시 17분)</p>
			</div>
			<div class="order_detail">
				<div class="order_title">
					<div align="left" class="order_title_text"><h4>머스타드 2종 외 4건</h4></div><!-- 주문한품목 -->
					<div align="right" class="order_title_ico"><i class="fas fa-angle-right"></i></div>
				</div>
				<hr/>				
				<div class="order_body">
					<div class="order_body_thumbnail">
						<img alt="" src="https://img-cf.kurly.com/shop/data/goods/155841692418s0.jpg">
					</div>
					<div class="order_body_content">
						<table>
							<col width="100"><col width="100">
							<tr>
								<th>주문번호</th>
								<td>1951951652</td>
							</tr>
							<tr>
								<th>결제금액</th>
								<td>52,400원</td>
							</tr>
							<tr>
								<th>주문상태</th>
								<td>배송완료</td>
							</tr>
						</table>
					</div>
					<div class="order_body_btns" align="center">
						<input type="button" class="btn btn-default btn_order_body btn_write_review" value="후기 쓰기"><br>
						<input type="button" class="btn btn-default btn_order_body" value="1:1 문의">
					</div>
				</div>
			</div>
		</div>
		
		
		
		<div class="body_orderlog_item">
			<div class="orderdate">
				<p>2019-09-18 (15시 17분)</p>
			</div>
			<div class="order_detail">
				<div class="order_title">
					<div align="left" class="order_title_text"><h4>착즙 오렌지주스</h4></div><!-- 주문한품목 -->
					<div align="right" class="order_title_ico"><i class="fas fa-angle-right"></i></div>	
				</div>
				<hr/>				
				<div class="order_body">
					<div class="order_body_thumbnail">
						<img alt="" src="https://img-cf.kurly.com/shop/data/goods/1569216791202l0.jpg">
					</div>
					<div class="order_body_content">
						<table>
							<col width="100"><col width="100">
							<tr>
								<th>주문번호</th>
								<td>1051951652</td>
							</tr>
							<tr>
								<th>결제금액</th>
								<td>1,500원</td>
							</tr>
							<tr>
								<th>주문상태</th>
								<td>배송완료</td>
							</tr>
						</table>
					</div>
					<div class="order_body_btns" align="center">
						<input type="button" class="btn btn-default btn_order_body btn_write_review" value="후기 쓰기"><br>
						<input type="button" class="btn btn-default btn_order_body" value="1:1 문의">
					</div>
				</div>
			</div>
		</div>
		
		<div class="body_orderlog_item">
			<div class="orderdate">
				<p>2019-09-18 (15시 17분)</p>
			</div>
			<div class="order_detail">
				<div class="order_title">
					<div align="left" class="order_title_text"><h4>월넛 앤 그레이 식빵</h4></div><!-- 주문한품목 -->
					<div align="right" class="order_title_ico"><i class="fas fa-angle-right"></i></div>	
				</div>
				<hr/>				
				<div class="order_body">
					<div class="order_body_thumbnail">
						<img alt="" src="https://img-cf.kurly.com/shop/data/goods/1568969022159l0.jpg">
					</div>
					<div class="order_body_content">
						<table>
							<col width="100"><col width="100">
							<tr>
								<th>주문번호</th>
								<td>1951951652</td>
							</tr>
							<tr>
								<th>결제금액</th>
								<td>5,400원</td>
							</tr>
							<tr>
								<th>주문상태</th>
								<td>배송완료</td>
							</tr>
						</table>
					</div>
					<div class="order_body_btns" align="center">
						<input type="button" class="btn btn-default btn_order_body btn_write_review" value="후기 쓰기"><br>
						<input type="button" class="btn btn-default btn_order_body" value="1:1 문의">
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>
</div>

</html>