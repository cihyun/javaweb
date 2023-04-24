<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name")== null ? "" : request.getParameter("name");
	int age = request.getParameter("age")== null ? 0 : Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender")== null ? "" : request.getParameter("gender");
	String job = request.getParameter("job")== null ? "" : request.getParameter("job");
	String address = request.getParameter("address")== null ? "" : request.getParameter("address");
	
	pageContext.setAttribute("name", name);
	pageContext.setAttribute("age", age);
	pageContext.setAttribute("gender", gender);
	pageContext.setAttribute("job", job);
	pageContext.setAttribute("address", address);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2OK2.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
	<div class="container mt-5">
	<h3>처리된 자료를 view에 출력시켜 본다.</h3>
		<table class="table table-boarded">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<th>성명</th>
				<td>${name}</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>${age}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${gender}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>${job}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${address}</td>
			</tr>
		</table>
		<a href="test2.jsp">돌아가기</a>
	</div>
</body>
</html>