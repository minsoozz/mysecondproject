$(document).ready(function() {

	$("#_send").click(function() {
//		var loginid = $("#_loginid").val();

	    popupOpen();	//Popup Open 함수
	});
	
	$("#rbtn").click(function() {	// 받은 쪽지함 삭제
		var seq = $(this).val();
		var recv_id =  $("#_loginid").val();
		var send_id = $(this).attr('send_id');
		location.href="notesdelete2?recv_id="+recv_id+"&send_id="+send_id+"&seq="+seq;
		
	})
	
	$("#sbtn").click(function() {	// 보낸 쪽지함 삭제
		var seq = $(this).val();
		var send_id =  $("#_loginid").val();
		var recv_id = $(this).attr('recv_id');
		location.href="notesdelete?recv_id="+recv_id+"&send_id="+send_id+"&seq="+seq;

	})
	
	$("#_rformbtn").click(function() {	// 받은 쪽지함 검색
		
		var tapcount = 0;
	    var keyword = $("#r_keyword").val();
		var select = $("#r_select").val();

		location.href="/mypage/notes?r_keyword="+keyword+"&r_select="+select+"&tapcount="+tapcount; 
		
	});
	
	$("#_sformbtn").click(function() { // 보낸 쪽지함 검색
		
		var tapcount = 1;
	    var keyword = $("#s_keyword").val();
		var select = $("#s_select").val();
		
		location.href="/mypage/notes?s_keyword="+keyword+"&s_select="+select+"&tapcount="+tapcount; 
		
	});
	
})

function rgoPage( pageNumber ) { /* pageNumber는 현재 페이지를 뜻한다 */
	$("#_rpageNumber").val(pageNumber);
	
	$("#_rform").attr("action","/mypage/notes").submit();
}

function sgoPage( pageNumber ) { /* pageNumber는 현재 페이지를 뜻한다 */
	$("#_spageNumber").val(pageNumber);
	
	$("#_sform").attr("action","notes").submit();
}

function popupOpen(){
	var url= "noteswrite";    //팝업창 페이지 URL
	var winWidth = 500;
    var winHeight = 400;
    
    var popupX = (window.screen.width / 2) - (580 / 2);
 	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

 	var popupY= (window.screen.height / 2) - (500 / 2);
 	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
    
    
    var popupOption= "width="+winWidth+", height="+winHeight + ", left="+ popupX + ", top="+ popupY;    //팝업창 옵션(optoin)
	window.open(url,"",popupOption);
}

function notesdetail(th){
	var seq = $(th).attr('seq')  
	
	var url= "notesdetail?seq="+seq;    //팝업창 페이지 URL
	var winWidth = 500;
    var winHeight = 400;
    
    var popupX = (window.screen.width / 2) - (580 / 2);
 	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

 	var popupY= (window.screen.height / 2) - (500 / 2);
 	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
    
    
    var popupOption= "width="+winWidth+", height="+winHeight + ", left="+ popupX + ", top="+ popupY;    //팝업창 옵션(optoin)
	window.open(url,"",popupOption);
}