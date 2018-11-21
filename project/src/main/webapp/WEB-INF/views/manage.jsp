<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.ProductVO "%>
<%@ page import="java.util.List"%>
<%
	List<ProductVO> list = (List<ProductVO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<title>Y-POS</title>
</head>
<body>
	<form id="thisForm" name="thisForm" onsubmit="return false;" action="/"
		method="post" enctype="multipart/form-data">
		<%@include file="./include/menu.jsp"%>
		<div class="container">
			<h3>
				<b>매장재고현황</b>
			</h3>
			<div class="search" style="margin-top: 40px; margin-bottom: 40px" align="left" >
				<table>
				<tr>
				<td>
					<select id="manageDivide" class="form-control mx-1 mt-2" style="width:100%;">
						<option value="ALL">전체</option>
						<option value="BARCODE">상품코드</option>
						<option value="NAME">상품명</option>
					</select> 
				</td>
				
				<td colspan="3">
					<input type="text" id="searchText" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요." style="width:300px; margin-left:5px">
				</td>
				
				<td>
					<button type="submit" class="btn btn-primary mx-1 mt-2" style="border: none; background-color:#56baed; margin-left:5px" onclick="search()">조회</button>
				</td>
				
				</tr>
				</table>
			</div>

			<div class="row" style="margin-top:20px">
				<table class="table table-striped" style="text-align:center">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
							<th style="background-color: #eeeeee; text-align: center;">상품명</th>
							<th style="background-color: #eeeeee; text-align: center;">상품가격</th>
							<th style="background-color: #eeeeee; text-align: center;">수량</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (0 < list.size()) {

								for (int i = 0; i < list.size(); i++) {
									ProductVO bean = list.get(i);
						%>
						<tr>
							<td><%=bean.getBarcode()%></td>
							<td><%=bean.getName()%></td>
							<td><%=bean.getPrice()%></td>
							<td><%=bean.getCount()%></td>
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
<script>
function search(){
	$('#thisForm').attr('action', '/project/manage.do?searchText='+$('#searchText').val()+'?type='+$('#manageDivide option:selected').val());
	$('#searchText').val($('#searchText').val());
	$('#type').val($('#seamanageDividerchText').val());
	$('#thisForm')[0].submit();
}
</script>

