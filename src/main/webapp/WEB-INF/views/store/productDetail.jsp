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

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<link href='/css/style.css' rel='stylesheet'/>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script src='js/swipe.js'></script>

</head>
<body>
	
	<div class="mainImg" style="border:2px solid">
		<img alt="사진1" src="/upload/${productDto.photo1_file }" style="width:250px;height:250px;" style="margin:3%;">
	</div>
	<div style="border:2px solid red">
		<img alt="사진2" src="/upload/${productDto.photo2_file }" style="width:250px;height:250px;" style="margin:3%;">
		<img alt="사진3" src="/upload/${productDto.photo3_file }" style="width:250px;height:250px;" style="margin:3%;">
		<img alt="사진4" src="/upload/${productDto.photo4_file }" style="width:250px;height:250px;" style="margin:3%;">
		<img alt="사진5" src="/upload/${productDto.photo5_file }" style="width:250px;height:250px;" style="margin:3%;">
	</div>
		
	${ productDto.p_name}<br>
	&#8361;${ productDto.p_price2}<br>
	
	<div class='' style="cursor:pointer;" onclick="detail(${pro.p_seq })"> 
		<br>사이즈 선택<br>
		<c:forEach items="${sizelist }" var="size" varStatus="vs">
			<%-- <option value="${size.size}" value2="${size.stock_seq }" label="${size.size }"> --%>
			<input type="radio" name='sizeRadio' id="chooseSize${vs.count }" class="_chooseSize${index.count }" style="display:none" value="${size.size }" value2="${size.stock_seq }">
			<label for="chooseSize${vs.count }" id="_sizeChoo" class="sizeLabel" style="cursor: pointer; background-color: white;">${size.size }</label>
		</c:forEach>
	</div>

	수량&nbsp;
	<span class="pqSelect">
		<span class="minus_Btn" style="cursor:pointer;">-</span>&nbsp;&nbsp;&nbsp;
			<label id="pqCnt">1</label>&nbsp;&nbsp;&nbsp;
		<span class="plus_btn" style="cursor:pointer;">+</span>
	</span>
	<br>
	<input type="button" value="바로구매" id="buyBtn" onclick="buying()" style="cursor:pointer;"><br>
	<input type="button" value="장바구니" class="basketBtn" style="cursor:pointer;">

    <div class="basket" style="overflow: scroll;">
 	</div>

<!-- 구매하기 form -->
<form action="/Rhymes/payment" id="orderFrm" method="get">
	<input type='hidden' name="stock_seq" id="stock_seq">
	<input type='hidden' name="p_size" id="p_size">
	<input type='hidden' name="p_quantity" id="p_quantity" >
</form>	

<<<<<<< HEAD
=======
<!-- 장바구니 구매하기 form -->
<form action="/Rhymes/payment/basketOrder" method="post" id="bOrderFrm">
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
	<input type='hidden' name="blist_stockseq" id="blist_stockseq" value="">	
	<input type='hidden' name="blist_pQuantity" id="blist_pQuantity" value="">
</form>

<!-- 장바구니 페이지이동 form -->
<form action="/Rhymes/store/basket" method="post" id="moveBasketFrm">
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>


>>>>>>> 735b5584a2580d447d382b159556c937f4d4cd9e

<!--------------------------------------------- ★SCRIPT ZONE★ ---------------------------------------------->	


<script>
var blist_stockseq = "";
var blist_pQuantity = "";

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

//장바구니 영역외 클릭시 hide
$('body').click(function(e){
	 if($(".basket").css("display") == "block") {
         if(!$('.basket, .blist').has(e.target).length) { 
        	 $(".basket").hide("slow");
          } 
  	 }
});

// 사이즈 선택시 버튼색상 변경
$(document).on('click', '.sizeLabel', function(){
	$(".sizeLabel").attr('style', 'background-color:white');
	$(this).attr('style', 'background-color:#d7fd75');
});

