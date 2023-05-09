package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardGoodCheckCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		// 좋아요 1회 증가시키기
		HttpSession session = request.getSession();
		ArrayList<String> goodIdx = (ArrayList<String>) session.getAttribute("sGoodIdx");
		
		if(goodIdx ==null) {
			goodIdx = new ArrayList<String>();
		}

		String imsiGoodIdx = "board" + idx;
		if(!goodIdx.contains(imsiGoodIdx)) {
			dao.setGoodUpadate(idx);
			goodIdx.add(imsiGoodIdx);
		}
		
		session.setAttribute("sGoodIdx", goodIdx);
		
		BoardVO vo = dao.getBoardContent(idx);
		request.setAttribute("vo", vo);
	}

}
