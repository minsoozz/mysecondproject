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

<title>상품 수정</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/companyadmin/productmanage/productupdate.css">
<style>
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
</script>

</head>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- 상품기본정보 modal -->
	<form method="post" action="/admin/company/productupdateAf">
	<!-- ★ csrf 예방을 위한 코드추가 -->
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 	
	<input type="hidden" name="p_seq" value="${pDto.p_seq }">
	<input type="hidden" name="madeYear" id="udt-madeYear" value="${pDto.madeYear }">
	<input type="hidden" name="madeMonth" id="udt-madeMonth" value="${pDto.madeMonth }">
	<input type="hidden" name="c1_name" id="udt-c1name" value="${pDto.c1_name }">
	<input type="hidden" name="c2_name" id="udt-c2name" value="${pDto.c2_name }">
	<input type="hidden" name="c3_name" id="udt-c3name" value="${pDto.c3_name }">
	<input type="hidden" name="p_price" id="udt-pprice" value="${pDto.p_price }">
	
<!-- 	<input type="hidden" name="p_color" id="udt-pcolor">
	<input type="hidden" name="c1_name" id="udt-c2name">
	<input type="hidden" name="c1_name" id="udt-c3name"> -->
	<div class="basicinfo_modal">
		<div class="basicinfo_modal-content">
			<div align='center'>
			<table border='0' id="basicinfo_udt-table">
				<colgroup><col width="40%"><col width="60%"></colgroup>
				<tr>
					<th>상품명</th>
					<td><input type="text" value="${pDto.p_name }" name="p_name"></td>
				</tr>	
				<tr>
					<th>상품 코드</th>
					<td><input type="text" value="${pDto.cp_code }" name="cp_code"></td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td>
						<input type="text" class="upt_price" style="width:70%;" 
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
							onchange="numberWithCommas(this.value)"
							value="<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" />"
							<%-- value="<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" /> --%>">&nbsp;원
					</td>
				</tr>
				<tr>
					<th>상품 색상</th>
					<td>
						<select id="colorSelect" style="margin-top: 10px;" name="p_color">
							<option value="">-SELECTION-</option>
							<option value="BLACK" <c:out value="${pDto.p_color == 'BLACK'? 'selected':'' }"/>>BLACK</option>
							<option value="LIME" <c:out value="${pDto.p_color == 'LIME'? 'selected':'' }"/>>LIME</option>
							<option value="WHITE" <c:out value="${pDto.p_color == 'WHITE'? 'selected':'' }"/>>WHITE</option>
							<option value="OFFWHITE" <c:out value="${pDto.p_color == 'OFFWHITE'? 'selected':'' }"/>>OFFWHITE</option>
							<option value="RED" <c:out value="${pDto.p_color == 'RED'? 'selected':'' }"/>>RED</option>
							<option value="ORANGE" <c:out value="${pDto.p_color == 'ORANGE'? 'selected':'' }"/>>ORANGE</option>
							<option value="YELLOW" <c:out value="${pDto.p_color == 'YELLOW'? 'selected':'' }"/>>YELLOW</option>
							<option value="BEIGE" <c:out value="${pDto.p_color == 'BEIGE'? 'selected':'' }"/>>BEIGE</option>
							<option value="BLUE" <c:out value="${pDto.p_color == 'BLUE'? 'selected':'' }"/>>BLUE</option>
							<option value="SKYBLUE" <c:out value="${pDto.p_color == 'SKYBLUE'? 'selected':'' }"/>>SKYBLUE</option>
							<option value="GREEN" <c:out value="${pDto.p_color == 'GREEN'? 'selected':'' }"/>>GREEN</option>
							<option value="NAVY" <c:out value="${pDto.p_color == 'NAVY'? 'selected':'' }"/>>NAVY</option>
							<option value="GREY" <c:out value="${pDto.p_color == 'GREY'? 'selected':'' }"/>>GREY</option>
							<option value="PURPLE" <c:out value="${pDto.p_color == 'PURPLE'? 'selected':'' }"/>>PURPLE</option>
							<option value="PINK" <c:out value="${pDto.p_color == 'PINK'? 'selected':'' }"/>>PINK</option>
							<option value="MIX" <c:out value="${pDto.p_color == 'MIX'? 'selected':'' }"/>>MIX</option>
						</select>
					</td>
				</tr>
				<tr>
					
					<th>제조년월</th>
					<td>
						<select id="year" onchange="changeMyear(this.value)">
								<%-- <option value="${pDto.madeYear }">${pDto.madeYear }</option> --%>
								<c:set var="today" value="<%=new java.util.Date()%>" />
								<fmt:formatDate value="${today}" pattern="yyyy" var="start" />
								<c:forEach begin="0" end="10" var="idx" step="1">
									<option value="<c:out value="${start - idx}" />"
										<c:out value="${pDto.madeYear == (start - idx) ? 'selected':'' }"/>>
										<c:out value="${start - idx}" />
									</option>
								</c:forEach>
						</select>년&nbsp;
						<select id="month" onchange="changeMmonth(this.value)">
							<%for(int i=1; i < 13; i++){ %>
							<c:set var="month" value="<%=i%>" />
							<option value=<%=i %> <c:out value="${pDto.madeMonth == month? 'selected':'' }"/>><%=i%></option>
							<%} %>								
						</select>월
					</td>
				</tr>
				<tr>
					<th>1차 카테고리</th>
					<td>
						<select id="cate1" onchange="cate1Change(this.value)" >
							<option value='1' <c:out value="${pDto.c1_name == 'MEN'? 'selected':'' }"/>>MEN</option>
							<option value='2' <c:out value="${pDto.c1_name == 'WOMEN'? 'selected':'' }"/>>WOMEN</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>2차 카테고리</th>
					<td>
						<select id="cate2" onchange="cate2Change(this.value)">
						<c:forEach items="${cate2list }" var="c2" varStatus="vs">
							<option class="cate2option" id="c2nameget${c2.c2_seq }" value="${c2.c2_seq }" <c:out value="${c2.c2_name == pDto.c2_name ? 'selected':'' }"/>>${c2.c2_name }</option>	
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>3차 카테고리</th>
					<td>
						<select id="cate3" onchange="cate3Change()">
						<c:forEach items="${cate3list }" var="c3" varStatus="vs">
							<option class='cate3option' <c:out value="${c3.c3_name == pDto.c3_name ? 'selected':'' }"/>>${c3.c3_name }</option>	
						</c:forEach>
						</select>
					</td>
				</tr>
	
			</table>
			
			<div align='center'>
				<button type="submit" id="basicinfo-udtbtn">수정 등록</button>
			</div>
			
			</div>
		</div>
	</div>
	</form>
