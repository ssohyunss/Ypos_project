<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.CommunityVO "%>
<%@ page import="java.util.List"%>
<%
	List<CommunityVO> list = (List<CommunityVO>) request.getAttribute("list");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width ,initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<title>Y-POS</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<form id="thisForm" name="thisForm" onsubmit="return false;" action="/"
		method="post" enctype="multipart/form-data">
		<%@include file="./include/menu.jsp"%>
	</form>
	<div class="container" >
		<h3>
			<b>자유게시판</b>
		</h3>
		<div class="row" style="margin-top: 40px">
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (0 < list.size()) {

							for (int i = 0; i < list.size(); i++) {
								CommunityVO bean = list.get(i);
					%>
					<tr style="cursor: pointer;" onclick="viewCommunity('<%=bean.getTid()%>')">
						<td><%=bean.getTid()%></td>
						<td><%=bean.getTitle()%></td>
						<td><%=bean.getUser_name()%></td>
						<td><%=bean.getCreate_date()%></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>

			</table>
			<a href="javascript:button('WRITE')"
				class="btn btn-primary pull-right"
				style="border: none; background-color: #56baed">글쓰기 </a>
		</div>
	</div>
</body>
<script type="text/javascript">
function button(cmd) {
	var path = "${pageContext.request.contextPath}";
	if ("WRITE" == cmd) {
		$('#thisForm').attr('action', path + '/free_write_commu.do');
	} else if ("NOTICE_VIEW" == cmd) {
		$('#thisForm').attr('action', path + '/notice_commu_view.do');
	} else if ("VIEW" == cmd) {
		$('#thisForm').attr('action', path + '/free_commu_view.do');
	}
	$('#thisForm')[0].submit();
}
function viewCommunity(tid){
	var path = "${pageContext.request.contextPath}";
	$('#thisForm').attr('action', path + '/free_commu_view.do?tid='+tid+'');
	$('#thisForm')[0].submit();
}
</script>
</html>