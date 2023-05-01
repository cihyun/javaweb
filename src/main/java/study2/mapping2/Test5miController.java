package study2.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.mapping.Test5Service;

@SuppressWarnings("serial")
//@WebServlet("/mapping/Test5.do")
@WebServlet("*.mi")
public class Test5miController extends HttpServlet {
	@SuppressWarnings("unused")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* frontController */
		Test5miInterface command = null;
		String viewPage = "/WEB-INF/study2/mapping2";

		// 경로 가져옴
		String uri = request.getRequestURI();
		
		// 확장자 
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/Test5")) {
			viewPage += "/test5.jsp";
		}
		else if(com.equals("/Test5_2")) {
			viewPage += "/test5_2.jsp";
		}
		else if(com.equals("/Test5_3")) {
			command = new TestDanCommand();
			command.execute(request, response);
			viewPage += "/test5_3.jsp";
		}
		// 메세지 처리 하는 애
		else if(com.equals("/Test5_4")) {
			command = new Test5MsgCommand();
			command.execute(request, response);
			viewPage += "/test5_4.jsp";
		}
		else if(com.equals("/Test5_5")) {
			command = new Test5miCommand();
			command.execute(request, response);
			viewPage += "/test5_5.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
