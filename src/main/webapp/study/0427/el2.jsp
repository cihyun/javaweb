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
		<h2>폼을 통해서 넘어온 자료 출력</h2>
		<hr />
		<div> 성명 : ${name}</div>
		<div> 취미 : ${hobbys}</div>
		${hobbys[0]} / ${hobbys[1]}
	
		<p><a href="${pageContext.request.contextPath}/study/0427/form2.jsp" class="btn btn-info mt-3">돌아가기</a></p>
	</div>
</body>
</html>