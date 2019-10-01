<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.ordercheck_wrap{
	/* background-color: #d7fd75; */
	margin-left: 350px;
}
.ordercheck_title{
	/* background-color: red; */
	border-bottom: 1px solid #dbdbdb;
	margin-bottom: 50px;
	margin-top: 50px;
}
.ordercheck_content{
	/* background-color: blue; */
}
.ordercheck_title_font{
	font-size: 35px;
}
</style>

</head>
<body>

<div class="ordercheck_wrap" align="center">
<div class="ordercheck_title" align="center">
<b class="ordercheck_title_font">비회원 주문내역 및 배송조회</b>
</div>
<div class="ordercheck_content" align="center">
<table>
<tr>
	<td><input type="text" placeholder="주문번호" style="width: 400px; height: 70px; padding-left: 15px;"></td>
</tr>
<tr>
	<td><input type="text" placeholder="주문자 이름" style="width: 400px; height: 70px; padding-left: 15px;"></td>
</tr>
<tr>
	<td style="padding-top: 20px;">
	<input type="button" value="조회하기" style="width: 400px; height: 70px; background-color: #d7fd75; border: #d7fd75;">
	</td>
</tr>
</table>
</div>
</div>

</body>
</html>