 <%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>content_main</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/event/eventwrite.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/member/paging.css">
</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">EVENT</h1>
	<p class="mb-4">이벤트 관리</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">이벤트 작성</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
			<div id="_left">
			<form action="/admin/event/eventwrite" id="_frm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<table border="1">
				<tr>
					<th>제목</th>
					<td colspan="5">
						<input type="text" name="title" required class="inputtext" style="width: 800px">
					</td>
				</tr>
				<tr>
					<th>종류</th>
					<td colspan="5">
						<select name="type" class="inputtext">
							<option value="기타">기타</option>
							<option value="할인이벤트">할인이벤트</option>
							<option value="적립이벤트">적립이벤트</option>
						</select>
					</td> 
				</tr>
				<tr>
					<th>쿠폰</th>
					<td colspan="5">
						<span id="input_coupon"></span>
							<input type="hidden" name="coupon_title" id="_coupon_title">
						<button type="button" id="_coupon" class="eventBtn" 
							onclick='answer_comment(this)'>쿠폰추가</button>
							<input type="hidden" name="coupon_seq" id="_seq" value="0">
					</td>
				</tr>
				<tr>
					<th>시작일</th>
					<td colspan="5">
					<select name="syear" class="inputselect">
						<c:forEach begin="${tyear }" end="${tyear+6 }" var="yyyy">
							<option <c:out value="${tyear == yyyy? 'selected=selected':'' }"/> value="${yyyy }">${yyyy }</option>
							</c:forEach>
						</select>&nbsp;년&nbsp;&nbsp;
						
						<select name="smonth" class="inputselect">
						<c:forEach begin="1" end="12" var="mm">
							<option <c:out value="${tmonth == mm? 'selected=selected':'' }"/> value="${mm }" >${mm }</option>
						</c:forEach>
						</select>&nbsp;월&nbsp;&nbsp;
						
						<select name="sday" class="inputselect">
						<c:forEach begin="1" end="${monthMax }" var="dd">
							<option <c:out value="${tday == dd? 'selected=selected':'' }"/> value="${dd }">${dd }</option>
						</c:forEach>
						</select>&nbsp;일
						
						<%-- <select name="shour" class="inputselect">
						<c:forEach begin="1" end="24" var="th">
							<option <c:out value="${thour == th? 'selected=selected':'' }"/> value="${th }">${th }</option>
						</c:forEach>
						</select>&nbsp;&nbsp;:&nbsp;&nbsp;
						<select name="sminute" class="inputselect">
						<c:forEach begin="0" end="59" var="tm">
							<option <c:out value="${tminute == tm? 'selected=selected':'' }"/> value="${tm }">${tm }</option>
						</c:forEach>
						</select> --%>
						</td>
					</tr>
					<tr>
					<th>종료일</th>
					<td colspan="5">	
					<select name="eyear" class="inputselect">
						<c:forEach begin="${tyear }" end="${tyear+6 }" var="yyyy">
							<option <c:out value="${tyear == yyyy? 'selected=selected':'' }"/> value="${yyyy }">${yyyy }</option>
							</c:forEach>
						</select>&nbsp;년&nbsp;&nbsp;
						
						<select name="emonth" class="inputselect">
						<c:forEach begin="1" end="12" var="mm">
							<option <c:out value="${tmonth == mm? 'selected=selected':'' }"/> value="${mm }" >${mm }</option>
						</c:forEach>
						</select>&nbsp;월&nbsp;&nbsp;
						
						<select name="eday" class="inputselect">
						<c:forEach begin="1" end="${monthMax }" var="dd">
							<option <c:out value="${tday == dd? 'selected=selected':'' }"/> value="${dd }">${dd }</option>
						</c:forEach>
						</select>&nbsp;일
						
						<%-- <select name="ehour" class="inputselect">
						<c:forEach begin="1" end="24" var="th">
							<option <c:out value="${thour == th? 'selected=selected':'' }"/> value="${th }">${th }</option>
						</c:forEach>
						</select>&nbsp;&nbsp;&nbsp;:&nbsp;
						<select name="eminute" class="inputselect">
						<c:forEach begin="0" end="59" var="tm">
							<option <c:out value="${tminute == tm? 'selected=selected':'' }"/> value="${tm }">${tm }</option>
						</c:forEach>
						</select> --%>
					</td>
				</tr>
				
				<tr>
					<th>
						내용
					</th>
					<td colspan="5">
						<textarea rows="10" cols="90" required></textarea>
					</td>
				</tr>
				
				<tr height="100px" style="width:100%;">
					<th>배너이미지</th>					
					<td colspan="5">
						<div id="pZone1">
							<font size='2px' id="pZone1_font">이미지를 등록해주세요.</font><br>
							<input type="file" name="bannerfile" id="fileUpload1">
						</div>
					</td>
			   </tr>
			   <tr>
					<th>상세이미지</th>					
					<td>
						<div id="cZone1">
							<input type="file" name="contentfile1" id="fileUpload2" style="width: 100%">
						</div>
					</td>
				</tr>
			
			   
			</tbody>
			</table>
			
			<br><br>
			<input type="submit" value="올리기" class="closeBtn" id="submitBtn">
			<input type="button" value="취소" class="closeBtn" id="golistBtn">
		
	
			</form>
			</div>
			
			<!-- 쿠폰정보 모달 영역-->
			<div class="restockModal">
				<div class="restockModal-content">
					<table class="modaltable" border="1">
					<tr>
						<th>쿠폰번호</th><th>쿠폰이름</th><th>쿠폰상세</th><th>기한</th><th>선택</th>
					</tr>
					<c:if test="${empty couponlist }">
						<tr>
							<td align="center" colspan="3">쿠폰리스트가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="cou" items="${couponlist }" varStatus="vs">
						<tr style="padding: 10px;" align="center">
							<td>${cou.seq }</td>
							<td style="padding: 0px 10px 0 10px;" align="center">${cou.title }</td>
							<td align="center">${cou.sub_title }</td>
							<td align="center">${cou.func_time_limit }</td>
							<td align="center">
								<input type="button" value="선택" class="eventBtn" onclick="couBtn('${cou.title }','${cou.seq }')">
								<input type="hidden" value="${cou.seq }" id="_modalseq">
							</td>
						</tr>
					</c:forEach>
					
					</table>
					
					<input type="button" class="closeBtn modalBtn" value="닫기">
					
				</div>
			</div>
			<!-- /수정페이지 모달 영역-->

		</div>
	</div>
