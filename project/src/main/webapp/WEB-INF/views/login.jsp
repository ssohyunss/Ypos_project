<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String loginYN = (String)session.getAttribute("loginYN");
	String firstPage = (String)session.getAttribute("firstPage");
%>
<!DOCTYPE html>
<html style="background-color:#16699e;">
<head>
<title>Y-POS</title>
<style type="text/css">
.login *{}
.login .wrap *{}
.login .wrap{width:1000px;margin:0px auto 0;height:572px; padding:75px 74px 0 77px;border-radius:4px;background:url(../img/bg/bg_2.png) no-repeat;background-position:center; background-size: 1000px 572px }

</style>
<script src="/project/include/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
<%
if("Y".equals(session.getAttribute("loginYN"))) {
	if("Y".equals(session.getAttribute("sysYN"))) {%>
window.top.location.href='/schema.do';
	<%}else {%>
window.top.location.href='/ipscan.do?cmd=FORWARDLIST';			
	<%}
}
%>
</script>
</head>
<body class="login">
<form id="thisForm" name="thisForm" onsubmit="return false;" action ="/" method="post" enctype="multipart/form-data" style="background-color:#16699e;">
<div style="height: 606px; width: 100%; background-size: 1px 606px;">
</div>
<div class="wrap" style="margin:0px auto; margin-top: -478px;">
	<div style="width: 268px; margin-left: 400px; margin-top: 162px;">
		<label style="background:url(../com/scope/ipscannac/common/img/icon/console.png) no-repeat; background-size: 137px 13px; display:block; width:137px; height:13px; margin: 200px 0px 0px 66px;"></label>
		<div>
			<input type="text" name="txt_mid" id="txt_mid" 
					style="font-size: 10pt; border: 1px solid #4587c0; width:238px; height: 40px; margin: 20px 15px 0px 15px; padding: 0px 10px 0px 40px; z-index: 1; background-size: 25px 25px; background-position: 10px 6px; " 
					onkeydown="return loginCheckEnter();" 
					autocomplete="off"
					placeholder="Admin ID"
					autofocus="autofocus"/>
		</div>
		<div>
			<input type="password" name="txt_mpw" id="txt_mpw" 
					style="font-size: 10pt; border: 1px solid #4587c0; width:238px; height: 40px; margin: 10px 15px 0px 15px; padding: 0px 10px 0px 40px; z-index: 1; background-size: 25px 25px; background-position: 10px 6px;"
					onkeydown="return loginCheckEnter();"
					autocomplete="off"
					placeholder="Password"/>
		</div>
		<div style="background: #0061b2; color: white; width:238px; height: 40px; margin: 15px 15px 0px 15px; outline: none; border: none; font-size: 12pt;" 
			onclick="loginCheck()">
			<div style="text-align: center; background: transparent;">
				<label style="display:inline-block; background:transparent; color: white; font-size: 12pt; font-weight: bold; margin-top: 5px;">&nbsp;Sign In</label>
			</div>
		</div>
	</div>
	<div style="width:250px; height 30px; margin: 75px auto; background: transparent;">
		<label style="background: transparent; color:#cccccc; font-size: 8pt; padding-left:28px;">Copyright Scope Inc. All Rights Reserved.</label>
	</div>
