<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
<script>
	'use strict';
	
	alert("${msg}");
	location.href= '${url}';
</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<div class="container mt-5">
	<h3></h3>
		
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>