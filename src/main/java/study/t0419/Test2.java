package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Test2 extends HttpServlet {
	// 서버에 요청하고 응답받기 위한 준비
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {
		PrintWriter out = response.getWriter();
		out.println("Servlet에서의 출력입니다.");
		out.println("Welcome to Servlet !");
	}
}
