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
	<h3>방명록쓰기</h3>
	<form name="myform" method="post" class="was-validated mt-4" action="${ctp}/GuestInputOk.gu">
		<div class="form-group">
			<label for="name">성명</label>
			<input type="text" class="form-control" id="name" placeholder="Enter username" name="name" required />
			<div class="valid-feedback">Ok.</div>
			<div class="invalid-feedback">성명을 입력하세요.</div>
		</div>
		<div class="form-group">
			<label for="uname">E-mail</label>
			<input type="text" class="form-control" id="email" placeholder="Enter email" name="email" />
		</div>
		<div class="form-group">
			<label for="uname">HomePage</label>
			<input type="text" class="form-control" id="homePage" placeholder="Enter homePage" name="homePage" value="https://"/>
		</div>
		<div class="form-group">
			<label for="pwd">방문소감</label>
			<textarea rows="5" name="content" id="content" class="form-control" required></textarea>
			<div class="valid-feedback">Ok.</div>
			<div class="invalid-feedback">방문 소감을 입력해주세요.</div>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="reset" class="btn btn-warning">다시작성</button>
			<button type="submit" onclick="location.href='${ctp}/GuestList.gu';" class="btn btn-secondary">돌아가기</button>
		</div>
		<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr() %>">
	</form>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>