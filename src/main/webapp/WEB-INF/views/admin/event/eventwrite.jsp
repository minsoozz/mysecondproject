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
			<form action="/admin/event/eventwrite" method="POST" enctype="multipart/form-data" name="inputtxt" onsubmit="return checkIt()">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<table border="1">
				<tr>
					<th>제목</th>
					<td colspan="5">
						<input type="text" name="title" required class="inputtext">
					</td>
				</tr>
				<tr>
					<th>종류</th>
					<td colspan="5">
						<select name="type" class="inputtext">
							<option value="">선택</option>
							<option value="할인이벤트">할인이벤트</option>
							<option value="적립이벤트">적립이벤트</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>쿠폰</th>
					<td colspan="5">
						<span id="input_coupon"></span>
						<button type="button" id="_coupon" class="eventBtn">쿠폰추가</button>
					</td>
				</tr>
				<tr>
					<th>시작일</th>
					<td colspan="5">
					<select name="syear" class="inputselect">
						<c:forEach begin="${tyear }" end="${tyear+6 }" var="yyyy">
							<option <c:out value="${tyear == yyyy? 'selected=selected':'' }"/> value="${yyyy }">${yyyy }</option>
							</c:forEach>
						</select>년
						
						<select name="smonth" class="inputselect">
						<c:forEach begin="1" end="12" var="mm">
							<option <c:out value="${tmonth == mm? 'selected=selected':'' }"/> value="${mm }" >${mm }</option>
						</c:forEach>
						</select>월
						
						<select name="sday" class="inputselect">
						<c:forEach begin="1" end="${monthMax }" var="dd">
							<option <c:out value="${tday == dd? 'selected=selected':'' }"/> value="${dd }">${dd }</option>
						</c:forEach>
						</select>일&nbsp;&nbsp;&nbsp;&nbsp;
						
						<select name="shour" class="inputselect">
						<c:forEach begin="1" end="24" var="th">
							<option <c:out value="${thour == th? 'selected=selected':'' }"/> value="${th }">${th }</option>
						</c:forEach>
						</select>:
						<select name="sminute" class="inputselect">
						<c:forEach begin="0" end="59" var="tm">
							<option <c:out value="${tminute == tm? 'selected=selected':'' }"/> value="${tm }">${tm }</option>
						</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
					<th>종료일</th>
					<td colspan="5">	
					<select name="eyear" class="inputselect">
						<c:forEach begin="${tyear }" end="${tyear+6 }" var="yyyy">
							<option <c:out value="${tyear == yyyy? 'selected=selected':'' }"/> value="${yyyy }">${yyyy }</option>
							</c:forEach>
						</select>년
						
						<select name="emonth" class="inputselect">
						<c:forEach begin="1" end="12" var="mm">
							<option <c:out value="${tmonth == mm? 'selected=selected':'' }"/> value="${mm }" >${mm }</option>
						</c:forEach>
						</select>월
						
						<select name="eday" class="inputselect">
						<c:forEach begin="1" end="${monthMax }" var="dd">
							<option <c:out value="${tday == dd? 'selected=selected':'' }"/> value="${dd }">${dd }</option>
						</c:forEach>
						</select>일&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="ehour" class="inputselect">
						<c:forEach begin="1" end="24" var="th">
							<option <c:out value="${thour == th? 'selected=selected':'' }"/> value="${th }">${th }</option>
						</c:forEach>
						</select>:
						<select name="eminute" class="inputselect">
						<c:forEach begin="0" end="59" var="tm">
							<option <c:out value="${tminute == tm? 'selected=selected':'' }"/> value="${tm }">${tm }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>
						내용
					</th>
					<td colspan="5">
						<textarea rows="10" cols="40" required></textarea>
					</td>
				</tr>
				
				<tr height="100px" style="width:100%;">
					<th>배너이미지</th>					
					<td colspan="5">
						<div id="pZone1">
							<font size='2px'>이미지를 등록해주세요.</font><br>
							<input type="file" name="banner_file" id="fileUpload1">
						</div>
					</td>
			   </tr>
			   
			   <tr height="200px" style="width:100%;">
					<th>상세이미지</th>					
					<td>
						<div id="cZone1">
							<font size='2px'>이미지를 등록해주세요.</font><br>
							<input type="file" name="content_file" id="fileUpload2">
						</div>
					</td>
					<td>
						<div id="cZone2">
							<font size='2px'>이미지를 등록해주세요.</font><br>
							<input type="file" name="content_file" id="fileUpload3">						
						</div>
					</td>
					<td>
						<div id="cZone3">
							<font size='2px'>이미지를 등록해주세요.</font><br>
							<input type="file" name="content_file" id="fileUpload4">
						</div>
					</td>
					<td>
						<div id="cZone4">
							<font size='2px'>이미지를 등록해주세요.</font><br>
							<input type="file" name="content_file" id="fileUpload5">
						</div>
					</td>
					<td>
						<div id="cZone5">
							<font size='2px' id="cZone5_font">이미지를 등록해주세요.</font><br>
							<input type="file" name="content_file" id="fileUpload6">
						</div>
					</td>
			   </tr>
			   
			</tbody>
			</table>
			
			<br><br>
			<input type="submit" value="올리기" class="eventBtn">
			<input type="button" value="취소" class="eventBtn">
		
	
			</form>
			</div>
			
			<!-- 쿠폰정보 모달 영역-->
			<div class="restockModal">
				<div class="restockModal-content">
					<table>
					<c:if test="${empty couponlist }">
						<tr>
							<td align="center" colspan="3">쿠폰리스트가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="cou" items="${couponlist }" varStatus="vs">
						<tr>
						<th>${cou.title }</th>
						<td>${cou.sub_title }</td>
						<td>${cou.func_time_limit }</td>
						<td>
							<button type="button" value="${cou.title }" class="eventBtn couBtn">선택</button>
							<input type="hidden" value="${cou.seq }" name="seq">
						</td>
						</tr>
					</c:forEach>
					
					</table>
					
					<input type="button" class="closeBtn" value="닫기">
					
				</div>
			</div>
			<!-- /수정페이지 모달 영역-->

		</div>
	</div>
