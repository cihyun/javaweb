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
		<h2>성적 자료</h2>
		<form name="myform" method="post" action="<%=request.getContextPath()%>/t0423/Test1Ok">
			<p>성명 : <input type="text" name="name" value="현채이" class="form-control"></p>
			<p>학번 : <input type="text" name="hakbun" value="A1234" class="form-control"></p>
			<hr />
			<p>국어 : <input type="number" name="kor" value="94" class="form-control"></p>
			<p>영어 : <input type="number" name="eng" value="98" class="form-control"></p>
			<p>수학 : <input type="number" name="mat" value="96" class="form-control"></p>
			<p>사회 : <input type="number" name="soc" value="99" class="form-control"></p>
			<p>과학 : <input type="number" name="sci" value="97" class="form-control"></p>
			<p>
				<input type="submit" value="전송" class="btn btn-info">
				<input type="reset" value="다시입력" class="btn btn-danger">
			</p>
		</form>
	</div>
</body>
</html>