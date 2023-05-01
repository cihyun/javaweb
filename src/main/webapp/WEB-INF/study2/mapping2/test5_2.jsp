<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test5_2.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="container mt-5">
	<h3>이곳은 test5_2.jsp</h3>
	<img alt="" src="${ctp}/images/a.png">
	<hr />
	<p class="mt-4">
		<a href="${ctp}/mapping2/Test5.mi" class="btn btn-dark">test5 호출</a>
		<a href="${ctp}/mapping2/Test5_2.mi" class="btn btn-success">test5_2 호출</a>
		<a href="${ctp}/mapping2/Test5_3.mi" class="btn btn-info">test5_3 호출</a>
		<a href="${ctp}/mapping2/Test5_4.mi" class="btn btn-warning">test5_4 호출</a>
		<a href="${ctp}/mapping2/Test5_5.mi" class="btn btn-danger">test5_5 호출</a>
	</p>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>