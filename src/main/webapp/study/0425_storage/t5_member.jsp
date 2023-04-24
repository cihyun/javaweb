<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
	if(mid.equals("")) {
		out.print("<script>");
		out.print("alert('로그인 후 사용하세요')");
		out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t5_Login.jsp'");
		out.print("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
	<div class="container mt-5">
	<h2>이곳은 회원방입니다.</h2>
	<hr />
		<div>
			${sMid} 님이 로그인중입니다.
		</div>
	<hr />
	<p><a href="<%=request.getContextPath()%>/t0424/T5_LoginOut" class="btn btn-warning">로그아웃</a></p>	
	</div>
</body>
</html>