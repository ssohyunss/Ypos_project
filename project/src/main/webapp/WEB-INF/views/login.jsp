<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<link rel="stylesheet" href="./css/bootstrap.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<head>
<title>Y-POS</title>
</head>

<body>
	<form id="thisForm" name="thisForm" onsubmit="return false;" action="/"
		method="post" enctype="multipart/form-data">
		<div class="container" style="margin-top: 100px;">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumgotron" style="padding-top: 20px">
					<form>
						<p style="text-align: center">
							<img src="img/logo-ypos.png" style="align-content: center">
						</p>
						<div class="form-group">
							<input type="text" name="mid" id="txt_mid" class="form-control"
								name="login" placeholder="로그인"
								onkeydown="return loginCheckEnter();" autocomplete="off"
								autofocus="autofocus" maxlength="20" />
						</div>

						<div class="form-group">
							<input type="password" name="mpw" id="txt_mpw"
								class="form-control" name="login" placeholder="비밀번호"
								onkeydown="return loginCheckEnter();" autocomplete="off"
								maxlength="20" />
						</div>
						<input type="submit" style="border: none; background-color:#56baed" class="btn btn-primary form-control"
							value="로그인" onclick="loginCheck()">
					</form>

				</div>

			</div>


		</div>
	</form>
</body>

<script type="text/javascript">
	//disable text selection
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
	var forceLoginYN = 'N';
	document.onselectstart = function() {
		return false;
	}
	document.body.onkeydown = function(e) {
		if (event.keyCode == 13 && e.srcElement.type == undefined) {
			return false;
		}
		return true;
	}
	function loginCheckEnter() {
		if (event.keyCode == 13) {
			loginCheck();
			return false;
		}
		return true;
	}
	function loginCheck() {
		var form = document.getElementById("thisForm");
		if ("" == $("#txt_mid").val()) {
			alert("아이디를 입력해주세요.");
			return;
		}
		if ("" == $("#txt_mpw").val()) {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		var formData = new FormData();
		formData.append("mid", $("#txt_mid").val());
		formData.append("mpw", $("#txt_mpw").val());
		formData.append("forceLoginYN", forceLoginYN);
		ajaxCall('/project/select', "&mid=" + $("#txt_mid").val() + "&mpw="
				+ $("#txt_mpw").val() + "", loginCheckResult);
	}
	function loginCheckResult(obj) {
		var mapResult = JSON.parse(obj);
		var loginYN = mapResult['loginYN'];
		if ('Y' == loginYN) {
			$('#thisForm').attr('action', '/project/main.do');
			$('#thisForm')[0].submit();
		} else {
			alert('로그인에 실패했습니다.');
			return;
		}

		// 	try {
		//		forceLoginYN = 'N';
		//		var sysYN = mapResult['sysYN'];
		//		var message = mapResult['message'];
		//		var firstPage = mapResult['firstPage'];
		//		var confirmMessage = mapResult['confirmMessage'];
		//		var product = mapResult['product'];
		//		console.log(mapResult);
		//		if(0 < message.length) {
		//			alert(message);
		//		}
		//		if('Y' == resultCode) {
		//			if('Y' == sysYN) {
		//				 $('#cmd').val('MENU');
		//				 $('#thisForm').attr('action', '/schema.do');		
		//			}else {
		//				if("DASH" == firstPage){
		//					$('#thisForm').attr('action', '/dashboard.do?cmd=DASHBOARD');
		//				}else if("LIST" == firstPage){
		//					if("XE" == product){
		//						$('#thisForm').attr('action', '/ipscan.do?cmd=FORWARDLIST');
		//					}else if("NAC" == product){
		//						$('#thisForm').attr('action', '/nac.do?cmd=NACLIST');
		//					}else if("CSI" == product){
		//						$('#thisForm').attr('action', '/csi.do?cmd=CSILIST');
		//					}else if("TBA" == product){
		//						$('#thisForm').attr('action', '/ipfarm.do?cmd=IPFARMLIST');
		//					}else{
		//						$('#thisForm').attr('action', '/ipscan.do?cmd=FORWARDLIST');
		//					}

		//				}else if("REPORT" == firstPage){
		//					if("XE" == product){
		//						$('#thisForm').attr('action', '/ipscanreport.do?cmd=FORWARDREPORT');
		//					}else if("NAC" == product){
		//						$('#thisForm').attr('action', '/nacreport.do?cmd=FORWARDREPORT');
		//					}else if("CSI" == product){
		//						$('#thisForm').attr('action', '/csireport.do?cmd=FORWARDREPORT');
		//					}else if("TBA" == product){
		//						$('#thisForm').attr('action', '/tbareport.do?cmd=FORWARDREPORT');
		//					}else{
		//						$('#thisForm').attr('action', '/ipscanreport.do?cmd=FORWARDREPORT');
		//					}
		//				}else if("SETTING" == firstPage){
		//					$('#thisForm').attr('action', '/setting.do?cmd=SETTING');
		//				}else{
		//					$('#thisForm').attr('action', '/ipscan.do?cmd=FORWARDLIST');
		//				}
		//			}
		//		}else {
		//			if('ANOTHER_USER_PROMPT' == resultCode) {
		//				if(confirm(confirmMessage)) {
		//					forceLoginYN = 'Y';
		//					loginCheck();
		//					return;
		//				}
		//			}else {
		//				$('#thisForm').attr('action', '/ipscannaclogin.do?cmd=LOGOUT');	
		//			}
		//		}
		//		$('#thisForm')[0].submit();
		//	}catch(e) {
		//		console.log(e);
		//	}	
	}
</script>
</html>

