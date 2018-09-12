<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "com.dongyang.project.domain.ProductVO "%>
<%@ page import="java.util.List" %>
<%
	List<ProductVO> list = (List<ProductVO>)request.getAttribute("list");
 %>
<!DOCTYPE html>
<html>
<style>
* {-webkit-tap-highlight-color:transparent;outline:none; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; background: white; font-size: 12px; color:#3d3d3d;}
html{width:100%; height:100%; overflow: auto; background-color: #ffffff;}
body{overflow-y:no; height:calc(100% - 100px);}
table {border-collapse: collapse;}
th, td {text-align: left;}
#wrapper{width:100%; min-width:1920px; height:100%; }
#content{;width:100%; height:calc(100% - 20px); min-height:740px; padding: 0px 20px 0px 20px; background-color: #ffffff; }
#content_dashboard{width:100%; height:calc(100% - 20px); min-height:740px; padding: 0px 20px 0px 15px; background-color: #eeeff3; }
#footer{float:left; width:100%; height:20px; padding: 0px 20px 0px 20px; background-color: #eeeff3; text-align: center; color: #aaaaaa;}
#header{width:100%; height:60px; color:#ffffff; background-color:#12315f; padding: 0px 20px 0px 20px; line-height: 60px; position: relative;}
.menu_div{width:581px; height:auto; position:absolute; margin:0px 0px 0px 20px; left:0; border: 0px solid red; background: #07224C;}
.menu_btn{width:115px; height:60px; border: 0px solid; margin: 0px 0px 0px 1px; float: left; color: transparent;}
.menu_btn_dashboard{background-color: #23487e; background-size: contain; background-repeat: no-repeat; color: black;}
.menu_btn_dashboard.on{background-color: #7ec41d; background-size: contain; background-repeat: no-repeat;}
.menu_btn_list{background-color: #23487e; background-size: contain; background-repeat: no-repeat; color: black;}
.menu_btn_list.on{background-color: #7ec41d; background-size: contain; background-repeat: no-repeat;}
.menu_btn_report{background-color: #23487e; background-size: contain; background-repeat: no-repeat; color: black;}
.menu_btn_report.on{background-color: #7ec41d; background-size: contain; background-repeat: no-repeat;}
.menu_btn_setting{background-color: #23487e; background-size: contain; background-repeat: no-repeat; color: black;}
.menu_btn_setting.on{background-color: #7ec41d; background-size: contain; background-repeat: no-repeat;}
.menu_btn:hover{background-color: #7ec41d; color: white; font-weight: bold; width: 115px; word-wrap:break-word; line-height: 10px; padding: 0px 5px 0px 5px; }
#logout{width:100%; height:40px; color:#000000; background-color: #ffffff; padding: 0px 20px 0px 20px; font-size:14px; text-align: right; vertical-align: middle;}
.logout{margin:7px auto; padding:4px 10px 4px 10px; color: white; display:inline-block; border: 0px solid transparent; background: #8a8d98;cursor: pointer; }
#footer{float:left; width:100%; height:20px; padding: 0px 20px 0px 20px; background-color: #eeeff3; text-align: center; color: #aaaaaa;}
.tableHeader {width: 100%; height: 40px;}
.tableHeader td {background-color: #f0f1f3; border-top: 1px solid #d3d3d3; border-bottom: 1px solid #d3d3d3;}
.tableBody {width: 100%; }
.tableBody td {background-color: transparent; border-top: 0px solid #d3d3d3; border-bottom: 1px solid #d3d3d3; height: 38px;}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Y-POS</title>
<%@ include file = "include/header.jsp" %>
</head>
<body>
<form id="thisForm" name="thisForm" onsubmit="return false;" action ="/" method="post" enctype="multipart/form-data">
<div id="wrapper">
<div id="header" style="text-align:center;">
	<div class="menu_div">
		<button class="menu_btn menu_btn_dashboard" onclick="javascript:menu('MAIN')">메인</button>
		<button class="menu_btn menu_btn_list" onclick="javascript:menu('SALE')">판매관리</button>
		<button class="menu_btn menu_btn_report on" onclick="javascript:menu('MANAGE')">재고관리</button>
		<button class="menu_btn menu_btn_setting" onclick="javascript:menu('INOUT')">입/출고관리</button>
		<button class="menu_btn menu_btn_setting" onclick="javascript:menu('COMMU')">커뮤니티</button>
	</div>
</div>
<div id="logout"><%=session.getAttribute("name") %>님 안녕하세요. <button class="btn logout" onclick="javascript:menu('LOGOUT')">로그아웃</button></div>
<div id="content">
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