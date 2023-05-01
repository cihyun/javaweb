<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="container mt-5">
	<h3>이곳은 /WEB-INF/study2/mapping/test2.jsp</h3>
	<img alt="" src="${ctp}/images/2.jpg" width="300px">
	<hr />
	<p class="mt-3">
		<a href="${ctp}/mapping/Test1" class="btn btn-success">test1.jsp로 가기</a>
		<a href="${ctp}/mapping/Test2" class="btn btn-info">test2.jsp로 가기</a>
		<a href="${ctp}/mapping/Test4?su1=100&su2=50" class="btn btn-warning">test3.jsp로 가기</a>
	</p>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>