<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="include/header.jsp"%>
<script>
	function doF() {
		//비동기적인 방식으로 처리 (백그라운드에서 실행됨)
		$.ajax({
			type : "post",
			url : "${path}/test/doF",
			success : function(result) {
				console.log(result);
				$("#result")
						.html("상품명:" + result.name + ", 가격:" + result.price);
			}
		});
	}
</script>
</head>
<body>
	<%@include file="include/menu.jsp"%>

	<h2>링크 테스트</h2>
	<a href="${path}/test/doA">doA</a>
	<br>
	<a href="${path}/test/doB">doB</a>
	<br>
	<a href="${path}/test/doC">doC</a>
	<br>
	<a href="${path}/test/doD">doD</a>
	<br>
	<a href="#" onclick="doF()">doF</a>
	<br>

	<div id="result"></div>
</body>
</html>