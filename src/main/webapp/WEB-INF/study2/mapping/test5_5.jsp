<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test5_5.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="container mt-5">
	<h3>이곳은 test5_5.jsp</h3>
	<img alt="" src="${ctp}/images/d.png">
	<hr />
	<p class="mt-4">
		<a href="${ctp}/mapping/Test5.do" class="btn btn-dark">test5 호출</a>
		<a href="${ctp}/mapping/Test5_2.do" class="btn btn-success">test5_2 호출</a>
		<a href="${ctp}/mapping/Test5_3.do" class="btn btn-info">test5_3 호출</a>
		<a href="${ctp}/mapping/Test5_4.do" class="btn btn-warning">test5_4 호출</a>
		<a href="${ctp}/mapping/Test5_5.do" class="btn btn-danger">test5_5 호출</a>
	</p>
	<hr />
	<div>
		<h4>연산결과</h4>
		<div>${su1} ${op} ${su2} = ${res}</div>
	</div>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>