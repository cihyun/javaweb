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
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		
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
			
			request.setAttribute("msg", "좋아요!");
		}
		// 좋아요 감소 설정
		else {
			dao.setGoodDowndate(idx);
			goodIdx.remove(imsiGoodIdx);
			
			request.setAttribute("msg", "좋아요 해제!");
		}
		
		session.setAttribute("sGoodIdx", goodIdx);
		
		BoardVO vo = dao.getBoardContent(idx);
		request.setAttribute("vo", vo);

		request.setAttribute("url", request.getContextPath()+"/BoardContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		
	}

}
