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

<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<form id="thisForm" name="thisForm" onsubmit="return false;" action="/"
		method="post" enctype="multipart/form-data">
		<%@include file="./include/menu.jsp"%>
	</form>
	
	<div class="container">
		<div class="row">
			<form method="post" action="#">
				<table class="table table-striped" style="text-align: center;">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">�����Խ��� �۾���</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="�����Խ��� ����" name="freeTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="�����Խ��� ����"
									name="freeContent" maxlength="2048" style="height: 350px;"></textarea></td>

						</tr>
					</tbody>

				</table>
				<input type="submit" class="btn btn-primary pull-right" value="�۾���" style="border: none; background-color:#56baed" >
			</form>
		</div>
	</div>
	
	
</body>
</html>