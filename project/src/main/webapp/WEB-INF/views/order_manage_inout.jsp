<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.OrderVO "%>
<%@ page import="com.dongyang.project.domain.ProductVO "%>
<%@ page import="java.util.List"%>
<%
	List<ProductVO> productList = (List<ProductVO>) request.getAttribute("productList");
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
			<b>주문등록 및 현황</b>
		</h3>


		<a class="btn btn-primary pull-right" data-toggle="modal"
			href="#orderRegist"
			style="border: none; margin-bottom: 20px; background-color: #56baed">주문등록하기</a>

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
						<td><%=bean.getCreate_date()%></td>
						<td><%=bean.getOut_yn()%></td>
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
					<div class="form-group col-sm-12">
						<label>주문명</label> <input type="text" id="order"
							class="form-control" maxlength="20">
					</div>
					<div class="form-group col-sm-12">
						<label>상품명</label> <select id="orderName" class="form-control"
							onchange="changeOrderName()">
							<option hidden>상품을 선택해주세요.</option>
							<%
								if (0 < productList.size()) {
									for (int i = 0; i < productList.size(); i++) {
							%>
							<option value="<%=productList.get(i).getName()%>"
								data-value="<%=productList.get(i).getBarcode()%>"><%=productList.get(i).getName()%></option>
							<%
								}
								}
							%>
						</select>
					</div>
					<div class="form-group col-sm-12">
						<label>상품코드</label> <input type="text" id="orderCode"
							class="form-control" maxlength="20" readonly="readonly">
					</div>
					<div class="form-group col-sm-12">
						<label>수량</label> <input type="text" id="orderCount"
							class="form-control" maxlength="20">
					</div>
					<div class="form-group col-sm-12">
						<label>내용</label>
						<textarea type="text" id="orderDesc" class="form-control"
							maxlength=2048 style="height: 150px;"></textarea>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button class="btn btn-primary"
							style="border: none; background-color: #56baed"
							onclick="insertOrder()">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
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
	function insertOrder() {
		var param = "orderName=" + $('#orderName').val() + "";
		param += "&orderCode=" + $('#orderCode').val() + "";
		param += "&orderCount=" + $('#orderCount').val() + "";
		param += "&orderDesc=" + $('#orderDesc').val() + "";
		param += "&order=" + $('#order').val() + "";
		ajaxCall('/project/insertOrder', param,
				function(data) {
					var mapResult = JSON.parse(data);
					if ("Y" == mapResult['successYN']) {
						$('#thisForm').attr('action',
								'/project/order_manage_inout.do');
						$('#thisForm')[0].submit();
					} else {
						alert('주문등록에 실패했습니다.');
					}
				});
	}
	function changeOrderName() {
		$('#orderCode').text('');
		$('#orderCode').val($('#orderName option:selected').attr('data-value'));
	}
</script>
</html>