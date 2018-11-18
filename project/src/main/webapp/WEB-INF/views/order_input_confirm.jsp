<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.OrderVO "%>
<%@ page import="java.util.List"%>
<%
	List<OrderVO> list = (List<OrderVO>) request.getAttribute("list");
%>
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

		//오늘 날짜를 출력
		$("#today").text(new Date().toLocaleDateString());

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
</script><title>Y-POS</title>
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
	<form id="thisForm" name="thisForm" onsubmit="return false;" action="/"
		method="post" enctype="multipart/form-data">

		<%@include file="./include/menu.jsp"%>

	</form>

	<div class="container">

		<h3>
			<b>입점확인</b>
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
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
						<th style="background-color: #eeeeee; text-align: center;">상품명</th>
						<th style="background-color: #eeeeee; text-align: center;">수량</th>
						<th style="background-color: #eeeeee; text-align: center;">지점명</th>
						<th style="background-color: #eeeeee; text-align: center;">내용</th>
						<th style="background-color: #eeeeee; text-align: center;">출고일</th>

					</tr>
				</thead>
				<tbody>
					<%
						if (0 < list.size()) {

							for (int i = 0; i < list.size(); i++) {
								OrderVO bean = list.get(i);
					%>
					<tr>
						<td><%=bean.getProduct_code()%></td>
						<td><%=bean.getProduct_name()%></td>
						<td><%=bean.getCount()%></td>
						<td><%=bean.getSite_name()%></td>
						<td><%=bean.getDescription()%></td>
						<td><%=bean.getOut_date()%></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>

			</table>
		</div>

	</div>

	<div class="modal fade" id="orderRegist" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">주문 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form action="#" method="post">


						<div class="form-group col-sm-12">
							<label>지점선택</label> <select name="selectstore"
								class="form-control">
								<option value="본사">본사</option>
								<option value="서울점">서울점</option>
								<option value="인천점">인천점</option>
							</select>


						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>년</label> <select name="orderYear" class="form-control">
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018" selected>2018</option>
									<option value="2019">2019</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>월</label> <select name="orderMonth" class="form-control">
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10" selected>10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>일</label> <select name="orderMonth" class="form-control">
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13" selected>13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
							</div>
						</div>

						<div class="form-group col-sm-12">
							<label>주문명</label> <input type="text" name="evaluationTime"
								class="form-control" maxlength=30">
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>상품코드</label> <input type="text" name="orderNum"
									class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-4">
								<label>색상</label> <input type="text" name="orderName"
									class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-4">
								<label>수량</label> <input type="text" name="orderName"
									class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label>내용</label>
							<textarea type="text" name="evaluationContent"
								class="form-control" maxlength=2048 style="height: 150px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary"
								style="border: none; background-color: #56baed">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>