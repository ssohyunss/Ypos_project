<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.SaleVO "%>
<%@ page import="java.util.List"%>
<%
	List<SaleVO> list = (List<SaleVO>) request.getAttribute("saleList");
%>
<!DOCTYPE html>
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
			<b>상품코드별 판매현황</b>
		</h3>

		<div style="margin-top: 40px; margin-bottom: 40px" align="left">
			<table>
				<tr>
					<td><b>상품코드</b></td>
					<td colspan="3"><input type="text" id="search"
						class="form-control mx-1 mt-2" placeholder="상품코드를 입력하세요."
						style="width: 300px; margin-left: 5px" onfocus="writeCode()"></td>

					<td><button type="button" class="btn btn-primary mx-1 mt-2"
							style="border: none; background-color: #56baed; margin-left: 5px" onclick="searchList()">조회</button></td>

				</tr>
			</table>
		</div>

		<div class="row">
			<table class="table table-striped" style="text-align: center;">
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
	if("" == $('#search').val()){
		return false;
	}
	$('#thisForm').attr('action',
	'/project/sale_pro_manage.do?code='+$('#search').val()+'');
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