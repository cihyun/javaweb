<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
<style type="text/css">
	th {
		text-align:center;
		background-color:#eee;
	}
</style>
<script type="text/javascript">
	'use strict';
	
	function goodCheck() {
		location.href="${ctp}/BoardGoodCheck.bo?idx=${vo.idx}";
	}
</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<div class="container mt-5">
	<h3>게시판 상세페이지</h3>
	<table class="table table-bordered mt-5">
		<colgroup>
			<col width="15%" />
			<col width="20%" />
			<col width="15%" />
			<col width="25%" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<th>작성자</th>
			<td>${vo.nickName}</td>
			<th>작성일</th>
			<td>${fn:substring(vo.wDate,0,fn:length(vo.wDate)-2)}</td>
			<th>조회수</th>
			<td>${vo.readNum}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="5">${vo.title}</td>
		</tr>
		<tr>
			<th>email</th>
			<td colspan="5">${vo.email}</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td colspan="5">${vo.homePage}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5">${fn:replace(vo.content, newLine, "<br />")}</td>
		</tr>
		<tr>
			<th>좋아요</th>
			<td colspan="5">
				${vo.good}<a href="javascript:goodCheck()"> ❤</a>
			</td>
		</tr>
	</table>
	<div class="text-right">
		<input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardList.bo';" class="btn btn-dark mb-3">
	</div>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>