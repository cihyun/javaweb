<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	
<script>
	function fCheck1() {
		fimg1 = "<img src='../../images/1.jpg'>";
		demo.innerHTML = fimg1;
	}
</script>
</head>
<body>
	<div class="container mt-5">
	<h4>콤보상자에 숫자 1~6까지를 기억 시키고 화면에 보여준다.</h4>
		<p>
			이때 숫자를 선택하면 아래쪽(demo)으로 선택한 숫자의 그림파일을 출력한다.<br />
			<select class="mt-5">
				<option value="">1</option>
				<option value="">2</option>
				<option value="">3</option>
				<option value="">4</option>
				<option value="">5</option>
			</select>
		</p>
		<hr />
		<div id="demo"></div>
	</div>
</body>
</html>