<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "com.dongyang.project.domain.ProductVO "%>
<%@ page import="java.util.List" %>
<%
	List<ProductVO> list = (List<ProductVO>)request.getAttribute("list");
 %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!DOCTYPE html>
<html>
<style>

table {border-collapse: collapse;}
th, td {text-align: left;}
#content{;width:100%; height:calc(100% - 20px); min-height:740px; padding: 0px 20px 0px 20px; background-color: #ffffff; }
#content_dashboard{width:100%; height:calc(100% - 20px); min-height:740px; padding: 0px 20px 0px 15px; background-color: #eeeff3; }
#footer{float:left; width:100%; height:20px; padding: 0px 20px 0px 20px; background-color: #eeeff3; text-align: center; color: #aaaaaa;}
#header{width:100%; height:60px; color:#ffffff; background-color:#12315f; padding: 0px 20px 0px 20px; line-height: 60px; position: relative;}
.tableHeader {width: 100%; height: 40px;}
.tableHeader td {background-color: #f0f1f3; border-top: 1px solid #d3d3d3; border-bottom: 1px solid #d3d3d3;}
.tableBody {width: 100%; }
.tableBody td {background-color: transparent; border-top: 0px solid #d3d3d3; border-bottom: 1px solid #d3d3d3; height: 38px;}

</style>
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
<div style="width: 100%; font-size: 26px;">재고관리</div><br>
<table class="tableHeader" style="width: 100%; overflow: hidden;">
	<tr>
		<td style="width: 25%;text-align: center;">상품명</td>
		<td style="width: 25%;text-align: center;">상품가격</td>
		<td style="width: 25%;text-align: center;">상품수</td>
		<td style="width: 25%;text-align: center;">바코드</td>
	</tr>
</table>
<%if(0 < list.size()){ %>
	<table class="tableBody">
	<%for(int i =0; i < list.size(); i++) {
		ProductVO bean = list.get(i);%>
		<tr>
			<td style="width: 25%;text-align: center;"><%=bean.getName() %></td>
			<td style="width: 25%;text-align: center;"><%=bean.getPrice() %></td>
			<td style="width: 25%;text-align: center;"><%=bean.getCount() %></td>
			<td style="width: 25%;text-align: center;"><%=bean.getBarcode() %></td>
		</tr>
	<%} %>
	</table>
<%} %>
</div>
</div>
</form>
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
	}
	$('#thisForm')[0].submit();	
}
</script>