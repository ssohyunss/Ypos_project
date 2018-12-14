<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dongyang.project.domain.NoticeVO "%>
<%@ page import="com.dongyang.project.domain.OrderVO "%>
<%@ page import="java.util.List"%>
<%
	List<OrderVO> inputList = (List<OrderVO>) request.getAttribute("inputList");
	List<NoticeVO> list = (List<NoticeVO>) request.getAttribute("list");
	List<OrderVO> outList = (List<OrderVO>) request.getAttribute("outList");
%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<title>Y-POS</title>
</head>
<style>
.container-chart {
	width: 50%;
	margin-top: 150px;
	display: inline-block;
}

.container-main {
	width: 50%;
	display: inline-block;
	margin-top: 30px;
	margin-right: 30px
}

@media ( max-width :767px) {
	.container-chart {
		display: none;
	}
	.container-main {
		width: 100%;
		margin: 30px 40px;
	}
}
</style>
<body>
	<div class="content" style="display: flex">
		<div class="container-chart">
			<canvas id="myChart"> </canvas>
		</div>

		<div class="container-main">

			<h2>
				<b>공지사항</b>
			</h2>
			<div class="row">
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
									NoticeVO bean = list.get(i);
						%>
						<tr style="cursor: pointer;"
							onclick="viewNotice('<%=bean.getTid()%>')">
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

			</div>
			<h2>
				<b>입점확인</b>
			</h2>
			<div class="row">
				<table class="table table-striped" style="text-align: center;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
							<th style="background-color: #eeeeee; text-align: center;">상품명</th>
							<th style="background-color: #eeeeee; text-align: center;">수량</th>
							<th style="background-color: #eeeeee; text-align: center;">지점명</th>
							<th style="background-color: #eeeeee; text-align: center;">내용</th>
							<th style="background-color: #eeeeee; text-align: center;">출고일</th>

						</tr>
					</thead>
					<tbody>
						<%
							if (0 < inputList.size()) {

								for (int i = 0; i < inputList.size(); i++) {
									OrderVO bean = inputList.get(i);
						%>
						<tr>
							<td><%=bean.getProduct_code()%></td>
							<td><%=bean.getProduct_name()%></td>
							<td><%=bean.getCount()%></td>
							<td><%=bean.getSite_name()%></td>
							<td><%=bean.getDescription()%></td>
							<td><%=bean.getOut_date()%></td>
						</tr>
						<%
							}
							}
						%>
					</tbody>

				</table>
			</div>
			<h2>
				<b>출고주문내역</b>
			</h2>
			<div class="row">
				<table class="table table-striped" style="text-align: center;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
							<th style="background-color: #eeeeee; text-align: center;">상품명</th>
							<th style="background-color: #eeeeee; text-align: center;">수량</th>
							<th style="background-color: #eeeeee; text-align: center;">지점명</th>
							<th style="background-color: #eeeeee; text-align: center;">내용</th>
							<th style="background-color: #eeeeee; text-align: center;">등록일</th>
							<th style="background-color: #eeeeee; text-align: center;">출고여부</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (0 < outList.size()) {

								for (int i = 0; i < outList.size(); i++) {
									OrderVO bean = outList.get(i);
						%>
						<tr>
							<td><%=bean.getProduct_code()%></td>
							<td><%=bean.getProduct_name()%></td>
							<td><%=bean.getCount()%></td>
							<td><%=bean.getSite_name()%></td>
							<td><%=bean.getDescription()%></td>
							<td><%=bean.getCreate_date()%></td>
							<%
								if ("Y".equals(bean.getOut_yn())) {
							%>
							<td>출고</td>
							<%
								} else {
							%>
							<td>미출고</td>
							<%
								}
							%>
						</tr>
						<%
							}
							}
						%>
					</tbody>

				</table>
			</div>
		</div>
	</div>

	<script>
		let myChart = document.getElementById('myChart').getContext('2d');
		Chart.defaults.global.defaultFontFamily = 'Lato';
		Chart.defaults.global.defaultFontFontSize = 18;
		Chart.defaults.global.defaultFontColor = '#777';
		let massPopChart = new Chart(myChart, {
			type : 'bar',
			data : {
				datasets : [
						{
							label : '월매출',
							data : [ 200000, 203030, 405050, 191020, 330000,
									405050, 200000, 203030, 405050, 191020,
									330000, 405050 ],
							backgroundColor : [ 'rgba(255,99,132,0.6)',
									'rgba(54,162,235,0.6)',
									'rgba(75,192,192,0.6)',
									'rgba(153,102,255,0.6)',
									'rgba(255,159,64,0.6)',
									'rgba(255,99,132,0.6)',
									'rgba(54,162,235,0.6)',
									'rgba(75,192,192,0.6)',
									'rgba(153,102,255,0.6)',
									'rgba(255,159,64,0.6)',
									'rgba(255,99,132,0.6)',
									'rgba(54,162,235,0.6)',
									'rgba(75,192,192,0.6)' ],
							borderWidth : 1,
							borderColor : '#777',
							hoverBorderWidth : 3,
							hoberBorderColor : '#000'
						},
						{
							label : '전년대비',
							data : [ 200000, 203030, 305050, 91020, 330200,
									225050, 180000, 503030, 605050, 201020,
									301000, 405120 ],
							type : 'bar',
							borderColor : '#56baed',
							borderWidth : 1,
							borderColor : '#777',
							hoverBorderWidth : 3,
							hoberBorderColor : '#000'
						} ],
				labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ]

			},
			options : {
				title : {
					display : true,
					text : '매출 비교 그래프',
					fontSize : 25
				},
				legend : {
					display : false,
					position : 'right',
					lables : {
						fontColor : '#000'
					}
				},

				layout : {
					padding : {
						left : 50,
						right : 50,
						bottom : 0,
						top : 0
					}
				},

				tooltips : {
					enabled : true
				}
			}
		});
	</script>

</body>
<script type="text/javascript">
	function viewNotice(tid) {
		var path = "${pageContext.request.contextPath}";
		$('#thisForm').attr('action',
				path + '/notice_commu_view.do?tid=' + tid + '');
		$('#thisForm')[0].submit();
	}
</script>
</html>