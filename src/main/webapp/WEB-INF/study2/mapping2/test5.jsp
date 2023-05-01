<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test5.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
<script type="text/javascript">
	'use strict';
	
	function gugudan(){
		let dan = document.getElementById("dan").value;
		location.href = "${ctp}/Test5_3.mi";
	}
	
</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="container mt-5">
	<h3>이곳은 test5.jsp</h3>
	<img alt="" src="${ctp}/images/e.png">
	<hr />
	<p class="mt-4">
		<a href="${ctp}/mapping2/Test5.mi" class="btn btn-dark">test5 호출</a>
		<a href="${ctp}/mapping2/Test5_2.mi" class="btn btn-success">test5_2 호출</a>
		<a href="${ctp}/mapping2/Test5_3.mi" class="btn btn-info">test5_3 호출</a>
		<a href="${ctp}/mapping2/Test5_4.mi" class="btn btn-warning">test5_4 호출</a>
		<a href="${ctp}/mapping2/Test5_5.mi" class="btn btn-danger">test5_5 호출</a>
	</p>
	<div>
		<form name="myform" method="post" action="${ctp}/Test5_5.mi">
			<div>
				첫번째 수: <input type="number" name="su1" value="1" class="form-control col-3">
			</div>
			<div>
				연산자 : 
				<select name="op" class="form-control col-3">
					<option selected>+</option>
					<option>-</option>
					<option>*</option>
					<option>/</option>
					<option>%</option>
				</select>
			</div>
			<div>
				두번째 수: <input type="number" name="su2" value="1" class="form-control col-3">
			</div>
			<div>
				<input type="submit" value="계산" class="btn btn-success mt-3">
			</div>
		</form>
		<hr />
		<div class="row">
			출력할 단을 입력하세요 : 
			<input type="number" name="dan" id="dan" value="2" class="col-2 form-control">
			<input type="button" value="구구단출력(5_3)" onclick="gugudan()" class="col-2 btn btn-secondary ml-2">
		</div>
	</div>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>