<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/include/memberCheck.jsp" />
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberMain.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<div class="container mt-5">
		<h3>Mypage<span></span></h3>
		<hr />
		<div>
			안녕하세요 ${sName}(${sMid}) 님!<br />
			<table class="table table-bordered mt-3">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
				<tr>
					<td>보유 포인트</td>
					<td>${sPoint}</td>
				</tr>
				<tr>
					<td>최종 접속일</td>
					<td>${fn:substring(sLastDate,0,16)}</td>
				</tr>
				<tr>
					<td>오늘 방문 횟수</td>
					<td>${sTodayCount}</td>
				</tr>
			</table>
			<img width="200px" src="${ctp}/images/1.jpg" alt="" class="mt-3">
		</div>
		<hr />
		<div class="text-right">
			<a href="${ctp}/database/Logout" class="btn btn-dark">로그아웃</a>
		</div>
	</div>
</body>
</html>