// 장바구니 클릭
$(document).on('click', '.basketBtn', function(){	
<<<<<<< HEAD
	//재고번호get
	/* var stock_seq = Number($("input[name='sizeRadio']:checked").attr("value2");
	alert("stock_seq : " + stock_seq);	
	var cnt = Number($("#pqCnt").html());
	alert("수량 : " + cnt); */
=======
	var stock_seq = Number($("input[name='sizeRadio']:checked").attr("value2"));
	var cnt = Number($("#pqCnt").html());
	if(isNaN(stock_seq)){
		alert("사이즈를 선택해주세요.");
	}else{
		$.ajax({
	        type:"get",
	        data: "stock_seq=" + stock_seq + "&p_quantity=" + cnt,
	        url:"/Rhymes/store/insertBasket",
	        success:function( data ){
	        	//alert(data);
	        	var obj = JSON.stringify(data);
				var arr = JSON.parse(obj);
				//alert(arr[0].total_price);
				var arrLen = arr.length;
	        	showBasketList(arrLen, arr);
	        },
	        error:function(){
	           alert("error!!"); 
	        }
   		})
	}
});
/* 미니 장바구니 리스트 */
function showBasketList(arrLen, arr){
	$(".blist").html("");
	$("#baskettitle").remove();
	var str = "";
	var str = "<div align='center' id='baskettitle'><h2>ㅋ장바구니ㅋ</h2></div>";
	for (var i = 0; i < arrLen; i++) {
		str += "<div style='margin-top:5%;' align='center' class='blist' >";
		str += "<label><img src='/upload/"+ arr[i].photo1_file + "' style='width:100px; height:100px;'><br>";
		str += "<label class='_bDeleteBtn' value='"+arr[i].stock_seq+"'>X</label><br>";
		str += "<label>" + arr[i].p_name + "</label><br>";
		str += "<label>사이즈 : " + arr[i].size + "</label><br>";
		str += "<label>수량 : " + arr[i].p_quantity + "</label><br>";
		str += "<label>&#8361;" + arr[i].p_price2 + "</label>";
		str += "<hr width = '100%' color='white'>";
		
		blist_stockseq += arr[i].stock_seq;
		blist_stockseq += "/";
		blist_pQuantity += arr[i].p_quantity;
		blist_pQuantity += "/";
				
	}
			
		str += "<label class='moveBasketBtn'>장바구니 가기</label><br>";
		str += "<label class='_basketOrderBtn'>바로구매</label>";
		/* str += "<input type='buttn' class='_basketOrderBtn' value='바로구매'>"; */
		str += "<br><br><b><label value='"+arr[0].total_price+"' class='_bTotalPrice'>총 상품금액 : " + arr[0].total_price + "</b>원</label><br><br>";
		str += "</div>";
		
		$("#blist_stockseq").val(blist_stockseq);
		$("#blist_pQuantity").val(blist_pQuantity);
		
	$(".basket").append(str);
	
	$(".basket").animate({width:'toggle'},350);
}

/* 미니장바구니 전체 구매버튼 클릭 */
$(document).on('click', '._basketOrderBtn', function(){
	$("#bOrderFrm").submit();		
});
>>>>>>> 735b5584a2580d447d382b159556c937f4d4cd9e

/* 장바구니 페이지 이동버튼 클릭 */
$(document).on('click', '.moveBasketBtn', function(){
	$("#moveBasketFrm").submit();	
});

/* 미니장바구니 삭제버튼 클릭 */
$(document).on('click', '._bDeleteBtn', function(){
	alert("삭제");
	var stock_seq = $(this).val();
	alert("재고번호 : " + stock_seq);
	/* ajax로 삭제하고 리스트 다시 뿌려야함 */
});

/* 구매버튼 클릭 */
function buying(){
	var stock_seq = Number($("input[name='sizeRadio']:checked").attr("value2"));
<<<<<<< HEAD
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
=======
	alert(stock_seq);
	
	if(isNaN(stock_seq)){
		alert("사이즈를 선택해주세요.");	
>>>>>>> 735b5584a2580d447d382b159556c937f4d4cd9e
	}else{
		
		$("#stock_seq").val(stock_seq);
		
		var cnt = Number($("#pqCnt").html());
		$("#p_quantity").val(cnt);
		$("#orderFrm").submit();
	}
}

/* 구매 수량 */
$(document).on('click', '.plus_btn', function(){
var cnt = Number($("#pqCnt").html());
if(cnt<9){
	$("#pqCnt").html(cnt+1);	
}else{
	alert("최대 구매수량을 초과했습니다.");
}

});

$(document).on('click', '.minus_Btn', function(){
var cnt = Number($("#pqCnt").html());
if(cnt!=1){
	$("#pqCnt").html(cnt-1);
}	 
});


</script>
</body>
</html>