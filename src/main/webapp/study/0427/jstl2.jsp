<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
	<div class="container mt-5">
		<h2>JSTL(Java Standard Tag Library)</h2>
		<h3>반복처리(Core라이브러리를 사용 - forEach)</h3>
		<pre class="mt-5">
			사용법1 : < c : forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수" />
				    < / c : forEach>
			사용법2 : < c : forEach var="변수" items="$ { 배열/객체명}" varStatus="매개변수" />
				    < / c : forEach>
			사용법3 : < c : forTokens var="변수" items="$ { 배열/객체명}" delims="구분기호" />
				    < / c : forTokens>
		</pre>
		<hr />
		<p class="mb-5"></p>
		<p>
			사용예 1-1 : <br />
			<c:forEach var="i" begin="1" end="10" step="1">
				${i}. 안녕 / 
			</c:forEach>
		</p>
		<p>
			사용예 1-2 : <br />
			<c:forEach var="i" begin="5" end="10" step="1" varStatus="st">
				${i} : ${st.index} : ${st.count} : ${st.first} : ${st.last} 안녕 / 
			</c:forEach>
		</p>
		<p>
			사용예 2-1 : <br />
			<%
				String[] cards = {"국민","BC","농협","현대","신한"};
				pageContext.setAttribute("cards", cards);
			%>
			<c:forEach var="card" items="${cards}">
				${card} /
			</c:forEach>
		</p>
		<p>
			사용예 2-2 : <br />
			<c:forEach var="card" items="${cards}" varStatus="st">
				${st.index}.${card} /
				<%-- S{st.count}.${card} / --%>
			</c:forEach>
		</p>
		<%
			String hobbys = "등산/낚시/볼링/농구/영화감상/게임";
			pageContext.setAttribute("hobbys", hobbys);
		%>
		<p>
			사용예 3-1 : <br />
			<c:forTokens var="hobby" items="${hobbys}" delims="/">
				${hobby} : 
			</c:forTokens>
		</p>
		<p>
			사용예 3-2 : <br />
			<c:forTokens var="hobby" items="${hobbys}" delims="/" varStatus="st">
				${st.count}.${hobby} : 
			</c:forTokens>
		</p>
		<hr />
		<p>
			문제 1: 전송된 취미 중에서 '농구'는 빨간색, '볼링'은 파란색, 나머지는 그대로 출력하시오.<br />
			<c:forTokens var="hobby" items="${hobbys}" delims="/">
				<c:if test="${hobby=='농구'}"><font color="red">${hobby}</font></c:if>
				<c:if test="${hobby=='볼링'}"><font color="blue">${hobby}</font></c:if>
			</c:forTokens>
		</p>
		<hr />
		<h3>구구단 연습</h3>
		<c:forEach var="i" begin="1" end="9">
			7 * ${i} = ${7 * i}<br />
		</c:forEach>
		<hr />
		<h3>이중 forEach문을 활용한 구구단</h3>
		<c:forEach var="dan" begin="2" end="7">
			${dan}단 <br />
			<c:forEach var="j" begin="1" end="9">
				${dan} * ${j} = ${dan * j} <br />
			</c:forEach>
		</c:forEach>
		<hr />
		<h3>그림 6장을 1줄에 3장씩 찍어 보자 ! </h3>
		<c:forEach var="i" begin="1" end="6">
			<img src="${pageContext.request.contextPath}/images/${i}.jpg" width="100px" /> &nbsp;
			<c:if test="${i==3}"><br /><br /></c:if>
		</c:forEach>
		<h3>그림 6장을 1줄에 3장씩 찍어 보자 ! </h3>
		<c:set var="cnt" value="0" />
		<c:forEach var="i" begin="1" end="2">
			<c:forEach var="j" begin="1" end="3">
				<c:set var="cnt" value="${cnt+1}" />
				<img src="${pageContext.request.contextPath}/images/${cnt}.jpg" width="100px" /> &nbsp;
			</c:forEach>
		</c:forEach>
	</div>
</body>
</html>