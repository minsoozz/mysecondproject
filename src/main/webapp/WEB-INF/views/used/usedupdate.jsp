<%@page import="com.rhymes.app.used.model.ProductsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/used/write.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<div id="_main">

<div id="_left">
	<div id="_img">
	
	</div>
	
	<div id="_imglist">
	</div>
	
</div>

<div id="_right">
<form action="/used/usedupdateAf" id="_wform" enctype="multipart/form-data" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="s_id" value="${dto.s_id }">
<input type="hidden" name="division" value="${dto.division }">
<input type="hidden" name="rdate" value="${dto.rdate }">

<table style="margin:20px 20px 20px 20px">
<col width="20%">
<col width="80%">
<tbody id="mybody">
<tr>
<td><label>카테고리:</label></td>
<td><select id="_category" name="category">
	<option value="">카테고리를 선택해주세요</option>
	<option value='남성의류' <c:if test="${dto.category eq '남성의류'}">selected="selected"</c:if>>남성의류</option>
	<option value='여성의류' <c:if test="${dto.category eq '여성의류'}">selected="selected"</c:if>>여성의류</option>
	<option value='패션잡화' <c:if test="${dto.category eq '패션잡화'}">selected="selected"</c:if>>패션잡화</option>
	<option value='뷰티/미용' <c:if test="${dto.category eq '뷰티/미용'}">selected="selected"</c:if>>뷰티/미용</option>
</select>
</td>
</tr>

<tr>
<td><label>거래지역:</label></td>
<td><input type="text" id="sample6_address" name="place" readonly="readonly" style="background: #e5e5e5" size="30" value="${dto.place }">
&nbsp;<input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색" class="rhybtn"></td>
</tr>
<tr>
<td><label>제목:</label></td>
<td><input type="text" id="_title" name="title" size="30" value="${dto.title }">
	<input type="hidden" name="seq" value="${dto.seq }">
	</td>

</tr>

<tr>
<td><label>가격:</label></td>
<td><input type="text" id="_price" name="price" size="30" value="${dto.price }"></td>
</tr>

<tr>
<td><label>설명:</label></td>
<td><textarea rows="10" cols="50" id="_content" name="content"  style="resize: none;">${dto.content }</textarea></td>
</tr>


<tr>
<td><label>수량:</label></td>
<td><input type="number" id="_quantity" name="quantity" min="0" maxlength="2" oninput="maxLengthCheck(this)" value="${dto.quantity }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<label>수량은 최대 99개 입니다</label></td>
</tr>

<tr>
<td><label>사진:</label>
</td>
<td>
<input type="file" multiple="multiple" name="files" id="_image" class="image" onchange="check()" onclick="check()" >
</td>
</tr>
<tr>
<td colspan="2">
<br>
기존 사진 수정은 왼쪽의 썸네일을 클릭하면 삭제됩니다.
</tr>
<%
ProductsDto dto = (ProductsDto)request.getAttribute("dto");
String arr[] = dto.getPhoto_list();
String arr2[] = dto.getPhoto_originlist();

int arrSize = arr.length;
%>
<c:set var="img" value="<%=arr2 %>"/>
<c:forEach var="i" items="${img }" varStatus="status">
<tr>
<td>
<%-- <input type="hidden" name="originfile" value="${i }" id="originfile"> --%>
<input type="hidden" name="originfile" value="" id="originfile">
</td>
</tr>
</c:forEach>
</tbody>
</table>
	<div id="_bdiv">
	&nbsp;&nbsp;<button type="button" id="_wbtn" name="wbtn" class="rhybtn">작성 완료</button>
	</div>
</form>
</div>
	<div align="right">
	</div>
</div>

<script type="text/javascript">

var sel_files = [];

var list = [];	

<%-- var len = <%=arrSize%>; --%>
<%-- var originfile = new Array();

<%for(int i =0; i < arr.length; i++){%>
	originfile.push("<%=arr[i]%>")
	<%
}
%>
 --%>
function check() {
	$(".img").remove();
 	var ck = $('.ogimg').length;
	
	var x = document.getElementById("_image");
	var txt = "";
	if ('files' in x) {
		if (x.files.length + ck > 5) {
			alert("파일 개수가 초과되었습니다.");
			document.getElementById("_image").value = "";
			$(".img").remove();
			return;
		}
	}

	if ($("#_image").val() == "" || $("#_image").val() == null) {

		$(".img").remove();
	} 
}

$(document).ready(function() {
<%for(int i =0; i < arr.length; i++){%>
	
    var img_html = "<img class='ogimg' src=/upload/used/" + '<%=arr[i]%>' + "\ />";
    $("#_imglist").append(img_html);
	
	<%
}
%>
$(document).on("click", "#_wbtn", function(e){

	var aa = $('.ogimg').length;
	
	 for(i=0;i<aa;i++){
		var tt = $(".ogimg").eq(i).attr('src');	// 원본 이미지 목록들..
		var result = tt.substring(tt.lastIndexOf("/")+1);
		
		list.push(result);
	 }
	
		if( $("#_category").val() == "" || $("#_category").val() == null ){
			alert("카테고리를 선택해주세요");
			return;
		} 
		
		if( $("#sample6_address").val() == "" || $("#sample6_address").val() == null ){
			alert("지역을 선택해주세요");
			return;
		}
		
		if( $("#_title").val() == "" || $("#_title").val() == null ){
			alert("제목을 입력해주세요");
			return;
		}
		
		if( $("#_price").val() == "" || $("#_price").val() == null ){
			alert("가격을 입력해주세요");
			return;
		}
		
		if( $("#_content").val() == "" || $("#_content").val() == null ){
			alert("설명을 입력해주세요");
			return;
		}
		
		if( $("#_quantity").val() == "" || $("#_quantity").val() == null ){
			alert("수량을 입력해주세요");
			return;
		}
		
		$("#originfile").val(list);
		 $("#_wform").submit(); 
	});
	
	
   $(document).on("change", ".image", handleImgsFilesSelect);

});

/* $(document).on("change", ".image", function(e){
	
	var check = $(this).val();
	
	if(check == "" || null) {
		alert("파일 선택하지 않으면 업로드 되지않습니다.");
		return;
	}
}); */
	
$(document).on("mouseover",".img", function(e) {
	$("#_img").append("<span id='preview'><img id='_preview' src='"+ $(this).attr("src") +"'/></span>");
});

$(document).on("mouseout",".img", function(e) {
	$("#preview").remove();
});

$(document).on("mouseover",".ogimg", function(e) {
	$("#_img").append("<span id='preview'><img id='_preview' src='"+ $(this).attr("src") +"'/></span>");
});

$(document).on("mouseout",".ogimg", function(e) {
	$("#preview").remove();
});

$(document).on("click",".ogimg", function(e) {
	$("#preview").remove();
	$(this).remove();
	
});

function handleImgsFilesSelect(e) {
   var files = e.target.files;
   var filesArr = Array.prototype.slice.call(files);

   var maxSize = 10485760;
   
   var fileSize = 0;
   
   
   filesArr.forEach(function(f) {
      if (!f.type.match("image.*")) {
         alert("확장자는 이미지 확장자만 가능합니다.");
         $("#_image").val("");

         return;

      }
             
      sel_files.push(f);
      
      var reader = new FileReader();
      reader.onload = function(e) {

         var img_html = "<img class='img' src=\"" + e.target.result + "\" />";
         $("#_imglist").append(img_html);
      }
      reader.readAsDataURL(f);
   });
}

function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }

</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                 
                } else {
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
            
            }
        }).open();
    }
</script>  
</body>
</html>