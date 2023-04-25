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
	<h2>ArrayList에 등록된 자료 출력하기</h2>
	<hr />
		<div>
			<div>vos : ${vos}</div>		
		</div>
		<hr />
		<div>
			<div>0. vo : ${vos[0]}</div>		
			<div>1. vo : ${vos[1]}</div>		
			<div>2. vo : ${vos[2]}</div>		
		</div>
		<hr />
		<div>
			0. vo의 자료들 : ${vos[0].name} / ${vos[0].age} / ${vos[0].gender} / ${vos[0].job} / ${vos[0].address}
		</div>
		<div><a href="${pageContext.request.contextPath}/t0427/El3" class="btn btn-info mt-4">돌아가기</a></div>
	</div>
</body>
</html>