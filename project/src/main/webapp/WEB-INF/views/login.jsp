<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
	<title>Y-POS</title>
</head>

<style>
/* BASIC */

html {
  background-color: #56baed;
}

body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
}

a {
  color: #92badd;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}

h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px; 
  color: #cccccc;
}



/* STRUCTURE */

.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 30px;
  width: 90%;
  max-width: 450px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}

#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}



/* TABS */

h2.inactive {
  color: #cccccc;
}

h2.active {
  color: #0d0d0d;
  border-bottom: 2px solid #5fbae9;
}



/* FORM TYPOGRAPHY*/

input[type=button], input[type=submit], input[type=reset]  {
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #39ace7;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

input[type=text], input[type=password] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus ,input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder, input[type=password]:placeholder {
  color: #cccccc;
}



/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #56baed;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #0d0d0d;
}

.underlineHover:hover:after{
  width: 100%;
}



/* OTHERS */

*:focus {
    outline: none;
} 

#icon {
  width:60%;
}


</style>
<body>
<form id="thisForm" name="thisForm" onsubmit="return false;" action ="/" method="post" enctype="multipart/form-data">
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form>
      <input type="text" name="mid" id="txt_mid" class="fadeIn second" name="login" placeholder="login"
      onkeydown="return loginCheckEnter();" 
					autocomplete="off"autofocus="autofocus"/>
      <input type="password" name="mpw" id="txt_mpw" class="fadeIn third" name="login" placeholder="password"
      onkeydown="return loginCheckEnter();"
					autocomplete="off"/>
      <input type="submit" class="fadeIn fourth" value="LogIn" onclick="loginCheck()"/>
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

  </div>
</div>
</form>
</body>

<script type="text/javascript">
//disable text selection
function ajaxCall(){		
	var req = null;
	var args = this.ajaxCall.arguments;
	// 브라우져 호환성 검사
	if(window.XMLHttpRequest) {
		req = new XMLHttpRequest();		
	} else if (window.ActiveXObject) {
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if(req) {		
		req.open('POST', args[0], true);		// request open
		req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");	// 헤더지정
		req.send(args[1]);					// 요청
		req.onreadystatechange =  function() {	
			if(req.readyState == 4) {					
				if(req.status == 200) {
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
document.body.onkeydown = function(e){
	if(event.keyCode == 13 && e.srcElement.type==undefined){
		return false;
	}		
	return true;
}
function loginCheckEnter(){
	if(event.keyCode == 13){
		loginCheck();		
		return false;
	}		
	return true;
}
function loginCheck(){
	var form = document.getElementById("thisForm");
	if("" == $("#txt_mid").val()){ 
		alert("아이디를 입력해주세요.");
		return;
	}
	 if("" == $("#txt_mpw").val()){
		alert("비밀번호를 입력해주세요.");
		return;
	}
	var formData = new FormData();
	formData.append("mid", $("#txt_mid").val());
	formData.append("mpw", $("#txt_mpw").val());
	formData.append("forceLoginYN", forceLoginYN);
	ajaxCall('/project/select', "&mid="+$("#txt_mid").val()+"&mpw="+$("#txt_mpw").val()+"", loginCheckResult);
}
function loginCheckResult(obj) {
	var mapResult = JSON.parse(obj);
	var loginYN = mapResult['loginYN'];
	if('Y' == loginYN){
		 $('#thisForm').attr('action', '/project/main.do');
		 $('#thisForm')[0].submit();
	}else {
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

