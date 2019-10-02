<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<head>

<meta charset="UTF-8">
<!-- security ajax -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<% String ctx = request.getContextPath(); %>

<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="/css/store/productDetail.css">


<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
</script>

</head>
<body>
	
	<img alt="사진1" src="/upload/${productDto.photo1_file }" style="width:250px;height:250px;" style="margin:3%;"><br>
	<img alt="사진2" src="/upload/${productDto.photo2_file }" style="width:250px;height:250px;" style="margin:3%;">
	<img alt="사진3" src="/upload/${productDto.photo3_file }" style="width:250px;height:250px;" style="margin:3%;">
	<img alt="사진4" src="/upload/${productDto.photo4_file }" style="width:250px;height:250px;" style="margin:3%;">
	<img alt="사진5" src="/upload/${productDto.photo5_file }" style="width:250px;height:250px;" style="margin:3%;">
	<br><br>
	${ productDto.p_name}<br>
	&#8361;${ productDto.p_price2}<br>
	
	<div class='' style="cursor:pointer;" onclick="detail(${pro.p_seq })"> 
		<br>사이즈 선택<br>
		<c:forEach items="${sizelist }" var="size" varStatus="vs">
			<%-- <option value="${size.size}" value2="${size.stock_seq }" label="${size.size }"> --%>
			<input type="radio" name='sizeRadio' id="chooseSize${vs.count }" class="_chooseSize${index.count }" style="display:" value="${size.size }" value2="${size.stock_seq }">
			<label for="chooseSize${vs.count }" id="_sizeChoo" style="cursor: pointer; background-color: white;">${size.size }</label><br>
		</c:forEach>
	</div>

	수량&nbsp;
	<span class="pqSelect">
		<span onclick="minusQ()" style="cursor:pointer;">-</span>&nbsp;&nbsp;&nbsp;
			<label id="pqCnt">1</label>&nbsp;&nbsp;&nbsp;
		<span onclick="plusQ()" style="cursor:pointer;">+</span>
	</span>
	<br>
	<input type="button" value="바로구매" id="buyBtn" onclick="buying()" style="cursor:pointer;"><br>
	<input type="button" value="장바구니" class="basketBtn" style="cursor:pointer;">

<!-- 구매하기 form -->
<form action="/Rhymes/store/productOrder" id="orderFrm" method="get">
	<input type='hidden' name="stock_seq" id="stock_seq">
	<input type='hidden' name="p_size" id="p_size">
	<input type='hidden' name="p_quantity" id="p_quantity" >
</form>	


<!--------------------------------------------- ★SCRIPT ZONE★ ---------------------------------------------->	


<script>
/* 장바구니 클릭 */
$(document).on('click', '.basketBtn', function(){	
	//재고번호get
	/* var stock_seq = Number($("input[name='sizeRadio']:checked").attr("value2");
	alert("stock_seq : " + stock_seq);	
	var cnt = Number($("#pqCnt").html());
	alert("수량 : " + cnt); */

});

/* 구매버튼 클릭 */
function buying(){
	var stock_seq = Number($("input[name='sizeRadio']:checked").attr("value2"));
	$("#stock_seq").val(stock_seq);
	
	var cnt = Number($("#pqCnt").html());
	$("#p_quantity").val(cnt);
	$("#orderFrm").submit();
}

/* 구매 수량 */
function plusQ(){
	var cnt = Number($("#pqCnt").html());
	if(cnt<9){
		$("#pqCnt").html(cnt+1);	
	}else{
		alert("최대 구매수량을 초과했습니다.");
	}
	
}
function minusQ(){
	var cnt = Number($("#pqCnt").html());
	if(cnt!=1){
		$("#pqCnt").html(cnt-1);
	}
}

</script>
</body>
</html>