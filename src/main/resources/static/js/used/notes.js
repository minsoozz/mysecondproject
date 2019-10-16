$(document).ready(function() {

	$("#_send").click(function() {
//		var loginid = $("#_loginid").val();

	    popupOpen();	//Popup Open 함수
	});
})

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
