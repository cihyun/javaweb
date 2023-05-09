package study2.ajax;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.MemberDAO;
import member.MemberVO;

@SuppressWarnings("serial")
@WebServlet("/AjaxTest4")
public class AjaxTest4 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);

		HashMap<String, String> map = new HashMap<>();
		map.put("mid", vo.getMid());
		map.put("name", vo.getName());
		map.put("nickName", vo.getNickName());
		map.put("gender", vo.getGender());
		map.put("point", vo.getPoint()+"");
		
		// System.out.println("map : "+map);
		
		// HashMap 형식의 자료를 문자열로 변환
		
		// Json 형식의 자료를 사용하기 위해 Json 객체를 생성할 수 있게 하는 라이브러리 추가
		// 주소 : https://code.google.com/archive/p/json-simple/downloads : 첫번째 파일 다운로드
		// Json 형식의 자료로 변경, Map 형식의 자료를 저장할 Json 객체를 생성
		JSONObject memberObj = new JSONObject(map);
		System.out.println("memberObj : "+memberObj);
		
		
		// Json 객체를 문자열로 변경처리 - toJSONString();
		String str = memberObj.toJSONString();
		System.out.println("str : "+str);
		
		// vos 객체를 만들어서 JSON 객체로 저장하여 넘겨주고자 할 경우는 ? 
		// JSONArray jsonVOS = new JSONArray();
		// jsonVOS.add(memberObj);
		
		response.getWriter().write(memberObj.toString());
	}
}
