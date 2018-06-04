<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<div id="header" style="text-align:center;">
	<div class="menu_div">
		<button class="menu_btn menu_btn_dashboard on" onclick="javascript:menu('MAIN')">메인</button>
		<button class="menu_btn menu_btn_list" onclick="javascript:menu('SALE')">판매관리</button>
		<button class="menu_btn menu_btn_report" onclick="javascript:menu('MANAGE')">재고관리</button>
		<button class="menu_btn menu_btn_setting" onclick="javascript:menu('INOUT')">입/출고관리</button>
		<button class="menu_btn menu_btn_setting" onclick="javascript:menu('COMMU')">커뮤니티</button>
	</div>
</div>