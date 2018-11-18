<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.OrderVO "%>
<%@ page import="java.util.List"%>
<%
	List<OrderVO> list = (List<OrderVO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport " content="width=device-width ,initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Y-POS</title>
</head>
<style>
</style>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<form id="thisForm" name="thisForm" onsubmit="return false;" action="/"
		method="post" enctype="multipart/form-data">

		<%@include file="./include/menu.jsp"%>

	</form>

	<div class="container">

		<h3>
			<b>출고주문내역</b>
		</h3>

		<a class="btn btn-primary pull-right" 
			style="border: none; margin-bottom: 20px; margin-right: 5px; background-color: #56baed" onclick="selectHistory('N')">미출고조회</a>


		<a class="btn btn-primary pull-right" 
			style="border: none; margin-bottom: 20px; margin-right: 5px; background-color: #56baed" onclick="selectHistory('Y')">출고조회</a>




		<div class="row">
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
						<th style="background-color: #eeeeee; text-align: center;">상품명</th>
						<th style="background-color: #eeeeee; text-align: center;">수량</th>
						<th style="background-color: #eeeeee; text-align: center;">지점명</th>
						<th style="background-color: #eeeeee; text-align: center;">내용</th>
						<th style="background-color: #eeeeee; text-align: center;">등록일</th>
						<th style="background-color: #eeeeee; text-align: center;">출고여부</th>

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
						<td><%=bean.getCreate_date()%></td>
						<%if("" == bean.getOut_date()) {%>
						<td><select id="selectstore" onchange="saveHistory('<%=bean.getTid()%>')">
								<option value="-">-</option>
								<option value="Y">출고</option>
								<option value="N">미출고</option>
						</select></td>
						<%}else {%>
							<%if("Y".equals(bean.getOut_yn())) {%>
								<td>출고</td>
							<%}else {%>
								<td>미출고</td>	
							<%} %>
						<%} %>
						
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
function ajaxCall() {
	var req = null;
	var args = this.ajaxCall.arguments;
	// 브라우져 호환성 검사
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (req) {
		req.open('POST', args[0], true); // request open
		req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=UTF-8"); // 헤더지정
		req.send(args[1]); // 요청
		req.onreadystatechange = function() {
			if (req.readyState == 4) {
				if (req.status == 200) {
					args[2](req.responseText, args[3], args[4]);
				}
			}
		};

	} else {
		alert("request 생성 실패!!");
	}
}
function saveHistory(tid) {
	var param = "outYN=" + $('#selectstore option:selected').val() + "";
		param += "&tid="+tid+"";
	ajaxCall('/project/order_output_history_update', param,
			function(data) {
				var mapResult = JSON.parse(data);
				if ("Y" == mapResult['successYN']) {
					$('#thisForm').attr('action',
							'/project/order_output_history.do');
					$('#thisForm')[0].submit();
				} else {
					alert('실패했습니다.');
				}
			});
}
function selectHistory(value){
	$('#thisForm').attr('action',
	'/project/order_output_history.do?showValue='+value+'');
	$('#thisForm')[0].submit();
}
</script>
</html>