<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width ,initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Y-POS</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<form id="thisForm" name="thisForm" onsubmit="return false;" action="/"
		method="post" enctype="multipart/form-data">
		<%@include file="./include/menu.jsp"%>
	</form>

	<div class="container">
		<h3>
			<b>자유게시판</b>
		</h3>
		<div class="row">
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>서울점 노트북 재고 확인 부탁드려요.</td>
						<td>인천점(홍길동)</td>
						<td>2018-10-09</td>
					</tr>
				</tbody>

			</table>
			<a href="free_commu_wirte.jsp" class="btn btn-primary pull-right"
				style="border: none; background-color: #56baed">글쓰기 </a>
		</div>
	</div>
</body>
</html>