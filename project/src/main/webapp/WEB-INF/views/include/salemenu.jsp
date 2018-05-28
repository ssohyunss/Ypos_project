<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<div style="text-align:center;">
	<a href="${path}/">판매등록</a>
	<a href="${path}/">판매마감현황</a>
	<a href="${path}/">품번별 판매현황</a>
	<a href="${path}/">월별추이그래프</a>
</div>