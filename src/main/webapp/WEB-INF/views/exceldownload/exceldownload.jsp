<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<input type="button" value="엑셀 다운로드 " onclick="javascript:ExcelDownload();"/>
 
<script>
function ExcelDownload() {
	//alert("함수");

    location.href = "/exceldownload/exceldownloadDown";
};
</script>

</body>
</html>