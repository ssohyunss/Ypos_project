<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="./css/navi.css">
<c:set var="path" value="${pageContext.request.contextPath}" />
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
										<li><a href="javascript:menu('OHTER_MANAGE')">타매장
												재고현황</a></li>
										<li><a href="javascript:menu('PRODUCT_MANAGE')">상품코드별 수불현황</a></li>
										<li><a href="javascript:menu('DATE_MANAGE')">일자별 수불현황</a></li>
									</ul></li>
								<li class="dropdown"><a data-toggle="dropdown"
									class="dropdown-toggle">입/출고관리<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="javascript:menu('ORDER')">주문등록 및 현황</a></li>
										<li><a href="javascript:menu('RETURN')">반품등록 및 현황</a></li>
										<li><a href="#">입점확인</a></li>
									</ul></li>
								<li class="dropdown"><a data-toggle="dropdown"
									class="dropdown-toggle">커뮤니티<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="javascript:menu('NOTICE')">공지사항</a></li>
										<li><a href="javascript:menu('FREE')">자유게시판</a></li>
										<li><a href="#">쪽지보내기</a></li>
									</ul></li>
							</ul>

							<ul class="nav navbar-nav navbar-right">
								<li><a href="javascript:menu('LOGOUT')"> <%=(String)session.getAttribute("userName")%>&nbsp;
										<span class="glyphicon glyphicon-log-out"></span>Logout
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


<script type="text/javascript">
	function menu(cmd) {
		var path = "${pageContext.request.contextPath}";
		if ("MAIN" == cmd) {
			$('#thisForm').attr('action', path + '/main.do');
		} else if ("SALE" == cmd) {
			$('#thisForm').attr('action', path + '/sale.do');
		} else if ("MANAGE" == cmd) {
			$('#thisForm').attr('action', path + '/manage.do');
		} else if ("OHTER_MANAGE" == cmd) {
			$('#thisForm').attr('action', path + '/other_manage.do');
		} else if ("PRODUCT_MANAGE" == cmd) {
			$('#thisForm').attr('action', path + '/product_manage.do');
		} else if ("DATE_MANAGE" == cmd) {
			$('#thisForm').attr('action', path + '/date_manage.do');
		}else if ("INOUT" == cmd) {
			$('#thisForm').attr('action', path + '/inout.do');
		} else if ("COMMU" == cmd) {
			$('#thisForm').attr('action', path + '/commu.do');
		} else if ("ORDER" == cmd) {
			$('#thisForm').attr('action', path + '/order_manage_inout.do');
		} else if ("RETURN" == cmd) {
			$('#thisForm').attr('action', path + '/return_manage_inout.do');
		} else if ("NOTICE" == cmd) {
			$('#thisForm').attr('action', path + '/notice_commu.do');
		} else if ("FREE" == cmd) {
			$('#thisForm').attr('action', path + '/free_commu.do');
		} else if ("LOGOUT" == cmd) {
			$('#thisForm').attr('action', path);
		}
		$('#thisForm')[0].submit();
	}
</script>

