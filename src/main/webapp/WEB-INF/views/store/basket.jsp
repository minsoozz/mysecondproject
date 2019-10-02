<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="//fast.fonts.net/jsapi/eb707d8d-32aa-4fee-b1c6-595a5dc30866.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>장바구니</title>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
body{
	font: Open Sans;
	min-height: 100%;
	box-sizing: border-box;
	
}
h2 {
  font: 100 40px Open Sans;
  text-align: center;
  margin: 50px 0px 22px 0px;
}
#cntProduct_wrap{
  font: 100 15px Open Sans;
  text-align: center;
  margin: 50px 0px 50px 0px;
  margin-top: 0px;
}
#mainContainer{
 position: absolute;
  top: 380px;
  bottom: 0;
  left: 0;
  right: 0;
  height:100%;
  width: 75%;
  background: white;
  margin: auto;
  
 
}
.listTable{
 float:left;
}
.priceTable{
 float:right;
}
#product-select-all{
 font-size:14px;
 border-top: 1px solid #DADCE0;
 width:70%;
 padding-top: 20px;
 padding-bottom:20px;
 float:left; 
}
.img_wrap{
 float:left;
 height:110px;
 width:110px;
 border: 2px solid green;
}
.info_wrap{
/*  display: inline-block;
 box-sizing: border-box;
 */
  padding-left:20px;
  height:110px;
  width:500px;
  /* border:2px solid red */
  font-family:'Malgun Gothic'; 
  font-size: 13px;
  float:left;
  
}
.info2_warp{
  font-size: 13px;
  font-family:'Malgun Gothic'; 
}
.product-opt_basket{
border-top: 1px solid #DADCE0;
border-bottom: 1px solid #DADCE0;
padding-top: 15px;
padding-bottom: 15px;
width:70%;
height:115px;
float:left;
}
.pname_wrap{
font-weight: bolder;
}
a{
color:black;
}
.optionchange_wrap{
float:left;
width:160px;
height:110px;
/* border:2px solid blue; */
font-size: 14px;
}
.price_wrap{
color:orange;
font-size: 14px;
float:left;
width:110px;
height:110px;
/* border:2px solid orange; */
}
.delete_wrap{
height:110px;
/* border:2px solid black; */

}
.delete_btn{
font-size: 20px;
font-weight: bold;
padding-left:75px;
cursor:pointer;

}
.sub2Container{
position:absolute;
border:1px solid #EAEAEA;
height:auto;
width:400px;
margin-left:30px;
top:0px;
left:1000px;
float:right;
padding-bottom: 10px;

}
#sub1Container{
width:70%;
height:1000px;
border:3px solid green;
float:left;
}
.gonna-pay{
background-color: #EAEAEA;
padding-left:20px;
padding-top: 20px;
padding-bottom: 25px;
font-family: "Noto Sans KR", sans-serif;
font-weight: bold;
}
.price-Table{
font-family: "Noto Sans KR", sans-serif;
width:100%;
font-size: 14px;
}
.leftTd{
text-align: left;
padding-left: 20px;
font-family: "Noto Sans KR", sans-serif;
}
.rightTd{
text-align: right;
padding-right: 25px;
font-family: "Noto Sans KR", sans-serif;
}
.orderBtn{
margin-top:30px;
background-color: #fb5302;
font-weight: bold;
color: #fff;
width:90%;
height:40px;
display: inline-block;
text-align: center;
font-size: 15px;
padding-top: 14px;
padding-bottom: 5px;
margin-left:17px;
margin-right:8px;
cursor:pointer;
}
.orderBtn:hover{
opacity: 0.9;
}
</style>
<body>

<h2><b>장바구니</b></h2>
<div id="cntProduct_wrap"><span>${fn:length(blist) }</span>개 상품</div>