</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->

<!-- 닫기 -->
<script type="text/javascript">
$("#golistBtn").click(function(){
	location.href="/admin/event/eventlist";
});
</script>


<!-- 쿠폰정보 modal -->
<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});


$(document).ready(function(){
	$(".restockModal").hide();	// 모달 숨기기
	$("#input_coupon").hide();	// 쿠폰<span>숨기기
});

// 모달 닫기
$(".modalBtn").click(function(){
	$(".restockModal").fadeOut();
});
$(document).on('click', '#_coupon', function(){
	$(".restockModal").fadeIn();
});

/* $(document).on('click', ".couBtn", function(){
	var coupon_title = $(this).val();
	$("#_coupon_title").val(coupon_title);
	
	var coupon_seq = $("#_modalseq").val();	// 해당 쿠폰의 seq번호를 가져옴
	$("#_seq").val(coupon_seq);				// hidden으로 seq번호 넘기기
	
	var inputcoupon = $("#input_coupon").text();
	
	// 선택한 쿠폰이 없다면
	if(inputcoupon == null || inputcoupon == ''){		
		$("#input_coupon").text(coupon_title);
	}
	else{
		var cp_html = "<span id='input_coupon2'></span>";
		$("#input_coupon2").after(cp_html);
		$("#input_coupon2").text(coupon_title);
	}
		
	$(".restockModal").fadeOut();
	$("#input_coupon").show();
	
}); */

function couBtn(coupon_title, coupon_seq){
	$("#_coupon_title").val(coupon_title);
	
	$("#_seq").val(coupon_seq);				// hidden으로 seq번호 넘기기
	
	var inputcoupon = $("#input_coupon").text();
	
	// 선택한 쿠폰이 없다면
	if(inputcoupon == null || inputcoupon == ''){		
		$("#input_coupon").text(coupon_title);
	}
	else{
		var cp_html = "<span id='input_coupon2'></span>";
		$("#input_coupon2").after(cp_html);
		$("#input_coupon2").text(coupon_title);
	}
		
	$(".restockModal").fadeOut();
	$("#input_coupon").show();
}


</script>





														<!-- file --> 





<!-- 배너  이미지 미리보기 -->
<script>
//ajax 통신을 위한 csrf 설정
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

var sel_file;
 
$(document).ready(function() {
	$("#fileUpload1").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	var form = $('#_frm')[0];
    var data = new FormData(form);
    
	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:600px;height:100px;' id='img1'>";
			$("#pZone1").html("");
			$("#pZone1").append(img_html);
 			$("#pZone1").after("<button type='button' id='pZone1_del'>삭제</button>");	
			$.ajax({
			    type : "POST",
			    enctype: 'multipart/form-data',
			    url : "/admin/event/eventwriteFile",
			    data : data,
			    cache: false,
			    processData: false,
			    contentType: false,
			    success : function(data) {
// 			        alert(data);
			        
			    },
			    err : function(err) {
			        alert(err.status);
			    }
			}); 


		}
		reader.readAsDataURL(f);
	});
}
</script>
<script type="text/javascript">
// 이미지 삭제
$(document).on("click","#pZone1_del", function() {
	$("#img1").remove();
	$("#pZone1_del").remove();
	$("#pZone1").after("<input type='file' name='content_file' id='fileUpload1'>");
	$("#pZone1_font").text("이미지를 등록해주세요.");
});  
</script>


</html>