<!-- 기본정보 수정 MODAL 끝 -->	

	<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
			상품관리 >
			<a href="/admin/company/productoperlist">상품 수정/삭제</a> >
			상품 수정
			</h6>
		</div>
	
	<!-- 상품기본정보 수정 -->
	<div id="updateDiv">
		<div style="margin-bottom: 30px;"><strong>상품기본정보수정</strong></div>
		
		<div style="float:left">
			<img src="/upload/store/${pDto.photo1_file }"  style="width:200px; height:200px; border-radius: 100%; margin-left: 50px;">
		</div>
		<div style="margin-left: 330px; margin-top: 40px">
			<%-- <b>상품명</b>&nbsp;${pDto.p_name }<br>
			<b>가격</b>&nbsp;<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" /> 원 --%>
			<table id="basicinfo-table">
			<colgroup>
				<col width="160px"><col width="250px">
			</colgroup>
				<tr>
					<th>상품 번호</th>
					<td>${pDto.p_seq }</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>${pDto.p_name }</td>
				</tr>
				<tr>
					<th>상품 코드</th>
					<td>${pDto.cp_code }</td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" />원</td>
				</tr>
				<tr>
					<th>상품 색상</th>
					<td>${pDto.p_color }</td>
				</tr>
				<tr>
					<th>상품 제조년월</th>
					<td>${pDto.madeYear }년&nbsp;${pDto.madeMonth }월</td>
				</tr>
				<tr>
					<th>상품 카테고리</th>
					<td>${pDto.c1_name }&nbsp;&#47;&nbsp;${pDto.c2_name }&nbsp;&#47;&nbsp;${pDto.c3_name }</td>
				</tr>
				<tr>
					<th>상품 등록일</th>
					<td>${pDto.rdate }</td>
				</tr>
			
			</table>
			
			
		</div>
		<br><br>
		<div align="center">
			<button type="button" class="basicinfo_update-btn"><b>수정</b></button>
		</div>		
	</div>
	<!-- 상품이미지 수정 -->
	<div id="updateDiv">
		<strong>상품이미지 수정</strong>
		<div>
		
		</div>
		<button type="button"><b>수정</b></button>
	</div>
	
	<!-- 상품 상세내용 수정 -->
	<div id="updateDiv">
		<strong>상품상세내용 수정</strong>
		<div>
		
		</div>
		<button type="button"><b>수정</b></button>
	</div>

