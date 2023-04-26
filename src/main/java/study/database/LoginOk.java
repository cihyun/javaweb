package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginCheck(mid, pwd);
		
		// 브라우저에 띄울거면 PrintWriter를 생성해야 한다.
		PrintWriter out = response.getWriter();
		if(vo.getName() != null) {
			// 회원 인증 성공 시 처리
			out.print("<script>");
			out.print("alert('안녕하세요 "+mid+" 님!');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/memberMain.jsp';");
			out.print("</script>");
			
			// 방문 포인트 처리, 최종접속일, 방문카운트도 함께 처리
			/* 
			 DB의 최종 접속일(10자리)와 시스템날짜(10자리)를 비교하여 같으면 todayCount = vo.getTodayCount()+1,
			 같지 않으면 todayCount = 0
			 dao.setPointPlus(mid, todayCount);
			 포인트 변수에서도 똑같이 5이상이 되면 getPointPlus()+10 , 아니면 그냥 getPoint
			 */
			dao.setPointPlus(mid);
			
			// 회원 인증 후 처리 (1. 자주 사용하는 자료를 세션에 저장한다. id, 성명)
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint()+10);
			session.setAttribute("sLastDate", vo.getLastDate());
			session.setAttribute("sTodayCount", vo.getTodayCount()+1);
			
		} else {
			// 회원 인증 실패 시 처리
			out.print("<script>");
			out.print("alert('로그인 실패!');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';");
			out.print("</script>");
		}
	}
}
