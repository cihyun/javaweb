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
	<h3>API 연습</h3>
	<hr />
	<p>
		<a href="${ctp}/CrimeApi.st" class="btn btn-success form-control">경찰청_전국 경찰서별 강력범죄 발생 현황</a>
	</p>
	<hr />
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>