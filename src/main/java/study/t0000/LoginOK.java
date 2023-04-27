package study.t0000;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
		String rememberId = request.getParameter("rememberId")==null ? "off" : "on";
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if(mid.equals("admin") && pwd.equals("1234") || (mid.equals("hci89") && pwd.equals("1234"))) {
			session.setAttribute("sMid", mid);
			
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");		// 웹 어플리케애션의 '전체(요청)경로'에서 사용(포함)하고자 할때는 '/'로 지정한다.
			if(rememberId.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7); 	// 쿠키의 만료시간을 7일로 설정
			}
			else {
				cookieMid.setMaxAge(0); 	
			}
			response.addCookie(cookieMid);
			
			// 방문 횟수 카운트하기
			ServletContext application = request.getServletContext();
			int totalVisitCount = application.getAttribute("totalVisitCount") == null ? 0 : (int)application.getAttribute("totalVisitCount");
			application.setAttribute("totalVisitCount", totalVisitCount+1);
			
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
