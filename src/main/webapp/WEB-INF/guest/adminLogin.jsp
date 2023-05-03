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
	<h3>관리자 로그인</h3>
	<form name="myform" method="post" class="mt-3" action="${ctp}/AdminLoginOk.gu">
		<table class="table table-bordered">
			<colgroup>
				<col width="30%">
				<col width="*">
			</colgroup>
			<tr>
				<th>관리자 아이디</th>
				<td><input type="text" name="mid" id="mid" class="form-control" required /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" id="pwd" class="form-control" required /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="관리자로그인" class="btn btn-success" />
					<input type="reset" value="다시입력" class="btn btn-warning" />
					<input type="submit" value="돌아가기" onclick="location.href='${ctp}/GuestList.gu';" class="btn btn-secondary" />
				</td>
			</tr>
		</table>
	</form>		
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>