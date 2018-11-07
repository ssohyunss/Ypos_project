<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

	<div class="container" style="margin-top: 50px">
		<div class="row">
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">안녕하세요.</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성자</td>
						<td colspan="2" style="min-height: 200px; text-align: left;">관리자(권소현)</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td colspan="2" style="min-height: 200px; text-align: left;">2018-10-14</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left; font-size:18px">test 입니다. </td>
					</tr>
				</tbody>

			</table>

			<div style="text-align: right;">
			
				<!-- 자유게시판 글 목록 데이터 베이스 넣기 -->
				<a href="javascript:menu('NOTICE')" class="btn btn-primary" style="border: none; background-color:#56baed">목록</a>
				<!-- 작성자가 관리자 일때 수정,삭제 버튼 표시하기
				<a href="#" class="btn btn-primary" style="border: none; background-color:#56baed">수정</a>
				<a href="#" class="btn btn-primary" style="border: none; background-color:#ccc">삭제</a>-->
			</div>
		</div>
	</div>


</body>
</html>

