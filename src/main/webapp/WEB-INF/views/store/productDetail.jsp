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

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link href='/css/style.css' rel='stylesheet'/>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>

</head>
<body>
	<input type="hidden" id="hdnPseq" value="${productDto.p_seq }">
	
	<div>	
		<div class="mainImg" style="border:2px solid">
			<img alt="사진1" src="/upload/store/${productDto.photo1_file }" style="width:250px;height:250px;" style="margin:3%;">
		</div>
		<div style="border:2px solid red">
			<img alt="사진2" src="/upload/store/${productDto.photo2_file }" style="width:250px;height:250px;" style="margin:3%;">
			<img alt="사진3" src="/upload/store/${productDto.photo3_file }" style="width:250px;height:250px;" style="margin:3%;">
			<img alt="사진4" src="/upload/store/${productDto.photo4_file }" style="width:250px;height:250px;" style="margin:3%;">
			<img alt="사진5" src="/upload/store/${productDto.photo5_file }" style="width:250px;height:250px;" style="margin:3%;">
		</div>
	</div>

		
	${ productDto.p_name}<br>
	&#8361;${ productDto.p_price2}<br>
	
	<div class='' style="cursor:pointer;" onclick="detail(${pro.p_seq })"> 
		<br>사이즈 선택<br>
		<c:forEach items="${sizelist }" var="size" varStatus="vs">
			<c:if test="${size.quantity ne 0 }">
			<input type="radio" name='sizeRadio' id="chooseSize${vs.count }" class="_chooseSize${index.count }" style="display:none" value="${size.size }" value2="${size.stock_seq }">
			<label for="chooseSize${vs.count }" id="_sizeChoo" class="sizeLabel" style="cursor: pointer; background-color: white;">${size.size }</label>
			</c:if>
			<c:if test="${size.quantity eq 0 }">
			<input type="radio" name='sizeRadio' id="chooseSize${vs.count }" disabled="disabled" class="_chooseSize${index.count }" style="display:none" value="${size.size }" value2="${size.stock_seq }">
			<label for="chooseSize${vs.count }" id="_sizeChoo" style="cursor: pointer; background-color: grey; color:white;" onclick="soldout()">${size.size }</label>
			</c:if>
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
	<button type="button" class="wishBtn" style="cursor:pointer;">
		위시리스트
		<span>
		<c:if test="${wishChk == false }">
			<img class="heartImg" src="/img/store-img/unlike.png" style="width:10px; height:10px;">
		</c:if>
		<c:if test="${wishChk == true }">
			<img class="heartImg" src="/img/store-img/like.png" style="width:10px; height:10px;">
		</c:if>
		</span>
	</button>

    <div class="basket" style="overflow: scroll;">
 	</div>

<!-- 메시지 영역 -->
<div class="wModal">
	<div class="wModal-content">
		<span id="msg"></span>
	</div>
</div>

<!-- 구매하기 form -->
<form action="/payment" id="orderFrm" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type='hidden' name="stock_seq" id="stock_seq">
	<input type='hidden' name="p_quantity" id="p_quantity" >
</form>	

<!-- 장바구니 구매하기 form -->
<form action="/payment/basketOrder" method="post" id="bOrderFrm">
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
	<input type='hidden' name="blist_stockseq" id="blist_stockseq" value="">	
	<input type='hidden' name="blist_pQuantity" id="blist_pQuantity" value="">
</form>

<!-- 장바구니 페이지이동 form -->
<form action="/Rhymes/store/basket" method="get" id="moveBasketFrm"></form>



<!--------------------------------------------- ★SCRIPT ZONE★ ---------------------------------------------->	
<script>
var blist_stockseq = "";
var blist_pQuantity = "";

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

//sold out
function soldout(){
	$("#msg").html("<b><font style='font-size:35px'>SOLD OUT</font></b>")
	$(".wModal").fadeIn();
	setTimeout(function() {
		$(".wModal").fadeOut();
	},700);
}

//장바구니 영역 외 클릭시 hide
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

/* 위시리스트 클릭 */
$(document).on('click', '.wishBtn', function(){
	var p_seq = $("#hdnPseq").val();
	
	$("#msg").html("");
	
	$.ajax({
        type:"get",
        data: "p_seq=" + p_seq,
        url:"/Rhymes/store/operWishlist",
        success:function( data ){
        	if(data == "insert"){
        		$(".heartImg").attr('src', '/img/store-img/like.png');
        		$("#msg").html("<b>위시리스트에 등록되었습니다.</b>")
        		$(".wModal").fadeIn();
        		setTimeout(function() {
        			$(".wModal").fadeOut();
        		},500);
        	}else if(data == "delete"){
        		$(".heartImg").attr('src', '/img/store-img/unlike.png');
        		$("#msg").html("<b>위시리스트에서 삭제되었습니다.</b>")
        		$(".wModal").fadeIn();
        		setTimeout(function() {
        			$(".wModal").fadeOut();
        		},500);
        		
        	}
		},
        error:function(){
           alert("error!!"); 
        }
	})
		
});

// 장바구니 클릭
$(document).on('click', '.basketBtn', function(){	
	var stock_seq = Number($("input[name='sizeRadio']:checked").attr("value2"));
	
	if(isNaN(stock_seq)){
		$("#msg").html("<b>사이즈를 선택해주세요.</b>")
		$(".wModal").fadeIn();
		setTimeout(function() {
			$(".wModal").fadeOut();
		},700);
	}else{
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
	}
});

/* 미니 장바구니 리스트 */
function showBasketList(arrLen, arr){
	$(".blist").html("");
	$("#baskettitle").remove();
	var str = "";
	var str = "<div align='center' id='baskettitle'><h2>ㅋ장바구니ㅋ</h2></div>";
	for (var i = 0; i < arrLen; i++) {
		str += "<div stylesdf='margin-top:5%;' align='center' class='blist' >";
		str += "<label><img src='/upload/store/"+ arr[i].photo1_file + "' style='width:100px; height:100px;'><br>";
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

/* 장바구니 페이지 이동버튼 클릭 */
$(document).on('click', '.moveBasketBtn', function(){
	$("#moveBasketFrm").submit();	
});

/* 미니장바구니 삭제버튼 클릭 */
$(document).on('click', '._bDeleteBtn', function(){
	//alert("삭제");
	var stock_seq = $(this).val();
	//alert("재고번호 : " + stock_seq);
	/* ajax로 삭제하고 리스트 다시 뿌려야함 */
});

/* 구매버튼 클릭 */
function buying(){
	var stock_seq = Number($("input[name='sizeRadio']:checked").attr("value2"));
	//alert(stock_seq);
	
	if(isNaN(stock_seq)){
		$("#msg").html("<b>사이즈를 선택해주세요.</b>")
		$(".wModal").fadeIn();
		setTimeout(function() {
			$(".wModal").fadeOut();
		},700);
	}else{
		
		$("#stock_seq").val(Number(stock_seq));
		
		var cnt = Number($("#pqCnt").html());
		$("#p_quantity").val(Number(cnt));
		$("#orderFrm").submit();
				
		//alert(typeof $("#p_quantity").val());
		//alert(typeof $("#stock_seq").val());
	}
}

/* 구매 수량 */
$(document).on('click', '.plus_btn', function(){
var cnt = Number($("#pqCnt").html());
if(cnt<9){
	$("#pqCnt").html(cnt+1);	
}else{
	$("#msg").html("<b>최대 구매수량을 초과했습니다.</b>")
	$(".wModal").fadeIn();
	setTimeout(function() {
		$(".wModal").fadeOut();
	},900);
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