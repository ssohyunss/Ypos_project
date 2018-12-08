<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.SaleVO "%>
<%@ page import="java.util.List"%>
<%
	List<SaleVO> list = (List<SaleVO>) request.getAttribute("saleList");
	String total = (String)request.getAttribute("saleMoney");
	if("" == total || null == total){
		total = "0";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport " content="width=device-width ,initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
            $(function() {
                
            
                //오늘 날짜를 출력
                $("#today").text(new Date().toLocaleDateString());

               
            });
        </script>
<title>Y-POS</title>
</head>
<style>
.content{
        margin: 10px 20px;
        display: flex;
    }
    
    
    
    @media(max-width:767px) {
       
        input[type="text"] {
       margin : 10px 0;
    }
    
        .date , .price{
        	margin-left: 20px;
        }
    
        .content{
            display: inline-block;
        }
    }
</style>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<form id="thisForm" name="thisForm" action="/" method="post" enctype="multipart/form-data">
		<%@include file="./include/menu.jsp"%>
	</form>
	<div class="container">

			<h3>
				<b>판매등록</b>
			</h3>

			<div  class="date" style="margin-top: 40px; margin-bottom: 20px" align="left">
				<table>
					<tr>
						<td><b><span id="today"></span></b></td>
					</tr>
				</table>
			</div>

			<div class="content" style="margin-top: 20px; margin-bottom: 20px"
				align="left">
				
				 <b>상품코드</b>
        <input type="text" id="code" class="form-control mx-1 mt-2" placeholder="상품코드를 입력하세요." style="width: 300px; margin-left: 15px; margin-right: 15px" onfocus="writeCode()"> <b>수량</b>
        <input type="text" id="count" class="form-control mx-1 mt-2" placeholder="수량입력" style="width: 100px; margin-left: 15px">
        <input type="radio" name="sale" value="SALE" style="margin-left: 10px" checked="checked"/> 판매
        <input type="radio" name="sale" value="RETURN" /> 반품
        <input type="button" value="등록" class="btn btn-primary mx-1 mt-2" style="border: none; background-color: #56baed; margin-left: 15px" onclick="insertReg()" /> 
			</div>

			<div class="price" style="margin-top: 20px; margin-bottom: 40px" align="left">
				<table>
					<tr>
						<td><b>총 판매금액&nbsp;&nbsp;&nbsp;</b></td>
						<td><b style="font-size: 20px"><%=total %></b></td>

					</tr>
				</table>
			</div>

			<div class="row">
				<table class="table table-striped" style="text-align: center;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">분류</th>
							<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
							<th style="background-color: #eeeeee; text-align: center;">상품명</th>
							<th style="background-color: #eeeeee; text-align: center;">수량</th>
							<th style="background-color: #eeeeee; text-align: center;">금액</th>
							<th style="background-color: #eeeeee; text-align: center;">날짜</th>
						</tr>
					</thead>
				<tbody>
					<%
						if (0 < list.size()) {

							for (int i = 0; i < list.size(); i++) {
								SaleVO bean = list.get(i);
					%>
					<tr>
						<%if("RETURN".equals(bean.getStatus())){ %>
							<td>반품</td>	
						<%}else{ %>
							<td>판매</td>
						<%} %>
						<td><%=bean.getProduct_code()%></td>
						<td><%=bean.getProduct_name()%></td>
						<td><%=bean.getCount()%></td>
						<%if("RETURN".equals(bean.getStatus())){ %>
							<td>-<%=bean.getPrice()%></td>	
						<%}else{ %>
							<td><%=bean.getPrice()%></td>
						<%} %>
						<td><%=bean.getCreate_date()%></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>

				</table>
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
function insertReg(){
	if("" == $('#code').val() || "" == $('#count').val()){
		return false;
	}
	if(13>$('#code').val().length || 13<$('#code').val().length){
		alert('올바른 코드를 입력해주세요.');
		return false;
	}
	var param = "code=" + $('#code').val() + "";
	param += "&status=" + $('input[name=sale]:checked').val() + "";
	param += "&count=" + $('#count').val() + "";
	ajaxCall('/project/insertSale', param,
			function(data) {
				var mapResult = JSON.parse(data);
				if ("Y" == mapResult['successYN']) {
					$('#thisForm').attr('action',
							'/project/sale_regist.do');
					$('#thisForm')[0].submit();
				} else {
					alert(mapResult['error']);
				}
			});
}
function writeCode(){
	if (isMobile()) {
	    // 모바일이면 실행될 코드 들어가는 곳
		Android.showToast("상품코드입력");
	}
}
function isMobile() {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}
function barcodeText(value){
	$('#code').val(value);
}
</script>
</html>

