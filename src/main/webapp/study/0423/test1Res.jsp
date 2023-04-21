<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test1Res.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
	<div class="container mt-5">
	<h2>성적 처리 결과</h2>
	<p>성명 : ${name}</p>
	<p>학번 : ${hakbun}</p>
	<hr />
	<p>국어 : ${kor}</p>
	<p>영어 : ${eng}</p>
	<p>수학 : ${mat}</p>
	<p>과학 : ${soc}</p>
	<p>사회 : ${sci}</p>
	<hr />
	<p>총점 : ${tot}</p>
	<p>평균 : ${avg}</p>
	<p>학점 : ${grade}</p>
	<hr />
	<input type="button" class="mt-3 btn btn-secondary" value="돌아가기" onclick="<%=request.getContextPath()%>/study/0423/test1.jsp">
	</div>
</body>
</html>