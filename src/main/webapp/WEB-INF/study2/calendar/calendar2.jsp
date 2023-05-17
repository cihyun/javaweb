<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>calendar.jsp</title>
<jsp:include page="/include/bs4.jsp" />
</head>

<body>
<jsp:include page="/include/header.jsp" />
<div class="container mt-5">
	<h3>달력</h3>
	<hr />
	<div class="text-center">
		<button type="button" onclick="location.href='${ctp}/Calendar2.st?yy=${yy-1}&mm=${mm}';" class="btn- btn-secondary btn-sm" title="이전년도">◁◁</button>
		<button type="button" onclick="location.href='${ctp}/Calendar2.st?yy=${yy}&mm=${mm-1}';" class="btn- btn-secondary btn-sm mr-3" title="이전월">◀</button>
		<font size="5"> ${yy}년 ${mm+1}월 </font>
		<button type="button" onclick="location.href='${ctp}/Calendar2.st?yy=${yy}&mm=${mm+1}';" class="btn- btn-secondary btn-sm ml-3" title="다음월">▶</button>
		<button type="button" onclick="location.href='${ctp}/Calendar2.st?yy=${yy+1}&mm=${mm}';" class="btn- btn-secondary btn-sm" title="다음년도">▷▷</button>
		<button type="button" onclick="location.href='${ctp}/Calendar2.st';" class="btn- btn-secondary btn-sm ml-3" title="홈으로">홈</button>
	</div>
	<div class="text-center mt-3">
		<table class="table table-bordered" id="calTable">
			<tr>
				<th class="su">일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th class="sa">토</th>
			</tr>
			<tr>
				<!-- 
					시작일 이전을 공백처리한다.(오늘이 월요일이면 startWeek가 2이기에 1칸을 공백처리한다.
					<c:set var="gap" value="1" />
					<c:forEach begin="1" end="${startWeek - 1}">
						<td>&nbsp;</td>
						<c:set var="gap" value="${gap + 1}" />
					</c:forEach>
				 -->
				
				<!-- 시작월 이전의 공백을 이전달의 날짜로 채워준다. -->
				<c:set var="gap" value="${1}"/>
				<c:forEach var="prevDay" begin="${preLastDay - (startWeek - 2)}" end="${preLastDay}" varStatus="st">
					<td class="preNext">${prevYear}-${prevMonth+1}-${prevDay}</td>
					<c:set var="gap" value="${gap+1}" />
				</c:forEach>
				
				
				<!-- 해당월에 대한 첫째 주 날짜부터 출력하되, gap이 7이되면 줄바꿈 한다. -->
				<c:forEach begin="1" end="${lastDay}" varStatus="st">
				<c:set var="todaySw" value="${toYear==yy && toMonth==mm && toDay==st.count ? 1 : 0}" />
					<td id="td${gap}" ${todaySw==1 ? 'class=today' : ''}>${st.count}</td>
					<c:if test="${gap % 7 == 0}"></tr><tr></c:if>
					<c:set var="gap" value="${gap + 1}" />
				</c:forEach>
				
				
				<!-- // 마지막 일 이후의 다음달의 시작일자부터 채워준다. -->
				<c:forEach var="nextDay" begin="${nextStartWeek}" end="7" varStatus="st">
					<td class="preNext">${nextYear}-${nextMonth+1}-${st.count}</td>		
				</c:forEach>
			</tr>
		</table>
	</div>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>