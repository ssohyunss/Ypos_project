<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.InOutVO "%>
<%@ page import="java.util.List"%>
<%
	List<InOutVO> list = (List<InOutVO>) request.getAttribute("list");
%>
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
				<b>일자별 수불현황</b>
			</h3>
			<div style="margin-top: 40px; margin-bottom: 40px" align="left">
				<form>
					<label>날짜선택&nbsp;</label> <input type="text" name="fromDate"
						id="fromDate">
					<button type="submit" class="btn btn-primary mx-1 mt-2"
						style="border: none; background-color: #56baed; margin-left: 5px">조회</button>
				</form>
			</div>
			<div class="row" style="margin-top: 20px">
				<table class="table table-striped" style="text-align: center">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">날짜</th>
							<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
							<th style="background-color: #eeeeee; text-align: center;">상품명</th>
							<th style="background-color: #eeeeee; text-align: center;">상품가격</th>
							<th style="background-color: #eeeeee; text-align: center;">입고수량</th>
							<th style="background-color: #eeeeee; text-align: center;">출고수량</th>
							<th style="background-color: #eeeeee; text-align: center;">지점명</th>
						</tr>
					</thead>
<tbody>
					<%
						if (0 < list.size()) {

							for (int i = 0; i < list.size(); i++) {
								InOutVO bean = list.get(i);
					%>
					<tr>
						<td><%=bean.getCreate_date()%></td>
						<td><%=bean.getProduct_code()%></td>
						<td><%=bean.getProduct_name()%></td>
						<td><%=bean.getProduct_price()%></td>
						<%if("IN".equals(bean.getStatus())) {%>
							<td><%=bean.getCount()%></td>
							<td></td>
						<%}else{ %>
							<td></td>
							<td><%=bean.getCount()%></td>
						<%} %>
						<td><%=bean.getSite_name()%></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>

				</table>

			</div>
		</div>
	</form>
</body>
</html>

