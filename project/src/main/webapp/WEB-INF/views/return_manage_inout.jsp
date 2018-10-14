<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport " content="width=device-width ,initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Y-POS</title>
</head>
<style>
@import url('https://fonts.googleapis.cosm/css?family=Roboto');

a:hover, a:focus {
	text-decoration: none;
	outline: none;
}

body {
	font-family: 'Roboto', sans-serif;
}
/*
1.1 Header Area
***************************************************/
/*Bootstrap Reset*/
.navbar-nav>li>a {
	padding-top: 0;
	padding-bottom: 0;
}

.mainmenu {
	background-color: transparent;
	border-color: transparent;
	margin-bottom: 0;
	border: 0px !important;
}

.navbar-nav>li:last-child>a {
	padding-right: 0px;
	margin-right: 0px;
}

.dropdown-menu {
	padding: 0px 0;
	margin: 0 0 0;
	border: 0px solid transition !important;
	border: 0px solid rgba(0, 0, 0, .15);
	border-radius: 0px;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
}
/*=-====Main Menu=====*/
.navbar-nav .open .dropdown-menu>li>a {
	padding: 16px 15px 16px 25px;
}

.header_bottom {
	background: #56baed
}

.header_area .header_bottom .mainmenu a, .navbar-default .navbar-nav>li>a
	{
	color: #fff;
	font-size: 16px;
	text-transform: capitalize;
	padding: 16px 15px;
	font-family: 'Roboto', sans-serif;
}

.header_area .mainmenu .active a, .header_area .mainmenu .active a:focus,
	.header_area .mainmenu .active a:hover, .header_area .mainmenu li a:hover,
	.header_area .mainmenu li a:focus, .navbar-default .navbar-nav>.open>a,
	.navbar-default .navbar-nav>.open>a:focus, .navbar-default .navbar-nav>.open>a:hover
	{
	color: #fff;
	background: #54c6d4;
	outline: 0;
}
/*-----./ Main Menu-----*/
.navbar-default .navbar-toggle {
	border-color: #fff
} /*Toggle Button*/
.navbar-default .navbar-toggle .icon-bar {
	background-color: #fff
} /*Toggle Button*/

/*==========Sub Menu=v==========*/
.mainmenu .collapse ul>li:hover>a {
	background: #54c6d4;
}

.mainmenu .collapse ul ul>li:hover>a, .navbar-default .navbar-nav .open .dropdown-menu>li>a:focus,
	.navbar-default .navbar-nav .open .dropdown-menu>li>a:hover {
	background: #CBEAF0;
}

.mainmenu .collapse ul ul ul>li:hover>a {
	background: #CBEAF0;
}

.mainmenu .collapse ul ul, .mainmenu .collapse ul ul.dropdown-menu {
	background: #98D7E1;
}

.mainmenu .collapse ul ul ul, .mainmenu .collapse ul ul ul.dropdown-menu
	{
	background: #0a1464
}

.mainmenu .collapse ul ul ul ul, .mainmenu .collapse ul ul ul ul.dropdown-menu
	{
	background: #e4eeb8
}

/******************************Drop-down menu work on hover**********************************/
.mainmenu {
	background: none;
	border: 0 solid;
	margin: 0;
	padding: 0;
	min-height: 20px
}

