<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
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
	<th>쿠폰번호${totalprice }</th>
	<th>쿠폰이름</th>
	<th>할인액(률)&nbsp;적립액(률)</th>
	<th>사용기간</th>
</tr>
<c:forEach items="${coupon_code }" var="c">
<tr>
	<td>${c.coup_code }</td>
	<td>${c.title }</td>
	<td>
	<c:choose>
		<c:when test="${c.func_measure == '원' }">
			<fmt:formatNumber value="${c.func_num}" type="number" />${c.func_measure }
		</c:when>
		<c:otherwise>
			${c.func_num }${c.func_measure }
		</c:otherwise>
	</c:choose>	
	</td>
	<td>${fn:substring(c.gdate,2,11) } ~ ${fn:substring(c.expdate,2,11) }</td>
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
	<th>할인액(률)&nbsp;적립액(률)</th>
	<th>사용기간
	<input type="hidden"></th>
</tr>

<tr>
	<td>	
	<select id="coupon_popup_select" onchange="coupon_select(this)">
		<option func="">사용안함</option>
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
	<input type="button" id="coupon_popup_btn" value="확인">
	<input type="button" value="취소" onclick="self.close();">
	</td>	
</tr>
</table>
</div>
</div>




<script type="text/javascript">
$(function(){

	var func;
	var func_num;
	var func_measure;
	var coup_code;
	
	$("#coupon_popup_btn").click(function () {
		//alert("클릭");
		
		var coupon_popup_select = $("#coupon_popup_select").val();
		//alert( coupon_popup_select );
		
		func = $("#coupon_popup_select option:selected").attr("func");
		func_num = $("#coupon_popup_select option:selected").attr("func_num");
		func_measure = $("#coupon_popup_select option:selected").attr("func_measure");
		coup_code = $("#coupon_popup_select option:selected").attr("coup_code");
		
		if(func == ""){
			alert("쿠폰을 선택해주세요");
			return;
		}
		
		alert(func + func_num + func_measure + coup_code);
	/* 
		$("#coupon_use").text( coup_code );
		$("#coupon_use_func").text( func );
		$("#coupon_use_func_num").text( func_num );
		$("#coupon_use_func_measure").text( func_measure ); */
		
		opener.document.getElementById("coupon_use").value = coup_code;
		opener.document.getElementById("coupon_use_func").value = func;
		opener.document.getElementById("coupon_use_func_num").value = func_num;
		opener.document.getElementById("coupon_use_func_measure").value = func_measure;
		 
		window.close();
	});
	
});


//쿠폰 팝업창
function coupon_select( obj ) {
	//alert("333");
	//alert(obj.value);
}
</script>



</body>
</html>