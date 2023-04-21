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
	<p>성명 : ${vo.name}</p>
	<p>학번 : ${vo.hakbun}</p>
	<hr />
	<p>국어 : ${vo.kor}</p>
	<p>영어 : ${vo.eng}</p>
	<p>수학 : ${vo.mat}</p>
	<p>과학 : ${vo.soc}</p>
	<p>사회 : ${vo.sci}</p>
	<hr />
	<p>총점 : ${vo.tot}</p>
	<p>평균 : ${vo.avg}</p>
	<p>학점 : ${vo.grade}</p>
	<hr />
	<input type="button" class="mt-3 btn btn-secondary" value="돌아가기" onclick="<%=request.getContextPath()%>/study/0423/test2.jsp">
	</div>
</body>
</html>