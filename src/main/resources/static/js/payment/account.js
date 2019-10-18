$(document).ready(function () {
	//alert("account.js");
	// 결제 페이지로 처음 들어갔을 때부터 총 결제예상금액을 계산해서 넣는다
	result_price();



	// 쿠폰 팝업창이 나온다
	$("#coupon_btn").click(function () {
		var product_price = $("#product_price").text();
		var delivery_price = $("#delivery_price").text();
		var disc_point = $("#disc_point").val();

		window.open("/payment_coupon?product_price="+product_price+"&delivery_price="+delivery_price+"&disc_point="+disc_point, "window팝업", "width=700, height=700, menubar=no, status=no, toolbar=no");
	});

	
	
});



//적립금
function price_change() {
	alert("적립금");
	
	var point_amount = $("#point_amount").val();
	var disc_point = $("#disc_point").val();
	var _discprice = $("#_discprice").val();
	var disc_coupon = $("#disc_coupon").val();

	// text에 값이 아예 없을 경우
	if( disc_point.trim() == "" ) {
		$("#disc_point").val( "0" );
		$("#_discprice").val( parseInt(disc_coupon) );
		result_price();
		return;
	}
	
	// 1000원부터 적립금 사용 가능
	if(disc_point.length < 4) {
		alert("1000원부터 사용 가능합니다");
		$("#disc_point").val( "0" );
		result_price();
		return;
	}
	
	var _point_amount = parseInt(point_amount);
	var _disc_point = parseInt(disc_point);
	
	// 적립금보다 text에 적은 숫자가 클 경우
	if( _point_amount < _disc_point ) {
		alert( $("#point_amount").val() + "원까지 사용가능합니다" );
		$("#disc_point").val("0");
	}
	
	$("#_discprice").val( parseInt(disc_coupon) + _disc_point);
	result_price();
}



//결제금액 계산
//총 금액 = 상품금액 + 배송비 - 할인금액
function result_price() {
	var product_price = $("#product_price").text();
	var delivery_price = $("#delivery_price").text();
	var disc_point = $("#disc_point").val();
	var disc_coupon = $("#disc_coupon").val();
	var totalprice = $("#totalprice").val();
	
	alert(product_price + ", " + delivery_price + ", " + disc_point + ", " + disc_coupon + ", " + totalprice);

	$("#totalprice").val( parseInt(product_price) + parseInt(delivery_price) - parseInt(disc_point) - parseInt(disc_coupon) );
}