</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->

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
$(".closeBtn").click(function(){
	$(".restockModal").fadeOut();
});
$(document).on('click', '#_coupon', function(){
	$(".restockModal").fadeIn();
});

$(document).on('click', ".couBtn", function(){
	var coupon_title = $(this).val();
	$("#input_coupon").text(coupon_title);
	$(".restockModal").fadeOut();
	$("#input_coupon").show();
});
</script>


<script type="text/javascript">
function checkIt() {
	var inputtxt = eval("document.inputtxt");
	if(inputtxt.type.value == "") {
		alert("종류를 선택하세요");
		return false;
	}
}
</script>


<script type="text/javascript">
	function goPage(pageNumber) {

		$("#_pageNumber").val(pageNumber); // 들어오는 값을 가져옴 
		$("#_frm").attr("action", "memlist").submit(); //

	}

	$("#_btnSearch").click(function() {
		//alert("클릭");
		$("#_frm").attr("action", "memlist").submit(); 

	});
</script>

<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

	function allchecks(e) {
		// 모두 체크
		var arr = document.getElementsByName("checkid");
// 		alert(arr.length);
		for (i = 0; i < arr.length; i++) {
			arr[i].checked = e;
			
		}
		
	}
	
	
	// 회원 정지
	$("#eventwrite").click(function() {
	  	$("#_frm").attr("action", "/admin/event/write").submit(); 

	});
	
	// 리스트 갯수 뿌리기
	function dataTable_length() {
		$("#_frm").attr("action", "memlist").submit();
	}
	
	// 마우스 커서
	$(document).ready(function() {
		$('.list_userid').mouseover(function() {
			$(this).css("cursor", "pointer");
		});
	});

	// sorting
	$(function() {
		$(".sorting").click(function() {
			var thNum = $(this).index();

			if (thNum == 1) {
				$("#_sorting").val("ID");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 2) {
				$("#_sorting").val("NAME");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 3) {
				$("#_sorting").val("ADDRESS");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 4) {
				$("#_sorting").val("EMAIL");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 5) {
				$("#_sorting").val("PHONE");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 6) {
				$("#_sorting").val("SOCIAL");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 7) {
				$("#_sorting").val("RDATE");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 8) {
				$("#_sorting").val("isAccountNonLocked");
				$("#_frm").attr("action", "memlist").submit();
			}

		});
	});
	

