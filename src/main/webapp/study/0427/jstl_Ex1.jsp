<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl_Ex1.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
<style>
	.comboboxForm {
		width: 200px;
	}
</style>
<script>
	function imgSave() {
		let idx = document.getElementById("comboBox").value;
		let img = "<img width='300px' src='${pageContext.request.contextPath}/images/" + idx + ".jpg'>";
		demo.innerHTML = img;
	}
</script>
</head>
<body>
	<div class="container mt-5">
	<h4>콤보상자에 숫자 1~6까지를 기억 시키고 화면에 보여준다.</h4>
	<p>이때 숫자를 선택하면 아래쪽(demo)으로 선택한 숫자의 그림파일을 출력한다.</p><br />
	<div class="dropdown mt-2">
		<form name="myform" class="comboboxForm">
			<select id="comboBox" onchange="imgSave()" class="custom-select">
				<option selected>선택하세요 </option>
				<c:forEach begin="1" end="6" var="idx">
					<option value="${idx}">${idx}번</option>
				</c:forEach>
			</select>
		</form>
	</div>
	<hr />
	<div id="demo"></div>
	</div>
</body>
</html>