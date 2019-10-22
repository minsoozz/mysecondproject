$(document).ready(function () {
	//alert("쿠폰 팝업창");
	

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
			
			if(parseInt(product_price) - parseInt(disc_point) - disc_coupon < 0){
				opener.document.getElementById("disc_point").value = "0";
				opener.document.getElementById("input_disc_point").value = "0";
				opener.document.getElementById("disc_coupon").value = disc_coupon;
				opener.document.getElementById("totalprice").value = parseInt(product_price) - disc_coupon;
				window.close();
				return;
			}

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