</script>


														<!-- file --> 
 <!-- 이미지 미리보기/ 삭제 -->
 <script type="text/javascript">
var sel_file;
 
<!-- 배너  이미지 미리보기 -->
$(document).ready(function() {
	$("#fileUpload1").on("change", handleImgsFilesSelect1);
});

function handleImgsFilesSelect1(e) {
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
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:600px;height:100px;'>";
			$("#pZone1").html("");
			$("#pZone1").append(img_html);
			$("#pZone1").after("<button type='button' class='del'>삭제</button>");
		}
		reader.readAsDataURL(f);
	});
}

<!-- 상세1 이미지 미리보기 -->
$(document).ready(function() {
	$("#fileUpload2").on("change", handleImgsFilesSelect2);
});

function handleImgsFilesSelect2(e) {
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
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:155px;height:200px;'>";
			$("#cZone1").html("");
			$("#cZone1").append(img_html);
			$("#cZone1").after("<button type='button' class='del'>삭제</button>");
		}
		reader.readAsDataURL(f);
	});
}

<!-- 상세2 이미지 미리보기 -->
$(document).ready(function() {
	$("#fileUpload3").on("change", handleImgsFilesSelect3);
});

function handleImgsFilesSelect3(e) {
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
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:155px;height:200px;'>";
			$("#cZone2").html("");
			$("#cZone2").append(img_html);
			$("#cZone2").after("<button type='button' class='del'>삭제</button>");
		}
		reader.readAsDataURL(f);
	});
}

<!-- 상세3 이미지 미리보기 -->
$(document).ready(function() {
	$("#fileUpload4").on("change", handleImgsFilesSelect4);
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
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:155px;height:200px;'>";
			$("#cZone3").html("");
			$("#cZone3").append(img_html);
			$("#cZone3").after("<button type='button' class='del'>삭제</button>");
		}
		reader.readAsDataURL(f);
	});
}

<!-- 상세4 이미지 미리보기 -->
$(document).ready(function() {
	$("#fileUpload5").on("change", handleImgsFilesSelect5);
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
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:155px;height:200px;'>";
			$("#cZone4").html("");
			$("#cZone4").append(img_html);
			$("#cZone4").after("<button type='button' class='del'>삭제</button>");
		}
		reader.readAsDataURL(f);
	});
}

<!-- 상세5 이미지 미리보기 -->
$(document).ready(function() {
	$("#fileUpload6").on("change", handleImgsFilesSelect6);
});

function handleImgsFilesSelect6(e) {
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
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:155px;height:200px;' id='img5'>";
			$("#cZone5").html("");
			$("#cZone5").append(img_html);
			$("#cZone5").after("<button type='button' id='cZone5_del'>삭제</button>");
		}
		reader.readAsDataURL(f);
	});
}
// 이미지 삭제
$(document).on("click","#cZone5_del", function() {
	$("#img5").remove();
	$("#cZone5_del").remove();
	$("#cZone5").after("<input type='file' name='content_file' id='fileUpload6'>");
	$("#cZone5_font").text("이미지를 등록해주세요.");
});


</script>
</html>