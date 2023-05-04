<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>password2.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<div class="container mt-5">
	<h3>SHA 암호화 결과</h3>
	<div>
		사용자 아이디 : ${mid}<br />
		입력한 비밀번호 : ${pwd}<br />
		===================================<br />
		SHA 암호화된 비밀번호(DB에 저장시킨 비밀번호) : ${shaPwd}<br />
	</div>
	<hr />
	<div>
		<a href="${ctp}/Password.st" class="btn btn-secondary">돌아가기</a>
	</div>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>