<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name=viewport " content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Y-POS</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto');

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
												<li><a href="#">주문등록</a></li>
												<li><a href="#">주문현황</a></li>
												<li><a href="#">반품등록</a></li>
												<li><a href="#">반품현황</a></li>
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
				<!-- /.header_bottom -->

			</div>
			<br>
			<div class="text-center"></div>
		</div>

	</form>
	
	<div class="container">
		<div class="row">
			<form method="post" action="#">
				<table class="table table-striped" style="text-align: center;">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">자유게시판 글쓰기</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="자유게시판 제목" name="freeTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="자유게시판 내용"
									name="freeContent" maxlength="2048" style="height: 350px;"></textarea></td>

						</tr>
					</tbody>

				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" style="border: none; background-color:#56baed" >
			</form>
		</div>
	</div>
	
	
</body>
</html>