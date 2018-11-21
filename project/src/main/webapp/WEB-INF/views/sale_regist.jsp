<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

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
	<form id="thisForm" name="thisForm" onsubmit="return check_onclick();"
		action="/" method="post" enctype="multipart/form-data">

		<%@include file="./include/menu.jsp"%>



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
        <input type="text" name="productCode" class="form-control mx-1 mt-2" placeholder="상품코드를 입력하세요." style="width: 300px; margin-left: 15px; margin-right: 15px"> <b>수량</b>
        <input type="text" name="count" class="form-control mx-1 mt-2" placeholder="수량입력" style="width: 100px; margin-left: 15px">
        <input type="radio" name="sale" value="판매" style="margin-left: 10px"/> 판매
        <input type="radio" name="sale" value="반품" /> 반품
        <input type="submit" value="등록" class="btn btn-primary mx-1 mt-2" style="border: none; background-color: #56baed; margin-left: 15px" onclick="#" /> 
        
<!-- 			<table>
					<tr>
						<td><b>상품코드</b></td>
						<td colspan="3"><input type="text" name="productCode"
							class="form-control mx-1 mt-2" placeholder="상품코드를 입력하세요."
							style="width: 300px; margin-left: 5px; margin-right: 5px"></td>
						<td><b>수량</b></td>
						<td><input type="text" name="count"
							class="form-control mx-1 mt-2" placeholder="수량입력"
							style="width: 100px; margin-left: 5px"></td>
						<td>
							<input type="radio" name="sale" value="판매" style="margin-left: 10px"/> 판매 
							<input type="radio" name="sale" value="반품"/> 반품</td>
						<td>
							<button type="submit" class="btn btn-primary mx-1 mt-2"
								style="border: none; background-color: #56baed; margin-left: 10px"
								onclick="#">등록</button>
						</td>

					</tr>
				</table>-->
			</div>

			<div class="price" style="margin-top: 20px; margin-bottom: 40px" align="left">
				<table>
					<tr>
						<td><b>총 판매금액&nbsp;&nbsp;&nbsp;</b></td>
						<td><b style="font-size: 20px">0</b></td>

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
					<tr>
						<td>판매</td>
						<td>iphoneX_AA128</td>
						<td>아이폰x_128GB</td>
						<td>1</td>
						<td>1,100,00O</td>
						<td>2018-11-15</td>
					</tr>
					<tr>
						<td>반품</td>
						<td>iphoneX_AA128</td>
						<td>아이폰x_128GB</td>
						<td>1</td>
						<td>-1,100,00O</td>
						<td>2018-11-15</td>
					</tr>
					</tbody>

				</table>
			</div>

		</div>
	</form>
</body>
</html>

<script type="text/javascript">
function check_onclick(){
	if(thisForm.productCode.value==""){
		alert("상품코드를 입력해 주세요.");
		thisForm.productCode.focus();
		return false;
	}
	
	else if(thisForm.productCode.value!=""&&thisForm.count.value==""){
		alert("수량을 입력해 주세요.");
		thisForm.count.focus();
		return false;
	}
	else 
		return true;
}

</script>
