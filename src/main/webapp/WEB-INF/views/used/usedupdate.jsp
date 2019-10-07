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
<h1>이미지 등록</h1>
	<div id="_img">
	
	</div>
	
	<div id="_imglist">
	</div>
	
</div>

<div id="_right">
<form action="/used/usedwriteAf" id="_wform" enctype="multipart/form-data" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="s_id" value="${login.userid }">
<table>
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
	<option value='무료나눔' <c:if test="${dto.category eq '무료나눔'}">selected="selected"</c:if>>무료나눔</option>	
</select>
</td>
</tr>

<tr>
<td><label>거래지역:</label></td>
<td><input type="text" id="sample6_address" name="place" readonly="readonly" style="background: #e5e5e5" size="30" value="${dto.place }">
&nbsp;<input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색"></td>
</tr>

<tr>
<td><label>제목:</label></td>
<td><input type="text" id="_title" name="title" size="30" value="${dto.title }"></td>
</tr>

<tr>
<td><label>가격:</label></td>
<td><input type="text" id="_price" name="price" size="30" value="${dto.price }"></td>
</tr>

<tr>
<td><label>설명:</label></td>
<td><textarea rows="10" cols="50" id="_content" name="content">${dto.content }</textarea></td>
</tr>


<tr>
<td><label>수량:</label></td>
<td><input type="number" id="_quantity" name="quantity" min="0" maxlength="2" oninput="maxLengthCheck(this)" value="${dto.quantity }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<label>수량은 최대 99개 입니다</label></td>
</tr>

<tr>
<td><label>사진:</label>
</td>
<td><button type="button" id="_add" class="add">사진 추가</button></td>
</tr>
<%
ProductsDto dto = (ProductsDto)request.getAttribute("dto");
String arr[] = dto.getPhoto_list();
%>
<c:set var="img" value="<%=arr %>"/>
<c:forEach var="i" items="${img }" varStatus="status">
<tr>
<td></td>
<td>${i }<input type="file" name="files" id="_image" class="image" value="${i }"><button type="button" id="_del">삭제</button>
</td>
</tr>
</c:forEach>
</tbody>
</table>

	<div id="_bdiv">
		<button type="button" id="_wbtn" name="wbtn">작성 완료</button>
	</div>
</form>
</div>
	<div align="right">
	</div>
</div>

<script type="text/javascript">

var sel_files = [];

var count = 0;

$(document).ready(function() {
	$("#_wbtn").click(function() {
	
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
		
		if( $("#_image").val() == "" || $("#_image").val() == null ){
			alert("사진을 등록해주세요");
			return;
		}
		
		$("#_wform").submit();
	});
	
	
   $(document).on("change", ".image", handleImgsFilesSelect);
   

   $("#_add").click(function() {
	   
	   
	   if(count >= 4){
		   alert("사진은 최대 5장까지 추가 할 수 있습니다");
		   return;
	   } 
	   else {
		   var table = document.getElementById("tb");
		   $('#mybody').append("<tr><td></td><td><input type='file' name='files' id='_image' class='image'><button type='button' id='_del' class='del'>삭제</button></td></tr>");	  
		   count++;
	   }
	   
   });

});

$(document).on("mouseover",".img", function(e) {
	$("#_img").append("<span id='preview'><img id='_preview' src='"+ $(this).attr("src") +"'/></span>");
});

$(document).on("mouseout",".img", function(e) {
	$("#preview").remove();
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

$(document).on("click",".del", function() {
	$(this).parent().remove();
	count--;
})

$("#_del").click(function() {
	if(count == 0) {
		alert("사진은 최소 1장 입니다");
	}
})


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