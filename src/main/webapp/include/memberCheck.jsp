<!-- memberCheck.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	String memberMid = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
	if(memberMid.equals("")) {
%>
	<script>
		location.href="${ctp}/study/0428_database/login.jsp"
	</script>
<%} %>