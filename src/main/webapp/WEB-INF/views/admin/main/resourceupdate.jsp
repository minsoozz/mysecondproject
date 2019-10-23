<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- security ajax -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<!-- security token, header -->
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
</script>
<script src="http://malsup.github.com/jquery.form.js"></script>

<title>Insert title here</title>
<style>
body {
	color: black;
}
#main-div {	
	padding: 30px;
	height: 4000px;
}
button{
	border: solid 1px #DADCE0;
	width: 110px;
	height:40px;
	border-radius: 5px;
	background-color: white;
	font-size: 15px;
	margin-top: 20px;	 
}
#eachresource-div {
	border: 2px solid #DADCE0;
	width: 70%;
	height: 400px auto;	
	margin-bottom: 3%;
	padding: 2%;
}
#video-div{
	border: 2px solid blue;	
	height:90%;
	margin-bottom: 20px;
}
#text-div{
	border: 1px solid;	
	height:30px;
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 15px;
}
#eachcontent-div{
	margin-left: 3%;
	margin-right: 3%;
}
#eachtitle-div{
	margin-bottom: 3%;
}
#eachcontent-div2{
	margin-left: 15%;
	margin-right: 15%;
}
#photo-div{
	border: 2px solid orange;	
	height: 90%;
	margin-bottom: 20px;
}

/* msg Modal */
.msgModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 9999; /* Sit on top */
	left: 0;
	margin:auto;
	top: 300px;
	width: 100%; /* Full width */
	height: 50%; /* Full height */
	overflow: hidden; /* Enable scroll if needed */
	/* background-color: rgb(0,0,0); Fallback color
	background-color: rgba(0,0,0,0.4); */ /* Black w/ opacity */
	/* background-color:green; */
}

/* Modal Content/Box */
.msg-content {
	color:white;
	font-weight:bold;
	font-size:30px;
	position:fixed;
    background-color: #4375DB;
    margin:3%;
    padding: 20px;
    opacity:0.7;
    border: 0px solid #888;
    width: 100%;
    height: auto;
    margin: 8% auto;
    text-align: center;
}

@import url("https://fonts.googleapis.com/css?family=Montserrat");
*, *:before, *:after {
  box-sizing: border-box;
}

fieldset {
  display: block;
  position: absolute;
  top: 14%;
  left: 21%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
}

label {
  font-family: "Montserrat", sans-serif;
  font-size: 1.2rem;
  cursor: pointer;
  display: block;
  margin: 1em;
}
label > input {
  display: none;
}
label span {
  color: #6A759B;
}
label i {
  display: inline-block;
  width: 64px;
  height: 40px;
  border-radius: 20px;
  vertical-align: middle;
  transition: .25s .09s;
  position: relative;
  background: #deeff7;
}
label i:after {
  content: " ";
  display: block;
  width: 30px;
  height: 30px;
  top: 5px;
  left: 5px;
  border-radius: 50%;
  background: #fff;
  position: absolute;
  box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.4);
  transition: .15s;
}
label > input:checked + i {
  background: #1094fb;
}
label > input:checked + i + span {
  color: #29316b;
}
label > input:checked + i:after {
  -webkit-transform: translateX(25px);
          transform: translateX(25px);
}


