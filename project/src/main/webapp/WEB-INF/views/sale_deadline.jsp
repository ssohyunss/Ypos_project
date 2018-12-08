<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.SaleVO "%>
<%@ page import="java.util.List"%>
<%
	List<SaleVO> list = (List<SaleVO>) request.getAttribute("saleList");
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
	<form id="thisForm" name="thisForm" action="/" method="post" enctype="multipart/form-data">

		<%@include file="./include/menu.jsp"%>
	</form>
<div class="container">

			<h3>
				<b>판매마감현황</b>
			</h3>


			<div style="margin-top: 40px; margin-bottom: 40px" align="left">
				<form>
					<label>날짜선택&nbsp;</label> 
					<input type="text" id="fromDate"> &nbsp;~&nbsp; 
					<input type="text" id="toDate">
					<button type="button" class="btn btn-primary mx-1 mt-2"
						style="border: none; background-color: #56baed; margin-left: 5px" onclick="searchList()">조회</button>
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
					<%
						if (0 < list.size()) {

							for (int i = 0; i < list.size(); i++) {
								SaleVO bean = list.get(i);
					%>
					<tr>
						<%if("RETURN".equals(bean.getStatus())){ %>
							<td>반품</td>	
						<%}else{ %>
							<td>판매</td>
						<%} %>
						<td><%=bean.getProduct_code()%></td>
						<td><%=bean.getProduct_name()%></td>
						<td><%=bean.getCount()%></td>
						<%if("RETURN".equals(bean.getStatus())){ %>
							<td>-<%=bean.getPrice()%></td>	
						<%}else{ %>
							<td><%=bean.getPrice()%></td>
						<%} %>
						<td><%=bean.getCreate_date()%></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>

				</table>
			</div>

		</div>	
</body>
<script type="text/javascript">
function searchList(){
	if("" == $('#fromDate').val() || "" == $('#toDate').val()){
		return false;
	}
	if($('#toDate').val() < $('#fromDate').val()){
		alert('잘못된 기간입니다.');
		return false;
	}
	$('#thisForm').attr('action',
	'/project/sale_deadline.do?date='+$('#fromDate').val()+'&date2='+$('#toDate').val()+'');
	$('#thisForm')[0].submit();
}
</script>
</html>
