<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>scheduleList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<div class="container">
  <div class="text-center mt-5">
	  <button type="button" onclick="location.href='${ctp}/ScheduleList.sc?yy=${yy-1}&mm=${mm}';" class="btn btn-secondary btn-sm" title="이전년도">◁◁</button>
	  <button type="button" onclick="location.href='${ctp}/ScheduleList.sc?yy=${yy}&mm=${mm-1}';" class="btn btn-secondary btn-sm mr-2" title="이전월">◀</button>
	  <font size="5">${yy}년 ${mm+1}월</font>
	  <button type="button" onclick="location.href='${ctp}/ScheduleList.sc?yy=${yy}&mm=${mm+1}';" class="btn btn-secondary btn-sm ml-2" title="다음월">▶</button>
		<button type="button" onclick="location.href='${ctp}/ScheduleList.sc?yy=${yy+1}&mm=${mm}';" class="btn btn-secondary btn-sm" title="다음년도">▷▷</button>
		<button type="button" onclick="location.href='${ctp}/ScheduleList.sc';" class="btn btn-secondary btn-sm" title="오늘날짜">홈</button>
  </div>
  <br/>
  <div class="text-center mt-3">
    <table class="table table-bordered" style="height:450px" id="calTable">
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
      	<!-- 시작월 이전의 공백을 이던달의 날짜로 채워준다. -->
      	<c:set var="gap" value="${1}"/>
      	<c:forEach var="prevDay" begin="${preLastDay - (startWeek - 2)}" end="${preLastDay}" varStatus="st">
      	  <td class="preNext">${prevYear}-${prevMonth+1}-${prevDay}</td>
	      	<c:set var="gap" value="${gap + 1}"/>
      	</c:forEach>
      	
      	<!-- 해당월에 대한 첫째주 날짜부터 출력하되, gap이 7이되면 줄바꿈한다. -->
      	<c:forEach begin="1" end="${lastDay}" varStatus="st">
      	  <c:set var="todaySw" value="${toYear==yy && toMonth==mm && toDay==st.count ? 1 : 0}" />
      	  <td id="td${gap}" class="${todaySw==1 ? 'today' : gap % 7 == 0 ? 'sa' : gap % 7 == 1 ? 'su' : ''}">
      	    <c:set var="ymd" value="${yy}-${mm+1}-${st.count}"/>
      	    <a href="${ctp}/ScheduleMenu.sc?ymd=${ymd}">
	      	    ${st.count}<br/>
	      	    
	      	    <!-- 해당날짜에 일정이 있다면 part를 출력하게 한다. -->
	      	    <c:set var="tempPart" value=""/>
            	<c:set var="tempCnt" value="0"/>
            	<c:set var="tempSw" value="0"/>
            	
	      	    <c:forEach var="vo" items="${vos}">
	      	      <c:if test="${fn:substring(vo.sDate,8,10)==st.count}">
	      	      
	        	      <c:if test="${vo.part != tempPart}">
                    <c:if test="${tempSw != 0}">
	                    - ${tempPart}(${tempCnt})건<br/>
	                    <c:set var="tempCnt" value="0"/>
                    </c:if>
                    <c:set var="tempPart" value="${vo.part}"/>                  
                  </c:if>
                  <c:set var="tempSw" value="1"/>
                  <c:set var="tempCnt" value="${tempCnt + 1}"/>
                  
	        	    </c:if>
	      	    </c:forEach>
	      	    <c:if test="${tempCnt != 0}">- ${tempPart}(${tempCnt})건</c:if>
      	    </a>
      	  </td>
      	  <c:if test="${gap % 7 == 0}"></tr><tr></c:if>
      	  <c:set var="gap" value="${gap + 1}"/>
      	</c:forEach>
      	
      	<!-- 마지막일 이후를 다음달의 시작일자부터 채워준다. -->
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