<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dongyang.project.domain.ProductVO "%>
<%@ page import="java.util.List"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Y-POS</title>

</head>
<style>
</style>
<body>
	<form id="thisForm" name="thisForm" onsubmit="return check_onclick();"
		action="/" method="post" enctype="multipart/form-data">
		<%@include file="./include/menu.jsp"%>

		<div class="container">
			<h3>
				<b>상품코드별 수불현황</b>
			</h3>

			<div class="search" style="margin-top: 40px; margin-bottom: 40px"
				align="left">
				<table>
					<tr>

						<td colspan="3"><input type="text" name="search"
							class="form-control mx-1 mt-2" placeholder="상품코드를 입력하세요."
							style="width: 300px; margin-left: 5px"></td>

						<td><button type="submit" class="btn btn-primary mx-1 mt-2"
								style="border: none; background-color: #56baed; margin-left: 5px">조회</button></td>

					</tr>
				</table>
			</div>

			<div class="row" style="margin-top: 20px">
				<table class="table table-striped" style="text-align: center">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
							<th style="background-color: #eeeeee; text-align: center;">상품명</th>
							<th style="background-color: #eeeeee; text-align: center;">상품가격</th>
							<th style="background-color: #eeeeee; text-align: center;">총수량</th>
							<th style="background-color: #eeeeee; text-align: center;">입고날짜</th>
							<th style="background-color: #eeeeee; text-align: center;">입고수량</th>
							<th style="background-color: #eeeeee; text-align: center;">출고날짜</th>
							<th style="background-color: #eeeeee; text-align: center;">출고수량</th>
							<th style="background-color: #eeeeee; text-align: center;">지점명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>iphoneX_AA128</td>
							<td>아이폰x_128GB</td>
							<td>1,100,000</td>
							<td>3</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>2018-11-02</td>
							<td>5</td>
							<td></td>
							<td></td>
							<td>본사</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>2</td>
							<td>2018-11-03</td>
							<td>인천점</td>
						</tr>
					</tbody>

				</table>

			</div>
		</div>
	</form>
</body>
</html>


<script type="text/javascript">
	function check_onclick() {
		if (thisForm.search.value == "") {
			alert("상품코드를 입력해 주세요.");
			thisForm.search.focus();
			return false;
		}

		else
			return true;
	}
</script>