@media only screen and (min-width: 767px) {
	.mainmenu .collapse ul li {
		position: relative;
	}
	.mainmenu .collapse ul li:hover>ul {
		display: block
	}
	.mainmenu .collapse ul ul {
		position: absolute;
		top: 100%;
		left: 0;
		min-width: 250px;
		display: none
	}
	/*******/
	.mainmenu .collapse ul ul li {
		position: relative
	}
	.mainmenu .collapse ul ul li:hover>ul {
		display: block
	}
	.mainmenu .collapse ul ul ul {
		position: absolute;
		top: 0;
		left: 100%;
		min-width: 250px;
		display: none
	}
	/*******/
	.mainmenu .collapse ul ul ul li {
		position: relative
	}
	.mainmenu .collapse ul ul ul li:hover ul {
		display: block
	}
	.mainmenu .collapse ul ul ul ul {
		position: absolute;
		top: 0;
		left: -100%;
		min-width: 250px;
		display: none;
		z-index: 1
	}
}
</style>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<form id="thisForm" name="thisForm" onsubmit="return false;" action="/"
		method="post" enctype="multipart/form-data">
		<div class="text-center">
			<div id="header-area" class="header_area">
				<div class="header_bottom">
					<div class="container">
						<div class="row">
							<nav role="navigation" class="navbar navbar-default mainmenu">
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" data-target="#navbarCollapse"
										data-toggle="collapse" class="navbar-toggle">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
								</div>
								<!-- Collection of nav links and other content for toggling -->
								<div id="navbarCollapse" class="collapse navbar-collapse">
									<ul id="fresponsive" class="nav navbar-nav dropdown">
										<li class="active"><a href="javascript:menu('MAIN')">Y-POS</a></li>
										<li class="dropdown"><a data-toggle="dropdown"
											class="dropdown-toggle">판매관리<span class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a href="#">판매등록</a></li>
												<li><a href="#">판매마감현황</a></li>
												<li><a href="#">품번별 판매현황</a></li>
												<li><a href="#">월별추이그래프</a></li>
											</ul></li>
										<li class="dropdown"><a data-toggle="dropdown"
											class="dropdown-toggle">재고관리<span class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a href="javascript:menu('MANAGE')">매장재고현황</a></li>
												<li><a href="#">타매장 재고현황</a></li>
												<li><a href="#">품번별 수불현황</a></li>
												<li><a href="#">일자별 수불현황</a></li>
											</ul></li>
										<li class="dropdown"><a data-toggle="dropdown"
											class="dropdown-toggle">입/출고관리<span class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a href="#">주문등록 및 현황</a></li>
												<li><a href="#">반품등록 및 현황</a></li>
												<li><a href="#">입점확인</a></li>
											</ul></li>
										<li class="dropdown"><a data-toggle="dropdown"
											class="dropdown-toggle">커뮤니티<span class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a href="#">공지사항</a></li>
												<li><a href="#">자유게시판</a></li>
												<li><a href="#">쪽지보내기</a></li>
											</ul></li>
									</ul>
									<ul class="nav navbar-nav navbar-right">
										<li><a href="#"> <%=session.getAttribute("name")%> <span
												class="glyphicon glyphicon-log-out"></span>Logout
										</a></li>
									</ul>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="text-center"></div>
		</div>

	</form>

	<div class="container">

		<h3>
			<b>반품등록 및 현황</b>
		</h3>
		<a class="btn btn-primary pull-right" data-toggle="modal" href="#retrunRegist" style="border: none; margin-bottom:20px; background-color: red">반품등록하기</a>
			
			<div class="row">
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">반품명</th>
						<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
						<th style="background-color: #eeeeee; text-align: center;">상품명</th>
						<th style="background-color: #eeeeee; text-align: center;">색상</th>
						<th style="background-color: #eeeeee; text-align: center;">수량</th>
						<th style="background-color: #eeeeee; text-align: center;">내용</th>
						<th style="background-color: #eeeeee; text-align: center;">등록일</th>
						<th style="background-color: #eeeeee; text-align: center;">반품여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>아이폰8취소</td>
						<td>iphone8_AA128</td>
						<td>아이폰8_256GB</td>
						<td>BK(블랙)</td>
						<td>2</td>
						<td>단순변심</td>
						<td>2018-09-22</td>
						<td>X</td>
					</tr>
					<tr>
						<td>마우스 취소</td>
						<td>mouse_razer</td>
						<td>마우스_레이저</td>
						<td>BK(블랙)</td>
						<td>10</td>
						<td>로지텍으로 교체</td>
						<td>2018-10-11</td>
						<td>X<td>
					</tr>
				</tbody>

			</table>
		</div>
		
	</div>
	
	

	<div class="modal fade" id="retrunRegist" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">반품 등록</h5>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form action="#" method="post">
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
							<label>반품명</label> <input type="text" name="evaluationTime"
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
								class="form-control" maxlength=2048 " style="height: 150px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary" style="border: none; background-color: red">등록</button>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>



</body>
</html>