<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<title>Y-POS</title>
</head>
<body>

<div style="display:flex">
 <div class="container" style="width: 50%; margin-top:150px; display: inline-block">
        <canvas id="myChart"> </canvas>
    </div>
    
    <div class="container" style="width: 50%; display: inline-block; margin-top:30px; margin-right: 30px">
        
        <h2><b>공지사항</b></h2>
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
					<tr>
						<td>1</td>
						<td><a href="javascript:button('NOTICE_VIEW')">안녕하세요.</td>
						<td>관리자(권소현)</td>
						<td>2018-10-14</td>
					</tr>
					<tr>
						<td>2</td>
						<td><a href="javascript:button('NOTICE_VIEW')">안녕하세요.</td>
						<td>관리자(권소현)</td>
						<td>2018-11-04</td>
					</tr>
					<tr>
						<td>3</td>
						<td><a href="javascript:button('NOTICE_VIEW')">안녕하세요.</td>
						<td>관리자(권소현)</td>
						<td>2018-11-07</td>
					</tr>
				</tbody>

			</table>

		</div>
        <h2><b>입점확인</b></h2>
       <div class="row">
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">주문명</th>
						<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
						<th style="background-color: #eeeeee; text-align: center;">상품명</th>
						<th style="background-color: #eeeeee; text-align: center;">수량</th>
						<th style="background-color: #eeeeee; text-align: center;">지점명</th>
						<th style="background-color: #eeeeee; text-align: center;">출고일</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>아이폰x주문</td>
						<td>iphoneX_AA128</td>
						<td>아이폰x_128GB</td>
						<td>8</td>
						<td>인천점</td>
						<td>2018-10-08</td>
					</tr>
					<tr>
						<td>헤드셋주문</td>
						<td>headset_HH_SONY</td>
						<td>헤드셋_소니</td>
						<td>1</td>
						<td>본사</td>
						<td>2018-10-11</td>
					</tr>
				</tbody>

			</table>
		</div>
		  <h2><b>출고주문내역</b></h2>
       <div class="row">
			<table class="table table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">주문명</th>
						<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
						<th style="background-color: #eeeeee; text-align: center;">상품명</th>
						<th style="background-color: #eeeeee; text-align: center;">수량</th>
						<th style="background-color: #eeeeee; text-align: center;">지점명</th>
						<th style="background-color: #eeeeee; text-align: center;">등록일</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>아이폰xs주문</td>
						<td>iphonexs_AA128</td>
						<td>아이폰xs_128GB</td>
						<td>2</td>
						<td>서울점</td>
						<td>2018-11-03</td>
					</tr>
					<tr>
						<td>헤드셋주문</td>
						<td>headset_HH_SONY</td>
						<td>헤드셋_소니</td>
						<td>1</td>
						<td>서울점</td>
						<td>2018-10-11</td>
					</tr>
					<tr>
						<td>헤드셋주문</td>
						<td>headset_HH_SONY</td>
						<td>헤드셋_소니</td>
						<td>1</td>
						<td>서울점</td>
						<td>2018-10-11</td>
					</tr>
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
            type: 'bar'
            , data: {
                datasets: [{
                    label: '월매출'
                    , data: [
                       200000
                       , 203030
                       , 405050
                       , 191020
                       , 330000
                        , 405050
                        , 200000
                       , 203030
                       , 405050
                       , 191020
                       , 330000
                        , 405050
                   ]
                    , backgroundColor: [
                        'rgba(255,99,132,0.6)'
                        , 'rgba(54,162,235,0.6)'
                        , 'rgba(75,192,192,0.6)'
                        , 'rgba(153,102,255,0.6)'
                        , 'rgba(255,159,64,0.6)'
                        , 'rgba(255,99,132,0.6)'
                        , 'rgba(54,162,235,0.6)'
                        , 'rgba(75,192,192,0.6)'
                        , 'rgba(153,102,255,0.6)'
                        , 'rgba(255,159,64,0.6)'
                        , 'rgba(255,99,132,0.6)'
                        , 'rgba(54,162,235,0.6)'
                        , 'rgba(75,192,192,0.6)'
                    ]
                    , borderWidth: 1
                    , borderColor: '#777'
                    , hoverBorderWidth: 3
                    , hoberBorderColor: '#000'
               },{
            	   label : '전년대비',
            	   data: [
                       200000
                       , 203030
                       , 305050
                       , 91020
                       , 330200
                        , 225050
                        , 180000
                       , 503030
                       , 605050
                       , 201020
                       , 301000
                        , 405120
                   ],
                   type:'line',
                   borderColor:'#56baed'
               }],
               labels: ['1월', '2월', '3월', '4월', '5월','6월','7월', '8월', '9월', '10월', '11월','12월']
            
            }
            , options: {
                title: {
                    display: true
                    , text: '매출 비교 그래프',
                    fontSize: 25
                }
                , legend: {
                    display:false,
                    position: 'right',
                    lables:{
                    fontColor:'#000'
                    }
                },
                
                layout:{
                    padding:{
                        left:50,
                        right:50,
                        bottom:0,
                        top:0
                    }
                },
                
                tooltips:{
                    enabled:true
                }
            }
        });
    </script>

</body>
</html>