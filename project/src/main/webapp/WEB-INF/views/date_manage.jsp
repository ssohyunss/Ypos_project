<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dongyang.project.domain.ProductVO "%>
<%@ page import="java.util.List"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Y-POS</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>

<script type='text/javascript'>
	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy/mm/dd",
			language : "kr"
		});

	});
</script>
</head>
<style>
</style>
<body>
	<form id="thisForm" name="thisForm" onsubmit="return check_onclick();"
		action="/" method="post" enctype="multipart/form-data">
		<%@include file="./include/menu.jsp"%>
		<div class="container">
			<h3>
				<b>일자별 수불현황</b>
			</h3>
			<div class="input-group date" style="width: 20%;" >

            <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>

        </div>
			<div class="row" style="margin-top: 20px">
				<table class="table table-striped" style="text-align: center">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">날짜</th>
							<th style="background-color: #eeeeee; text-align: center;">상품명</th>
							<th style="background-color: #eeeeee; text-align: center;">상품가격</th>
							<th style="background-color: #eeeeee; text-align: center;">수량</th>
							<th style="background-color: #eeeeee; text-align: center;">입고수량</th>
							<th style="background-color: #eeeeee; text-align: center;">출고수량</th>
							<th style="background-color: #eeeeee; text-align: center;">지점명</th>
						</tr>
					</thead>
					<tbody>


					</tbody>

				</table>

			</div>
		</div>
	</form>
</body>
</html>

