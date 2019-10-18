<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>



<div class="payment_coupon_wrap">
	<div class="payment_coupon_get">
		<div class="payment_coupon_get_title">
			<ul>
				<li style="text-align: left;">보유 쿠폰 내역</li>
			</ul>
		</div>
		<table class="payment_coupon_tb">
			<tr>
				<th>쿠폰번호${product_price }</th>
				<th>쿠폰이름</th>
				<th>할인액(률)&nbsp;적립액(률)</th>
				<th>사용기간</th>
			</tr>
			<c:forEach items="${coupon_code }" var="c">
				<tr>
					<td>${c.coup_code }</td>
					<td>${c.title }</td>
					<td><c:choose>
							<c:when test="${c.func_measure == '원' }">
								<fmt:formatNumber value="${c.func_num}" type="number" />${c.func_measure }
							</c:when>
							<c:otherwise>
								${c.func_num }${c.func_measure }
							</c:otherwise>
						</c:choose>
					</td>
					<td>${fn:substring(c.gdate,2,11) }~${fn:substring(c.expdate,2,11) }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="payment_coupon_used">
		<div class="payment_coupon_used_title">
			<ul>
				<li style="text-align: left;">사용 쿠폰 선택</li>
			</ul>
		</div><br><br>

		<table class="payment_coupon_tb">
			<tr>
				<th>쿠폰선택</th>
			</tr>
			<tr>
				<td>
					<select id="coupon_popup_select">
							<option func_measure="default">사용안함</option>
							<c:forEach begin="0" end="${fn:length(coupon_code) -1 }" varStatus="i">
								<option func="${coupon_code[i.index].func }"
									func_num="${coupon_code[i.index].func_num }"
									func_measure="${coupon_code[i.index].func_measure }"
									coup_code="${coupon_code[i.index].coup_code }">${coupon_code[i.index].coup_code}</option>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<!-- 할인할 때 계산을 위해 부모창에서 가져온 데이터 -->
					<input type="text" id="product_price" value="${product_price }">
					<input type="text" id="disc_point" value="${input_disc_point }">
					<input type="button" id="coupon_popup_btn" value="확인">
					<input type="button" value="취소" onclick="self.close();">
				</td>
			</tr>
		</table>
	</div>
</div>



<script type="text/javascript">
	$(function() {

		$("#coupon_popup_btn").click(function() {
			// func : 적립 or 할인, func_num : 적립포인트 or 할인율, func_measure : % or 원, coup_code : 쿠폰 고유 코드
			var func = $("#coupon_popup_select option:selected").attr("func");
			var func_num = $("#coupon_popup_select option:selected").attr("func_num");
			var func_measure = $("#coupon_popup_select option:selected").attr("func_measure");
			var coup_code = $("#coupon_popup_select option:selected").attr("coup_code");
			
			// 부모창에서 가져온 사용 적립금 (사용자가 입력하지 않았으면 0)
			var disc_point = $("#disc_point").val();
			// 부모창에서 가져온 총 상품금액
			var product_price = $("#product_price").val();


			
			// 사용안함을 클릭하고 쿠폰을 적용하지 않을 때
			if (func_measure == "default") {
				var result = confirm("쿠폰을 적용하지 않고 결제를 하시겠습니까?");

				if (result) {
					// 쿠폰코드와 상세설명을 ""로
					opener.document.getElementById("coupon_code").value = "";
					opener.document.getElementById("coupon_func").value = "";

					// 쿠폰으로 할인된 금액과 총 할인 된 금액을 0으로
					opener.document.getElementById("disc_coupon").value = "0";

					// 총 금액을 다시 계산
					opener.document.getElementById("totalprice").value = parseInt(product_price) - parseInt(disc_point);
					window.close();
				} else {

				}

				return;
			}



			// 할인 or 적립 쿠폰을 적용 했을 때
			// 쿠폰 고유 코드와 상세설명을 부모창으로 보낸다
			opener.document.getElementById("coupon_code").value = coup_code;
			opener.document.getElementById("coupon_func").value = func + " " + func_num + " " + func_measure;

			if (func_measure == "%") {
				// 할인일 때
				disc_coupon = parseInt(product_price) * (parseInt(func_num) / 100);
				console.log(disc_coupon);

				// 쿠폰으로 할인 된 금액
				opener.document.getElementById("disc_coupon").value = disc_coupon;
				opener.document.getElementById("totalprice").value = parseInt(product_price) - parseInt(disc_point) - disc_coupon;
			} else {
				// 적립일 때
				
				// 쿠폰으로 할인 된 금액 = 0, add_point = 값
				opener.document.getElementById("disc_coupon").value = "0";
				opener.document.getElementById("add_point").value = parseInt(product_price) * 0.02;
				opener.document.getElementById("totalprice").value = parseInt(product_price) - parseInt(disc_point);
			}

			window.close();
		});

	});
</script>



</body>
</html>