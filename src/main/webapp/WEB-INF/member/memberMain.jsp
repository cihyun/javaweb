<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>title</title>
<jsp:include page="/include/bs4.jsp" />
<style>
th {
	background-color: #eee;
}
</style>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<div class="container mt-5">
		<h3>마이페이지</h3>
		<table class="table table-bordered mt-3">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tr>
				<td colspan="4"><font color="blue"><b>${sNickName} ( ${sLevel} )</b></font> 님 안녕하세요!</td>
			</tr>
			<tr>
				<th>누적포인트</th>
				<td colspan="3">${point}</td>
			</tr>
			<tr>
				<th>오늘 방문횟수</th>
				<td>${todayCnt}</td>
				<th>총 방문횟수</th>
				<td>${visitCnt}</td>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td colspan="3"><img src="${ctp}/images/member/${photo}" width="200px" /></td>
			</tr>
		</table>
		<h3 class="mt-4">활동내역</h3>
		<table class="table table-bordered">
			<colgroup>
				<col width="15%" />
				<col width="85%" />
			</colgroup>
			<tr>
				<th>방명록 등록</th>
				<td>${guestCnt}</td>
			</tr>
			<tr>
				<th>게시판 등록</th>
				<td>
				<c:if test="${boardCnt == 0}">${boardCnt}</c:if>
	            <c:if test="${boardCnt != 0}"><a href="${ctp}/BoardSearchMember.bo">${boardCnt}</a></c:if>
				</td>
			</tr>
			<tr>
				<th>자료실 등록</th>
				<td>${pdsCnt}</td>
			</tr>
		</table>
	</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>