<div id="mainContainer">
<div id="product-select-all"><a href="#" style="color:black">전체삭제</a></div>
<c:forEach items="${blist }" var="ba" varStatus="vs">
	<div id=sub1Container" class="sub1_${ba.b_seq }">
		<div class="product-opt_basket">
			<div class="item-info">
				<span class="img_wrap"><img alt="사진x" src="/upload/${ba.photo1_file }" style="width:110px;height:110px;"></span>
				<div class="info_wrap">
					<div style="margin-top:8px; font-size: 15px;" class="pname_wrap"><a >뚱뚱이컴퍼니</a></div>
					<div style="margin-bottom: 7px; margin-top:3px;" class="pname_wrap"><a >${ba.p_name }</a></div>
					<div class="info2_warp">
					사이즈 : <span>${ba.size }</span><br>
					<div style="margin-top:3px;">수량 : <span>${ba.p_quantity }</span></div></div>
				</div>
				<div class="optionchange_wrap">
					<a href="#">옵션 변경</a>
				</div>
				<div class="price_wrap">
					<span>
					<%-- ${ba.p_price * ba.p_quantity} --%>
					<fmt:formatNumber type="currency" currencySymbol="" value="${ba.p_price * ba.p_quantity}" />
					</span> 원
				</div>
				<div class="delete_wrap">
					<label class="delete_btn" value="${ba.b_seq }">X</label>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
		
	<div class="sub2Container">
		<div class="proudct-checkout">
			<div class="gonna-pay"><strong>주문예정금액</strong></div>
			<table class="price-Table">
				<tr>
					<td class='leftTd' style="padding-top: 20px;">상품금액</td>
					<td class='rightTd' style="padding-top: 20px;"><span id="totalP_price">${blist[0].total_price }</span> 원</td>
				</tr>
				<tr>
					<td class='leftTd' style="padding-top: 15px;">예상 배송비</td>
					<td class='rightTd' style="padding-top: 15px;">
						<c:set value="${blist[0].total_price2 }" var="total"/>
						<c:if test="${ total lt 10000}">
							<span class="post_price" value="5000">
								<fmt:formatNumber type="currency" currencySymbol="" value="${'5000'}" />
							</span> 원
						</c:if>
						<c:if test="${ total gt 10000}">
							<span class="post_price" value="0">0</span> 원
						</c:if>
												
					</td>
				</tr>
				<tr>
					<td class='leftTd' style="padding-top: 30px; font-weight: bold; font-size: 18px;">총 결제 예정 금액</td>
					<td class='rightTd' style="padding-top: 30px; font-weight: bold; font-size: 18px;">
					<input type="hidden" id="flexTotal" value="">
					<input type="hidden" id="flexPostFee" value="">
						<c:if test="${ total lt 10000}">
							<span class="pay_price">
							<fmt:formatNumber type="currency" currencySymbol="" value="${total + 5000}" />
							</span> 원
						</c:if>
						<c:if test="${ total gt 10000}">
							<span class="pay_price">
								<fmt:formatNumber type="currency" currencySymbol="" value="${total}"/>
							</span> 원
						</c:if>
					</td>
				</tr>
				<tr><td colspan='2'><label class="orderBtn">주문하기</label></td></tr>
				
			</table>
		</div>
	</div>
	
<div>

</div>	
</div>
<script>
function numberWithCommas(x) {
    $("#_pprice").val(x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    $("#p_price").val(parseInt(x));
    //alert($("#p_price").val());
}
</script>

<script>
$(document).on('click', '.delete_btn', function(){
	var b_seq = $(this).attr("value");
	alert(b_seq);
	$.ajax({
        type:"get",
        data: "b_seq=" + b_seq,
        url:"/Rhymes/store/deleteBasket",
        success:function( data ){
            $(".sub1_" + b_seq).remove();
            alert("삭제 후 총 결제금액 : " + data);
		    /* var udtTotal = numberWithCommas(data);
		    alert("변환 총액 : " + udtTotal); */
            var postfee = $(".post_price").attr("value");
            alert("배송비 : " + postfee);
            
            if(isNaN(data)){
            	alert("장바구니 아무것도 없음");	
            }else{
            	alert("총 결제금액 : " + (data + Number(postfee)));
            	var udtPp = data + Number(postfee);
            	$("#totalP_price").html(udtPp);
            	$("#flexTotal").val(udtPp);
            	alert($("#flexTotal").val());
            	if(data<10000){
            		$(".post_price").html("5,000");
            		udtPp + 5000;
            		$(".pay_price").html(udtPp);
            		$(".post_price").attr("value", "5000");
            	}
            	$(".post_price").attr("value", "0");
            	$(".pay_price").html(udtPp);
            	
            }
            
            
            //var pp = $(".pay_price").val();
            //alert("기존 총 결제 금액 : " + pp);
            
        	//var obj = JSON.stringify(data);
			//var arr = JSON.parse(obj);
			//var arrLen = arr.length;
        },
        error:function(){
           alert("error!!"); 
        }
   })
	
});
</script>

</body>
</html>