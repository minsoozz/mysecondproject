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
					<td>
						<input type="text" name="title" required class="inputtext">
					</td>
				</tr>
				<tr>
					<th>종류</th>
					<td>
						<select name="type" class="inputtext">
							<option value="">선택</option>
							<option value="할인이벤트">할인이벤트</option>
							<option value="적립이벤트">적립이벤트</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>쿠폰</th>
					<td>
						<button type="button" id="_coupon" class="eventBtn">쿠폰추가</button>
					</td>
				</tr>
				<tr>
					<th>시작일</th>
					<td>
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
					<td>	
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
					<th>배너파일</th>
					<td colspan="2">
						<input multiple="multiple" type="file" name="banner_file" id="fileUpload1">
					</td>
				</tr>
				<tr>
					<th>내용파일</th>	
					<td>
						<input type="file" name="content_file" id="_image2" class="image">
						<button type="button" id="_add2" class="add">사진 추가</button>
						<div id="_imglist2"></div>
					</td>
				</tr>
				
				<tr>
					<th>
						내용
					</th>
					<td>
						<textarea rows="10" cols="40" required></textarea>
					</td>
				</tr>
				<tr>
				<td colspan="2">
					<input type="submit" value="올리기" class="eventBtn">
					<input type="button" value="취소" class="eventBtn">
				</td>
				</tr>
				<tr height="100px" style="width:100%;">
			      <td style="border: 1px solid #DADCE0;" id="pZone1" colspan="2">
			      	<font size='2px'>이미지를 등록해주세요.</font>
			      </td>
			   </tr>
			</tbody>
			</table>
			
			<table class="contenttable">
			<tbody id="mybody2" style="border: 1px solid #DADCE0;">	<!-- 내용 -->
			</table>
	
			</form>
			</div>
			

		</div>
	</div>
</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->


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





<!-- 내용 file -->
<script type="text/javascript">
var sel_files = [];

var count = 0;

$(document).ready(function() {

   $(document).on("change", ".image", handleImgsFilesSelect);
   
   $("#_add2").click(function() {
	   
	   
	   if(count >= 4){
		   alert("사진은 최대 5장까지 추가 할 수 있습니다");
		   return;
	   } 
	   else {
		   var table = document.getElementById("tb");
		   $('#mybody2').append("<tr><th>내용파일</th><td><input type='file' name='photo_file' id='_image2' class='image'><button type='button' id='_del2' class='del'>삭제</button></td></tr>");	  
		   count++;
	   }
	   
   });


});

$(document).on("mouseover",".img", function(e) {
	$("#_img2").append("<span id='preview2'><img id='_preview2' src='"+ $(this).attr("src") +"'/></span>");
});

$(document).on("mouseout",".img", function(e) {
	$("#preview2").remove();
});

function handleImgsFilesSelect(e) {
   var files = e.target.files;
   var filesArr = Array.prototype.slice.call(files);

   var maxSize = 10485760;
   
   var fileSize = 0;
   
   
   filesArr.forEach(function(f) {
      if (!f.type.match("image.*")) {
         alert("확장자는 이미지 확장자만 가능합니다.");
         $("#_image2").val("");

         return;

      }
             
      sel_files.push(f);
      
      var reader = new FileReader();
      reader.onload = function(e) {

         var img_html = "<img class='img2' src=\"" + e.target.result + "\" />";
         $("#_imglist2").append(img_html);
      }
      reader.readAsDataURL(f);
   });
}

function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }

$(document).on("click",".del", function() {
	$(this).parent().remove();
	count--;
})

$("#_del2").click(function() {
	if(count == 0) {
		alert("사진은 최소 1장 입니다");
	}
})

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
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:300px;height:300px;'>";
			$("#pZone1").html("");
			$("#pZone1").append(img_html);
		}
		reader.readAsDataURL(f);
	});
}

</script>
</html>