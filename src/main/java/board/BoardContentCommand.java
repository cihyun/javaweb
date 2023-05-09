package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		// 조회수 1회 증가시키기(중복방지 처리 - 세션사용 : board+고유번호 값을 객체배열에 담음)
		HttpSession session = request.getSession();
		ArrayList<String> contentIdx = (ArrayList<String>) session.getAttribute("sContentIdx");
		
		if(contentIdx ==null) {
			contentIdx = new ArrayList<String>();
		}

		String imsiContentIdx = "board" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			dao.setReadNumUpadate(idx);
			contentIdx.add(imsiContentIdx);
		}
		
		session.setAttribute("sContentIdx", contentIdx);
		
		BoardVO vo = dao.getBoardContent(idx);
		request.setAttribute("vo", vo);
		
	}

}