</div>
<!-- /.container-fluid -->

<!-- End of Main Content -->

<!--------------------------------- SCRIPT ZONE --------------------------------->
<script>
$(document).on('click', '.basicinfo_update-btn', function(){
	$(".basicinfo_modal").fadeIn();
});

function numberWithCommas(x) {
	
    $(".upt_price").val(x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    $("#udt-pprice").val(x);
    
}
function changeMyear(year){
	$("#udt-madeYear").val(year);	
}
function changeMmonth(month){
	$("#udt-madeMonth").val(month);	
}

function cate1Change(c1_seq){
	
	$("#udt-c2name").val('');
	$("#udt-c3name").val('');
	
	if(c1_seq == 1){
		$("#udt-c1name").val('MEN');
	}else if(c1_seq == 2){
		$("#udt-c1name").val('WOMEN');
	}
	
	$(".cate2option").remove();
	$(".cate3option").remove();
	
	$("#cate3").append("<option class='first2Cate'>2차 카테고리를 먼저</option>");
	
 	$.ajax({
        type:"get",
        data: "c1_seq=" + c1_seq,
        url:"/store/cate2List",
        success:function( data ){
            var obj = JSON.stringify(data);
			var arr = JSON.parse(obj);
			var arrLen = arr.length;
			addCate2(arr, arrLen);
        },
        error:function(){
           alert("error!!"); 
        }
    })
}

function addCate2(arr, arrLen) {
	var str ="";
	str = "";
	str = "<option class='cate2option' value=''> ~SELECTION~ </option>"; 
	for (var i = 0; i < arrLen; i++) {
		
		/* str += "<div class='c2Div'><label for='check2' style='cursor:pointer' background-color: white;' value='" + arr[i].c2_seq + "' value2='"+ arr[i].c2_name +"' class='c2sel'>";
		str += arr[i].c2_name;
		str += "</label><br></div>"; */
		
		/* <option class="cate2option" <c:out value="${c2.c2_name == pDto.c2_name ? 'selected':'' }"/>>${c2.c2_name }</option> */
		
		str += "<option class='cate2option' id='c2nameget"+arr[i].c2_seq+"' value='"+arr[i].c2_seq+"'>";
		str += arr[i].c2_name;
		str += "</option>";
	}
	$("#cate2").append(str);
}

function cate2Change(c2_seq){
	$("#udt-c3name").val('');
	var c2name = $("#c2nameget"+c2_seq).text();
	$("#udt-c2name").val(c2name);
	
	$(".cate3option").remove();
	$(".first2Cate").remove();
	
	$.ajax({
        type:"get",
        data: "c2_seq=" + c2_seq,
        url:"/store/cate3List",
        success:function( data ){
            var obj = JSON.stringify(data);
			var arr = JSON.parse(obj);
			var arrLen = arr.length;
			addCate3(arr, arrLen);
        },
        error:function(){
           alert("error!!"); 
        }
    })
	
}

function addCate3(arr, arrLen) {
	var str ="";
	str = "";
	str = "<option class='cate3option' value=''> ~SELECTION~ </option>"; 
	for (var i = 0; i < arrLen; i++) {
		
		/* str += "<div class='c2Div'><label for='check2' style='cursor:pointer' background-color: white;' value='" + arr[i].c2_seq + "' value2='"+ arr[i].c2_name +"' class='c2sel'>";
		str += arr[i].c2_name;
		str += "</label><br></div>"; */
		
		/* <option class="cate2option" <c:out value="${c2.c2_name == pDto.c2_name ? 'selected':'' }"/>>${c2.c2_name }</option> */
		
		str += "<option class='cate3option' value='"+arr[i].c3_name+"'>";
		str += arr[i].c3_name;
		str += "</option>";
	}
	$("#cate3").append(str);	
	
}

function cate3Change(){
	var c3name = $("#cate3").val();
	$("#udt-c3name").val(c3name);
}


</script>



</html>
