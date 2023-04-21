<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test1ResJaje.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
	<div class="container mt-5">
		<h2>이곳은 자재과 화면입니다.</h2>
		<p>아이디 : <%=mid %></p>
		<input type="button" class="mt-3 btn btn-info" value="돌아가기" onclick="location.href='test1.jsp';">
	</div>
</body>
</html>