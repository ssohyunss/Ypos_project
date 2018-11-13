<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
			<b>판매등록</b>
		</h3>

		<a class="btn btn-primary pull-right" href="#"
			style="border: none; margin-bottom: 20px; background-color: #56baed">저장</a>

		<a class="btn btn-primary pull-right" href="#"
			style="border: none; margin-bottom: 20px; margin-right: 5px; background-color: #56baed">미출고조회</a>


		<a class="btn btn-primary pull-right" href="#"
			style="border: none; margin-bottom: 20px; margin-right: 5px; background-color: #56baed">출고조회</a>




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
					<tr>
						<td>iphoneX_AA128</td>
						<td>아이폰x_128GB</td>
						<td>8</td>
						<td>인천점</td>
						<td>주문건입니다. 입고부탁드려요.</td>
						<td>2018-10-08</td>
						<td><select name="selectstore">
								<option value="-">-</option>
								<option value="출고">출고</option>
								<option value="미출고">미출고</option>
						</select></td>
					</tr>
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