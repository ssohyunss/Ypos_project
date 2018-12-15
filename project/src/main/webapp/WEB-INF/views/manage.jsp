<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.ProductVO "%>
<%@ page import="java.util.List"%>
<%
	List<ProductVO> list = (List<ProductVO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>Y-POS</title>
</head>
<style>
.search {
	margin-top: 40px;
	margin-bottom: 40px;

}

@media ( max-width :767px) {
	.search {
		text-align: center;
		margin-left: 20px;
	}
}
</style>
<body>
	<form id="thisForm" name="thisForm" onsubmit="return false;" action="/"
		method="post" enctype="multipart/form-data">
		<%@include file="./include/menu.jsp"%>
	</form>
<div class="container">
			<h3>
				<b>매장재고현황</b>
			</h3>
			<div class="search" >
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
					<input type="text" id="searchText" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요." style="width:300px; margin-left:5px" onfocus="writeCode()">
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
</body>
<script>
function search(){
	$('#thisForm').attr('action', '/project/manage.do?searchText='+$('#searchText').val()+'&type='+$('#manageDivide option:selected').val());
	$('#searchText').val($('#searchText').val());
	$('#type').val($('#seamanageDividerchText').val());
	$('#thisForm')[0].submit();
}
function writeCode(){
	if (isMobile()) {
	    // 모바일이면 실행될 코드 들어가는 곳
	    if("BARCODE" == $('#manageDivide option:selected').val()){
	    	Android.writeBarCode();	
	    }
	}
}
function isMobile() {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}
function barcodeText(value){
	$('#searchText').val(value);
	$('#searchText').blur();
}
</script>
</html>

