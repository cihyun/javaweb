<!-- t1_CookiesMidDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("cMid")){
			cookies[i].setMaxAge(0);		// 쿠키의 만료시간을 0으로 설정하여 쿠키를 제거시킨다.
		  	response.addCookie(cookies[i]);
		}
	}
%>
<script>
  alert("쿠키에 저장된 아이디 삭제 완료!");
  location.href = "t1_CookiesMain.jsp";
</script>