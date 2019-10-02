<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- ordercheck.js -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/ordercheck/ordercheck.js"></script>

</head>
<body>


<form id="ordercheck_frm">
<div class="ordercheck_confirm_wrap" align="center">
<div class="ordercheck_confirm_title" align="center">
<b class="ordercheck_confirm_title_font">비회원 주문내역 및 배송조회</b>
</div>
<div class="ordercheck_confirm_content" align="center">
<table>
<tr>
	<td><input type="text" placeholder="주문번호" id="ordercheck_number"></td>
</tr>
<tr>
	<td><input type="text" placeholder="주문자 이름" id="ordercheck_name"></td>
</tr>
<tr>
	<td style="padding-top: 20px;">
	<input type="button" value="조회하기" id="ordercheck_btn">
	</td>
</tr>
</table>
</div>
<br><br>

<li>
	<ul>구매번호는 발송된 이메일에서 확인하실 수 있습니다.</ul>
	<ul>구매번호가 생각나지 않는 경우, 고객센터(1588-4763)로 문의 부탁드립니다.</ul>
</li>

</div>
</form>


<script type="text/javascript">
/* alert("주문조회");
$("#ordercheck_btn").click(function () {
	$("#ordercheck_frm").attr("action","/Rhymes/ordercheck").submit();
}); */
</script>

</body>
</html>