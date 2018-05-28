<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<div style="text-align:center;">
	<a href="${path}/">main</a>
	<a href="${path}/sale.do">판매관리</a>
	<a href="${path}/manage.do">재고관리</a>
	<a href="${path}/inout.do">입/출고관리</a>
	<a href="${path}/commu.do">커뮤니티</a>
</div>