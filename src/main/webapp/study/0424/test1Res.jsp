<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
	<div class="container mt-5">
	<h2>처리된 자료를 view에 출력시켜 본다.</h2>
		<table class="table table-boarded">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<th>성명</th>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>${vo.age}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${vo.gender}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>${vo.job}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${vo.address}</td>
			</tr>
		</table>
		<a href="<%=request.getContextPath()%>/study/0424/test1.jsp">돌아가기</a>
	</div>
</body>
</html>