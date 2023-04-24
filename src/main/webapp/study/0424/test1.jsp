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
	<h2>회원정보</h2>
	<hr />
		<%-- <form name="myform" method="post" action="<%=request.getContextPath()%>/t0424/Test1OK"> --%>
		<form name="myform" method="post" action="${pageContext.request.contextPath}/t0424/Test1OK">
			<p>
				성명 : <input type="text" name="name" value="현채이	" autofocus class="form-control">
			</p>	
			<p>
				나이 : <input type="number" name="age" value="20" class="form-control">
			</p>	
			<p>
				성별 : 
				<input type="radio" name="gender" value="남자" class="ml-2"> 남자
				<input type="radio" name="gender" value="여자" class="ml-2" checked> 여자
			</p>	
			<p>
				직업 : 
				<select name="job" class="form-control">
					<option>학생</option>
					<option>군인</option>
					<option>회사원</option>
					<option>공무원</option>
					<option>프리랜서</option>
					<option>기타</option>
				</select>
			</p>	
			<p>
				주소 : <input type="text" name="address" value="청주" class="form-control">
			</p>	
			<p>
				<input type="submit" value="전송" class="btn btn-primary">
			</p>	
		</form>	
	</div>
</body>
</html>