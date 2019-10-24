<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content_main</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">주문내역</h1>
	<p class="mb-4">회원, 비회원의 결제 정보</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">주문내역</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<!-- @@@@ 여기서부터 작성 @@@@@ -->

 				<div class="payment_success_wrap">
					<div class="payment_success_contents">
						<table class="table table-bordered">
							<tr>
								<td>주문번호</td>
								<td>회원아이디</td>
								<td>이름</td>
								<td>결제수단</td>
								<td>결제상태</td>
								<td>결제금액</td>
								<td>주문일</td>
							</tr>
							<c:forEach items="${orderSuccess }" var="p">
								<tr>
									<td>${fn:substring(p.payment_code,4,16) }</td>
									<c:if test="${not empty p.userid }">
										<td>${p.userid }</td>
									</c:if>
									<c:if test="${empty p.userid }">
										<td>비회원</td>
									</c:if>
									<td>${p.send_name }</td> 									
									<td>
										<c:if test="${p.payment_method == 'vbank' }">무통장입금</c:if>
										<c:if test="${p.payment_method == 'card' }">신용카드</c:if>
										<c:if test="${p.payment_method == 'trans' }">실시간계좌이체</c:if>
										<c:if test="${p.payment_method == 'phone' }">휴대폰소액결제</c:if>
										<c:if test="${p.payment_method == 'kakaopay' }">카카오페이</c:if>
									</td>
									<td>
										<c:if test="${p.payment_status =='ready' }">미결제</c:if>
										<c:if test="${p.payment_status =='paid' }">결제완료</c:if>
										<c:if test="${p.payment_status =='cancelled' }">결제취소</c:if>
									</td>
									<td><fmt:formatNumber value="${p.totalprice }"/>원</td>
									<td>${p.rdate }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>


				<!-- @@@@@ 여기까지 @@@@@ -->

			</div>
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->
</html>



