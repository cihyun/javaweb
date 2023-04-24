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
		<form name="myform" method="post" action="<%=request.getContextPath()%>/t0424/T5_LoginOK">
		<h2>로그인</h2>
		<p>샘플 : admin(1234), hkd1234(1234)</p>
		<hr />
			<div class="mt-2">
				아이디 : <input type="text" name="mid" value="" class="form-control" autofocus />
			</div>
			<div class="mt-2">
				비밀번호 : <input type="password" name="pwd" value="1234" class="form-control" />
			</div>
			<div class="text-center mt-4">
				<input type="submit" value="로그인" class="btn btn-success" />
				<input type="reset" value="다시입력" class="btn btn-danger ml-2" />
			</div>
		</form>
	</div>
</body>
</html>