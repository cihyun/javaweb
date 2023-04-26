<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl4.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
<style type="text/css">
	body {
		font-size: 18px;
	}
</style>
</head>
<body>
	<div class="container mt-5">
		<h3>Format 라이브러리</h3>
		<div>
			사용용도 : 형식 문자열을 지정할 때 사용한다.(쉼표, 화폐단위, 백분율)<br />
			사용법  : < fmt : 명령어 value = "$ { 값/변수 } " pattern ="표현패턴" type = "화폐단위" />
		</div>
		<hr />
<%
	int won = 7654321;
	double won2 = 7654.321;
	pageContext.setAttribute("won", won);
	pageContext.setAttribute("won2", won2);
%>
		<div>
		   1-1. 천단위 쉼표 표시 : <br />
				1234567 => <fmt:formatNumber value="1234567" /><br />
				7654321 => <fmt:formatNumber value="${won}" /><br />
				7654.321 => <fmt:formatNumber value="${won2}" /><br />
				7654.321 => <fmt:formatNumber value="${won2}" pattern="0,000,000.00" /><br />
				7654.321 => <fmt:formatNumber value="${won2}" pattern="#,##0.0" /><br />
	       1-2. 화폐단위 : <br />
				7654.321(원화) => <fmt:formatNumber value="${won}" type="currency" /><br />
				7654.321(US달러) => <fmt:formatNumber value="${won}" type="currency" currencyCode="USD" /><br />
				<c:set var="su1" value="0.9456" />
		
		   1-3. 백분율 : <br />
				0.9456 => <fmt:formatNumber value="${su1}" type="percent" />
		</div>
		<hr />
		<div>
			 2. 날짜<br />
			 	<c:set var="today" value="<%=new Date() %>" />
			 	오늘날짜 : ${today}<br />
			 	<fmt:formatDate value="${today}" /><br />
			 	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br />
			 	<fmt:formatDate value="${today}" pattern="hh : mm : ss"/><br />
			 	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss"/><br />
			 	<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/><br />
			 3. 국가별 설정(로케일)<br />
			 	톰캣 서버의 기본 로케일 : <%=response.getLocale() %><br />
			 	톰캣 서버의 기본 로케일 변경(미국식) :
			 	<fmt:setLocale value="en_US" /><fmt:formatNumber value="${won2}" type="currency"/><br />
		<hr />
			 4. URL 이동 : location.href = '';<br />
			 	<%-- jstl3.jsp로 이동하기 : <c:redirect url="jstl3.jsp"/> --%>
			 5. 절대경로 : <br />
			 	<img src="<%=request.getContextPath()%>/images/1.jpg" width="100px" /><br />
			 	<img src="${ctp}/images/1.jpg" width="100px" /><br />
			 6. import<br />
				<c:import url="/include/bs4.jsp" />
		</div>
	</div>
</body>
</html>