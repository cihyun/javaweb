package study.t0000;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/t0000/LoginOK")
public class LoginOK extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")== null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")== null ? "" : request.getParameter("pwd");
		String rememberId = request.getParameter("rememberId");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if(mid.equals("admin") && pwd.equals("1234") || (mid.equals("hci89") && pwd.equals("1234"))) {
			session.setAttribute("sMid", mid);
			
			out.print("<script>");
			out.print("alert('"+mid+" 님 로그인 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0000/mypage.jsp'");
			out.print("</script>");
			
		} else {
			out.print("<script>");
			out.print("alert('아이디와 비밀번호를 확인하세요');");
			out.print("location.href='"+request.getContextPath()+"/study/0000/login.jsp'");
			out.print("</script>");
		}
	}
}
