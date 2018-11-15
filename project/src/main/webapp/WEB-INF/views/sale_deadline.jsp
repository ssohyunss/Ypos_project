<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport " content="width=device-width ,initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
	$(function() {

		$.datepicker.setDefaults($.datepicker.regional['ko']);
		// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
		// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

		//시작일.
		$('#fromDate').datepicker({
			showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage : "img/calendar.png", // 버튼 이미지
			buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
			buttonText : "날짜선택", // 버튼의 대체 텍스트
			dateFormat : "yy-mm-dd", // 날짜의 형식
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			//minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
			onClose : function(selectedDate) {
				// 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#toDate").datepicker("option", "minDate", selectedDate);
			}
		});

		//종료일
		$('#toDate').datepicker({
			showOn : "both",
			buttonImage : "img/calendar.png",
			buttonImageOnly : true,
			buttonText : "날짜선택",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			//minDate: 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				$("#fromDate").datepicker("option", "maxDate", selectedDate);
			}
		});

	});
</script>
<title>Y-POS</title>
</head>
<style>
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
	width: 15px;
}

input[type=text] {
	padding: 5px 5px;
	border: 2px solid #ccc;
	border-radius: 4px;
}
</style>
<body>
	<form id="thisForm" name="thisForm" onsubmit="return check_onclick();"
		action="/" method="post" enctype="multipart/form-data">

		<%@include file="./include/menu.jsp"%>



		<div class="container">

			<h3>
				<b>판매마감현황</b>
			</h3>


			<div style="margin-top: 40px; margin-bottom: 40px" align="left">
				<form>
					<label>날짜선택&nbsp;</label> <input type="text" name="fromDate"
						id="fromDate"> &nbsp;~&nbsp; <input type="text"
						name="toDate" id="toDate">
					<button type="submit" class="btn btn-primary mx-1 mt-2"
						style="border: none; background-color: #56baed; margin-left: 5px">조회</button>
				</form>
			</div>

			<div class="row">
				<table class="table table-striped" style="text-align: center">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">분류</th>
							<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
							<th style="background-color: #eeeeee; text-align: center;">상품명</th>
							<th style="background-color: #eeeeee; text-align: center;">수량</th>
							<th style="background-color: #eeeeee; text-align: center;">금액</th>
							<th style="background-color: #eeeeee; text-align: center;">날짜</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td>판매</td>
							<td>headset_HH_SONY</td>
							<td>헤드셋_소니</td>
							<td>1</td>
							<td>130,00O</td>
							<td>2018-11-14</td>
						</tr>
						<tr>
							<td>반품</td>
							<td>headset_HH_SONY</td>
							<td>헤드셋_소니</td>
							<td>1</td>
							<td>-130,00O</td>
							<td>2018-11-14</td>
						</tr>
						<tr>
							<td>판매</td>
							<td>iphoneX_AA128</td>
							<td>아이폰x_128GB</td>
							<td>1</td>
							<td>1,100,000</td>
							<td>2018-11-15</td>
						</tr>
						<tr>
							<td>반품</td>
							<td>iphoneX_AA128</td>
							<td>아이폰x_128GB</td>
							<td>1</td>
							<td>-1,100,000</td>
							<td>2018-11-15</td>
						</tr>
					</tbody>

				</table>
			</div>

		</div>
	</form>
</body>
</html>
