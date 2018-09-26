<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
  <title>Y-POS</title>
  <%@ include file = "include/header.jsp" %>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form id="thisForm" name="thisForm" onsubmit="return false;" action ="/" method="post" enctype="multipart/form-data">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Y-POS</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="javascript:menu('MAIN')">메인</a></li>
        <li><a href="javascript:menu('SALE')">판매관리</a></li>
        <li><a href="javascript:menu('MANAGE')">재고관리</a></li>
        <li><a href="javascript:menu('INOUT')">입/출고관리</a></li>
        <li><a href="javascript:menu('COMMU')">커뮤니티</a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"> <%=session.getAttribute("name")%>   <span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
      </ul>
    </div>
  </div>
</nav> 
</form>
커뮤니티
</body>
</html>

<script type="text/javascript">
function menu(cmd){
	var path = "${pageContext.request.contextPath}";
	if("MAIN" == cmd){
		$('#thisForm').attr('action', path+'/main.do');
	}else if("SALE" == cmd){
		$('#thisForm').attr('action', path+'/sale.do');
	}else if("MANAGE" == cmd){
		$('#thisForm').attr('action', path+'/manage.do');
	}else if("INOUT" == cmd){
		$('#thisForm').attr('action', path+'/inout.do');
	}else if("COMMU" == cmd){
		$('#thisForm').attr('action', path+'/commu.do');
	}else if("LOGOUT" == cmd){
		$('#thisForm').attr('action', path);
	}
	$('#thisForm')[0].submit();	
}
</script>
