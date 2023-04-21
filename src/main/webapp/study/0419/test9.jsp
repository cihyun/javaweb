<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<div class="container mt-5">
	<form action="test9Ok.jsp" name="myform" method="post">
	<table class="table">
		<tr>
			<th colspan="2"><h2>로그인</h2></th>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="mid" class="form-control" autofocus /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd" class="form-control" /></td>
		</tr>
		<tr>
			<th colspan="2" class="text-center">
				<input type="submit" value="로그인" class="btn btn-primary" />
				<input type="reset" value="취소" class="ml-2 btn btn-danger" />
			</th>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>