</style>
</head>
<body>
	<div id="main-div" style="width:;">
	
	<div align="right" style="margin-bottom: 2%; margin-right: 3%;">
		<font style="font-size: 12px;"><strong style="margin-right: 17px;">LAST CHANGE</strong><br>
		${resource.u_date }</font>
	</div>
	<div>
		<div>
				<fieldset>
					<label> <input class="cb cb1" type="checkbox" value="video"
						name="bannertype" onclick="cbChange(this)" <c:out value="${resource.mainbanner_type == 'VIDEO'? 'checked':'' }"/> /> <i></i> 
						<span>VIDEO</span>
					</label> 
					<label> <input class="cb cb2" type="checkbox" name="bannertype" value="photo"
						onclick="cbChange(this)" <c:out value="${resource.mainbanner_type == 'PHOTO'? 'checked':'' }"/> /> <i></i> 
						<span>PHOTO</span>
					</label>
				</fieldset>
			</div>
	</div>

	<div align="center">
		<!-- banner -->
		<div id="eachresource-div">
			<div id="eachtitle-div">
				<strong>MAIN BANNER</strong>
			</div>
			<div align="center">
			<form id="udtfrmbanner" method="POST" enctype="multipart/form-data" onSubmit="return false;">
				<c:if test="${resource.mainbanner_type == 'VIDEO' }">			
					<div class="previewbanner" id="previewbanner-video">
						<video src="/upload/mainresource/${resource.mainbanner_file }"
							width="80%" height="10%" loop="loop" autoplay="autoplay" 
						></video>						
					</div>
					<div class="previewbanner" id="previewbanner-photo" style="display:none;">
						<br><br><br><br><br><strong>배너 사진을 등록해주세요.</strong><br><br><br><br><br>
					</div>
				<button id="btn-banner_udt0">CHANGE</button>
				<input type="file" name="fileload" id="banner-upload0" style="display:none">	
				<button id="btn-banner_udt" style="display:none">CHANGE</button>
				<input type="file" name="fileload" id="banner-upload" style="display:none">
				</c:if>
				
				<c:if test="${resource.mainbanner_type == 'PHOTO' }">
					<div class="previewbanner" id="previewbanner-photo">
						<img src="/upload/mainresource/${resource.mainbanner_file }">
					</div>
					<div class="previewbanner" id="previewbanner-video" style="display:none; width:auto; height:auto;">
						<br><br><br><br><br>
						<strong>배너 영상을 등록해주세요.</strong>
						<br><br><br><br><br>
					</div>
					<!-- photo 2 photo -->
					<button id="btn-banner_udt">CHANGE</button>
					<input type="file" name="fileload" id="banner-upload" style="display:none">
					<!-- photo 2 video -->
					<button id="btn-banner_udt0" style="display:none">CHANGE</button>
					<input type="file" name="fileload" id="banner-upload0" style="display:none">	
				</c:if>
				<input type="hidden" name="which" value="banner">
				<input type="hidden" name="bannertype" id="_bannertype">
			</form>
			</div>
		</div>

	<!-- video1 -->		
		<div id="eachresource-div">
			<div id="eachtitle-div">
				<strong>VIDEO1</strong>
			</div>
			<div id="eachcontent-div">
			<form id="udtfrmvideo1" method="POST" enctype="multipart/form-data" onSubmit="return false;">
				<div class="previewvideo1">
					<video src="/upload/mainresource/${resource.video1_file }"
						width="80%" height="10%" loop="loop" autoplay="autoplay" 
					></video>					
				</div>
				<button id="btn-video1_udt">CHANGE</button>
				<input type="file" name="fileload" id="video1-upload" style="display:none">
				<input type="hidden" name="which" value="video1">
				<br>
			</form>
				<!-- text -->
			<form>			
				<div id="text-div">
					${resource.video1_text }
				</div>
			</form>	
			</div>
		</div>

	<!-- video2 -->		
		<div id="eachresource-div">
			<div id="eachtitle-div">
				<strong>VIDEO2</strong>
			</div>
			<div id="eachcontent-div">
			<form id="udtfrmvideo2" method="POST" enctype="multipart/form-data" onSubmit="return false;">
				<div class="previewvideo2">
					<video src="/upload/mainresource/${resource.video2_file }"
						width="80%" height="10%" loop="loop" autoplay="autoplay" 
					></video>					
				</div>
				<button id="btn-video2_udt">CHANGE</button>
				<input type="file" name="fileload" id="video2-upload" style="display:none">
				<input type="hidden" name="which" value="video2">
				<br>
			</form>
				<!-- text -->
			<form>			
				<div id="text-div">
					${resource.video2_text }
				</div>
			</form>	
			</div>
		</div>
	
	<!-- photo1 -->
		<div id="eachresource-div">
			<div id="eachtitle-div">
				<strong>PHOTO1</strong>
			</div>
			<div id="eachcontent-div2">
			<form id="udtfrmphoto1" method="POST" enctype="multipart/form-data" onSubmit="return false;">
				<div class="previewphoto1">
					<img src="/upload/mainresource/${resource.photo1_file }" alt="사진없음" style="width:600px; height:600px;">
				</div>
				<button id="btn-photo1_udt">CHANGE</button>
				<input type="file" name="fileload" id="photo1-upload" style="display:none">
				<input type="hidden" name="which" value="photo1">
			</form>				
				<!-- text -->
				<div id="text-div">
					${resource.photo1_text }
				</div>
			</div>
		</div>

	<!-- photo2 -->				
		<div id="eachresource-div">
			<div id="eachtitle-div">
				<strong>PHOTO2</strong>
			</div>
			<div id="eachcontent-div2">
			<form id="udtfrmphoto2" method="POST" enctype="multipart/form-data" onSubmit="return false;">
				<div class="previewphoto2">
					<img src="/upload/mainresource/${resource.photo2_file }" alt="사진없음" style="width:600px; height:600px;">
				</div>
				<button id="btn-photo2_udt">CHANGE</button>
				<input type="file" name="fileload" id="photo2-upload" style="display:none">
				<input type="hidden" name="which" value="photo2">
			</form>	
			
				<!-- text -->
				<div id="text-div">
					${resource.photo2_text }
				</div>
			</div>
		</div>		
			
	</div>
	
	</div>

