<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<style type="text/css">
		.log {
			text-align: center;
			font-size: 18px;
			background-color: #99ccff;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div class="container mt-5">
		<h3></h3>
		<form name="myform" method="post" action="${ctp}/database/LoginOk">
			<table class="table batle-bordered">
				<tr>
					<td colspan="2" class="log">로그인</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid" autofocus required class="form-control"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" required class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
					<input type="submit" value="로그인" class="btn btn-success">
					<input type="reset" value="다시입력" class="btn btn-warning">
					<input type="button" value="회원가입" onclick="location.href='join.jsp';" class="btn btn-info">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>