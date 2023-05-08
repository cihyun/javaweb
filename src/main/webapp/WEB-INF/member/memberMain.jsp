<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<div class="container mt-5">
	<h3>마이페이지</h3>
	<table class="table table-bordered">
	<colgroup>
		<col width="20%" />
		<col width="80%" />
	</colgroup>
		<tr>
			<td colspan="2"><font color="blue">${sNickName} (${sLevel})</font> 님 로그인 중입니다.</td>
		</tr>
		<tr>
			<td>누적포인트</td>
			<td>${point}</td>
		</tr>
		<tr>
			<td>총 방문횟수</td>
			<td>${visitCnt}</td>
		</tr>
		<tr>
			<td>오늘 방문횟수</td>
			<td>${todayCnt}</td>
		</tr>
		<tr>
			<td>방명록 등록 횟수</td>
			<td></td>
		</tr>
		<tr>
			<td>회원사진</td>
			<td><img src="${ctp}/images/member/${photo}" width="200px" /></td>
		</tr>
	</table>
		
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>