<!-- 메시지 MODAL영역 -->
<div class="msgModal">
   <div class="msg-content">
      <span id="msg"></span>
   </div>
</div>


<script>
var bannertype = "${resource.mainbanner_type}";

var sel_file;

$(document).on('click', '#btn-banner_udt0', function(e){	
	e.preventDefault();
	$('#banner-upload0').click();
});
$(document).on('click', '#btn-banner_udt', function(e){	
	e.preventDefault();
	$('#banner-upload').click();
});
$(document).on('click', '#btn-video1_udt', function(e){	
	e.preventDefault();
	$('#video1-upload').click();
});
$(document).on('click', '#btn-video2_udt', function(e){	
	e.preventDefault();
	$('#video2-upload').click();
});
$(document).on('click', '#btn-photo1_udt', function(e){	
	e.preventDefault();
	$('#photo1-upload').click();
});
$(document).on('click', '#btn-photo2_udt', function(e){	
	e.preventDefault();
	$('#photo2-upload').click();
});

//banner preview(photo)
$(document).ready(function() {
	$("#banner-upload").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:600px;height:600px;'>";
			$("#previewbanner-photo").html("");
			$("#previewbanner-photo").append(img_html);
			$("#btn-banner_udt").remove();
			$("#previewbanner-photo").after("<button class='udt-finishbtn' id='banner-photo_fns' value='banner' value2='' value3='photo' style='background-color:blue; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}

//banner preview(video)
$(document).ready(function() {
	$("#banner-upload0").on("change", handleImgsFilesSelect1);
});

function handleImgsFilesSelect1(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
	/* 	if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		} */
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var video_html = "<video src='" + e.target.result + "' width='80%' height='10%' loop='loop' autoplay='autoplay'></video>";
			$("#previewbanner-video").html("");
			$("#previewbanner-video").append(video_html);
			$("#btn-banner_udt0").remove();
			$("#previewbanner-video").after("<button class='udt-finishbtn' id='banner-video_fns' value='banner' value2='0' value3='video' style='background-color:blue; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}

//video1 preview
$(document).ready(function() {
	$("#video1-upload").on("change", handleImgsFilesSelect2);
});
function handleImgsFilesSelect2(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		/* if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		} */
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var video_html = "<video src='" + e.target.result + "' width='80%' height='10%' loop='loop' autoplay='autoplay'></video>";
			$(".previewvideo1").html("");
			$(".previewvideo1").append(video_html);
			$("#btn-video1_udt").remove();
			$(".previewvideo1").after("<button class='udt-finishbtn' value='video1' style='background-color:blue; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}

//video2 preview
$(document).ready(function() {
	$("#video2-upload").on("change", handleImgsFilesSelect3);
});
function handleImgsFilesSelect3(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		/* if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		} */
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var video_html = "<video src='" + e.target.result + "' width='80%' height='10%' loop='loop' autoplay='autoplay'></video>";
			$(".previewvideo2").html("");
			$(".previewvideo2").append(video_html);
			$("#btn-video2_udt").remove();
			$(".previewvideo2").after("<button class='udt-finishbtn' value='video2' style='background-color:blue; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}

//photo1 preview
$(document).ready(function() {
	$("#photo1-upload").on("change", handleImgsFilesSelect4);
});

function handleImgsFilesSelect4(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:600px;height:600px;'>";
			$(".previewphoto1").html("");
			$(".previewphoto1").append(img_html);
			$("#btn-photo1_udt").remove();
			$(".previewphoto1").after("<button class='udt-finishbtn' value='photo1' style='background-color:blue; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}

//photo2 preview
$(document).ready(function() {
	$("#photo2-upload").on("change", handleImgsFilesSelect5);
});

function handleImgsFilesSelect5(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:600px;height:600px;'>";
			$(".previewphoto2").html("");
			$(".previewphoto2").append(img_html);
			$("#btn-photo2_udt").remove();
			$(".previewphoto2").after("<button class='udt-finishbtn' value='photo2' style='background-color:blue; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}







/////////////////////////////////////////////////////////////////////////////////////////////////////
/* AJAXFORM */
$(document).on('click', '.udt-finishbtn', function(){
	
	var which = $(this).val();
	var bt = $(this).attr("value2");
	var bt2 = $(this).attr("value3");
	
	  $("#udtfrm" + which).ajaxForm({
          type : 'POST',
          enctype : "multipart/form-data",
          url : "/admin/mainresource/updatefinish",
          processData : false,
          contentType : false,
          cache : false,
          beforeSend:function(xhr){
       	   xhr.setRequestHeader("${_csrf.token}", "${_csrf.headerName}");
          },
          success : function(data){
        	if(data === 'UPDATE'){
				if(which == 'banner'){
					$("#previewbanner-" + bt2).after("<button id='btn-"+ which + "_udt" + bt + "'>CHANGE</button>");
					if(bt2 === 'video'){
						$("#previewbanner-photo").html("");
						$("#previewbanner-photo").append("<br><br><br><br><br><br><strong>배너 사진을 등록해주세요.</strong><br><br><br><br><br><br>");
					}else if(bt2 === 'photo'){
						$("#previewbanner-video").html("");
						$("#previewbanner-video").append("<br><br><br><br><br><br><strong>배너 영상을 등록해주세요.</strong><br><br><br><br><br><br>");
					}
				}else{        			
					$(".preview" + which).after("<button id='btn-"+ which + "_udt'>CHANGE</button>");			
				}
				$(".udt-finishbtn").remove();
				/* $("#oPhoto"+photoNumber).attr('src', '/upload/store/'+data); */
				//메시지 모달
			     $("#msg").html("<strong>수정이 완료되었습니다.</strong>");
		      	 $(".msgModal").fadeIn();
		     	 setTimeout(function() {
		     		$(".msgModal").fadeOut();    	
		         },500);		
        	}
          },
          error : function(){
          	   alert("error!!");
          },
      });

      $("#udtfrm"+which).submit();
	
});

function cbChange(obj) {
	  var cbs = document.getElementsByClassName("cb"); 
	  for (var i = 0; i < cbs.length; i++) {
	    cbs[i].checked = true;
	  }
	  obj.checked = false;
	 
	  var typ =$("input:checkbox[name='bannertype']:checked").val()
	 // alert(b);
	 // alert(bannertype);
	 $("#_bannertype").val(typ); 
	 
	  if(bannertype === 'PHOTO'){
		  if(typ === 'video'){
			  $("#previewbanner-photo").hide();
			  $("#btn-banner_udt").hide();
			  $("#btn-banner_udt0").show();
			  $("#previewbanner-video").show();
			  $("#banner-video_fns").show();
			  $("#banner-photo_fns").hide();
		  }else if(typ == 'photo'){
			  $("#previewbanner-photo").show();
			  $("#previewbanner-video").hide();
			  $("#btn-banner_udt").show();
			  $("#btn-banner_udt0").hide();
			  $("#banner-video_fns").hide();
			  $("#banner-photo_fns").show();
		  }
	  }else if(bannertype === 'VIDEO'){
		  if(typ === 'photo'){
			  $("#previewbanner-photo").show();
			  $("#previewbanner-video").hide();
			  $("#btn-banner_udt").show();
			  $("#btn-banner_udt0").hide();
			  $("#banner-video_fns").hide();
			  $("#banner-photo_fns").show();
		  }else if(typ == 'video'){
			  $("#previewbanner-photo").hide();
			  $("#btn-banner_udt").hide();
			  $("#btn-banner_udt0").show();
			  $("#previewbanner-video").show();
			  $("#banner-video_fns").show();
			  $("#banner-photo_fns").hide();
		  }
		  
		  
		  
		  
	  }
	  
			  
}


</script>	
</body>
</html>