package study.t0420;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/Test_ExOk")
public class Test_ExOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int su = Integer.parseInt(null);
		String strSu = "";
		
		
	  	
	  	
	  	
//	  	PrintWriter out = response.getWriter();
//	  	out.println("<script>");
//	  	out.println("alert('자료가 저장되었습니다.');");
//	  	out.println("location.href='"+request.getContextPath()+"/study/0420/test3.jsp';");
//	  	out.println("</script>");
	  	
	  	// DB에 자료 저장 후 view로 이동하기
	  	response.sendRedirect(request.getContextPath()+"/study/0420/test3Res.jsp?=name");
//	  	RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/test3Res.jsp;");
//	  	dispatcher.forward(request, response);
	}
}
