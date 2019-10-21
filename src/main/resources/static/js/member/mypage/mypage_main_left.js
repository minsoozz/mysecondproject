/**
 * 
 */

var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

$(function(){
	/*좌측 네비게이션 메뉴 색 선택 기능*/
	var titles = ['주문 내역','타이틀', '찜 목록', '상품후기', '적립금', '쿠폰', '쪽지함', '내 판매목록', '교환/환불', '개인 정보 수정'];
	var urls = ['orderlog','url', 'wishlist', 'review', 'points', 'coupon', 'notes', 'myused', '#', 'personal'];
	
	var titleMap = new Map();
	for( i = 0 ; i < titles.length ; i++ ){
		titleMap.set(titles[i], urls[i]);
	}
		
	var title = $(".mypage_main_content_title h3").text();
	$.each(titles, function(index, item){
		if( title === item){
			$(".btn-group-vertical").children().eq(index).css('background-color', '#D7FD75');
		}
	});
	
	//onclick url 설정
	for( i = 0 ; i < $("#_left_title_btns").children().length; i++ ){
		var btnTitle = $("#_left_title_btn_" + i).text();
		var btnUrl = titleMap.get(btnTitle);

		$("#_left_btn_" + i).attr('onclick', "location.href='/mypage/" + btnUrl + "';");
	}
	
});
	

