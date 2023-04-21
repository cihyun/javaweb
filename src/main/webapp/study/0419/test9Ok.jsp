<!-- test9Ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	
	// admin, hci89, 비밀번호:1234
	if(mid.equals("admin") || mid.equals("hci89") && pwd.equals("1234")) {
		System.out.println("회원 인증 성공");

		out.println("<script>");
		out.println("alert('회원 인증 성공!!!');");
		out.println("location.href='test9Success.jsp';");
		out.println("</script>");
	}

	else {
		System.out.println("가입할 수 없습니다.");
		out.println("<script>");
		out.println("alert('회원 인증 실패!!!');");
		out.println("location.href='test9.jsp';");
		out.println("</script>");
	}
%>