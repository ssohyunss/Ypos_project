<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.CommunityVO "%>
<%
	CommunityVO bean = (CommunityVO) request.getAttribute("bean");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<title>Y-POS</title>
</head>
<body>
	<form id="thisForm" name="thisForm" onsubmit="return false;" action="/"
		method="post" enctype="multipart/form-data">
		<%@include file="./include/menu.jsp"%>
	</form>
	<div class="container" style="margin-top: 40px">
		<div class="row">
			<form method="post" action="#">
			<%if("" != bean.getTid()) {%>
				<table class="table table-striped" style="text-align: center;">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">글 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<input type="text" class="form-control" id="title" maxlength="50" value="<%=bean.getTitle()%>">
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="form-control" id="contents" maxlength="2048" style="height: 350px;"><%=bean.getContents()%></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="button" class="btn btn-primary pull-right" value="수정" style="border: none; background-color:#56baed" onClick="modifyCommu('<%=bean.getTid()%>')">			
			<%}else{ %>
				<table class="table table-striped" style="text-align: center;">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">자유게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<input type="text" class="form-control" placeholder="자유게시판 제목" id="title" maxlength="50">
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="form-control" placeholder="자유게시판 내용" id="contents" maxlength="2048" style="height: 350px;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="button" class="btn btn-primary pull-right" value="등록" style="border: none; background-color:#56baed" onClick="insertCommu()">
			<%} %>
				<input type="button" class="btn btn-primary pull-right" value="취소" style="border: none; margin-right:10px; background-color:#ccc"  onClick="javascript:menu('FREE')" >
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
function ajaxCall() {
	var req = null;
	var args = this.ajaxCall.arguments;
	// 브라우져 호환성 검사
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (req) {
		req.open('POST', args[0], true); // request open
		req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=UTF-8"); // 헤더지정
		req.send(args[1]); // 요청
		req.onreadystatechange = function() {
			if (req.readyState == 4) {
				if (req.status == 200) {
					args[2](req.responseText, args[3], args[4]);
				}
			}
		};

	} else {
		alert("request 생성 실패!!");
	}
}
function insertCommu(){
	var param = "title="+$('#title').val()+"";
	param += "&contents="+$('#contents').val()+"";
ajaxCall('/project/insertCommunity',param , function(data){
	var mapResult = JSON.parse(data);
	if("Y" == mapResult['successYN']){
		$('#thisForm').attr('action', '/project/free_commu.do');
		$('#thisForm')[0].submit();
	}else{
		alert('글 등록에 실패했습니다.');
	}
});
}
function modifyCommu(tid){
	var param = "title="+$('#title').val()+"";
		param += "&contents="+$('#contents').val()+"";
		param += "&tid="+tid+"";
	ajaxCall('/project/modifyCommunity',param , function(data){
		var mapResult = JSON.parse(data);
		if("Y" == mapResult['successYN']){
			$('#thisForm').attr('action', '/project/free_commu_view.do?tid='+tid+'');
			$('#thisForm')[0].submit();
		}else{
			alert('글 수정에 실패했습니다.');
		}
});
}

</script>
</html>