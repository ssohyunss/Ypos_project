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
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>Y-POS</title>

</head>
<style>
</style>
<body>
	<form id="thisForm" name="thisForm" action="/" method="post" enctype="multipart/form-data">
		<%@include file="./include/menu.jsp"%>
	</form>
	<div class="container">
			<h3>
				<b>상품코드별 수불현황</b>
			</h3>

			<div class="search" style="margin-top: 40px; margin-bottom: 40px"
				align="left">
				<table>
					<tr>

						<td colspan="3"><input type="text" id="search"
							class="form-control mx-1 mt-2" placeholder="상품코드를 입력하세요."
							style="width: 300px; margin-left: 5px" onfocus="writeCode()"></td>

						<td><button type="submit" class="btn btn-primary mx-1 mt-2"
								style="border: none; background-color: #56baed; margin-left: 5px" onclick="searchList()">조회</button></td>

					</tr>
				</table>
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
</body>
<script type="text/javascript">
function searchList(){
	if("" == $('#search').val()){
		return false;
	}
	$('#thisForm').attr('action',
	'/project/product_manage.do?code='+$('#search').val()+'');
	$('#thisForm')[0].submit();
}
function writeCode(){
	if (isMobile()) {
	    // 모바일이면 실행될 코드 들어가는 곳
		Android.writeBarCode();
	}
}
function isMobile() {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}
function barcodeText(value){
	$('#code').val(value);
}
</script>
</html>