</div>
</form>
</body>
<script type="text/javascript">
//disable text selection
function ajaxCall_formData(){
	var args = this.ajaxCall_formData.arguments;
	$.ajax({
		xhr: function() {
		    var xhr = new window.XMLHttpRequest();
		    xhr.upload.addEventListener("progress", function(evt) {
		      if (evt.lengthComputable) {
		        var percentComplete = evt.loaded / evt.total;
		        percentComplete = parseInt(percentComplete * 100);
		        var obj = top.$('#loadingTitle');
		        if(null != obj) {
			        if (percentComplete === 100) {
			        	obj.text('Processing...');
			        }else {
			        	obj.text('Uploading...'+percentComplete+'%');
			        }		        	
		        }
		      }
		    }, false);

		    return xhr;
		},
	    url: args[0],
	    processData: false,
	    contentType: false,
	    data: args[1],
	    type: 'POST',
	    success: function(result){
	       args[2](result, args[3], args[4]);
	    }
	});		
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
	formData.append("cmd", "LOGINCHECK");
	formData.append("mid", $("#txt_mid").val());
	formData.append("mpw", $("#txt_mpw").val());
	formData.append("forceLoginYN", forceLoginYN);
	ajaxCall_formData('/project/?cmd=LOGINCHECK', formData, loginCheckResult);
}
function loginCheckResult(obj) {
	 $('#thisForm').attr('action', '/project/main.do');
	 $('#thisForm')[0].submit();
// 	try {
// 		forceLoginYN = 'N';
// 		var mapResult = JSON.parse(obj);
// 		var resultCode = mapResult['resultCode'];
// 		var sysYN = mapResult['sysYN'];
// 		var message = mapResult['message'];
// 		var firstPage = mapResult['firstPage'];
// 		var confirmMessage = mapResult['confirmMessage'];
// 		var product = mapResult['product'];
// 		console.log(mapResult);
// 		if(0 < message.length) {
// 			alert(message);
// 		}
// 		if('Y' == resultCode) {
// 			if('Y' == sysYN) {
// 				 $('#cmd').val('MENU');
// 				 $('#thisForm').attr('action', '/schema.do');		
// 			}else {
// 				if("DASH" == firstPage){
// 					$('#thisForm').attr('action', '/dashboard.do?cmd=DASHBOARD');
// 				}else if("LIST" == firstPage){
// 					if("XE" == product){
// 						$('#thisForm').attr('action', '/ipscan.do?cmd=FORWARDLIST');
// 					}else if("NAC" == product){
// 						$('#thisForm').attr('action', '/nac.do?cmd=NACLIST');
// 					}else if("CSI" == product){
// 						$('#thisForm').attr('action', '/csi.do?cmd=CSILIST');
// 					}else if("TBA" == product){
// 						$('#thisForm').attr('action', '/ipfarm.do?cmd=IPFARMLIST');
// 					}else{
// 						$('#thisForm').attr('action', '/ipscan.do?cmd=FORWARDLIST');
// 					}
					
// 				}else if("REPORT" == firstPage){
// 					if("XE" == product){
// 						$('#thisForm').attr('action', '/ipscanreport.do?cmd=FORWARDREPORT');
// 					}else if("NAC" == product){
// 						$('#thisForm').attr('action', '/nacreport.do?cmd=FORWARDREPORT');
// 					}else if("CSI" == product){
// 						$('#thisForm').attr('action', '/csireport.do?cmd=FORWARDREPORT');
// 					}else if("TBA" == product){
// 						$('#thisForm').attr('action', '/tbareport.do?cmd=FORWARDREPORT');
// 					}else{
// 						$('#thisForm').attr('action', '/ipscanreport.do?cmd=FORWARDREPORT');
// 					}
// 				}else if("SETTING" == firstPage){
// 					$('#thisForm').attr('action', '/setting.do?cmd=SETTING');
// 				}else{
// 					$('#thisForm').attr('action', '/ipscan.do?cmd=FORWARDLIST');
// 				}
// 			}
// 		}else {
// 			if('ANOTHER_USER_PROMPT' == resultCode) {
// 				if(confirm(confirmMessage)) {
// 					forceLoginYN = 'Y';
// 					loginCheck();
// 					return;
// 				}
// 			}else {
// 				$('#thisForm').attr('action', '/ipscannaclogin.do?cmd=LOGOUT');	
// 			}
// 		}
// 		$('#thisForm')[0].submit();
// 	}catch(e) {
// 		console.log(e);
// 	}	
}
</script>
</html>