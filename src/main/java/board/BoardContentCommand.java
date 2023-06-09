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
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
		String search = request.getParameter("search")== null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")== null ? "" : request.getParameter("searchString");		
		
		BoardDAO dao = new BoardDAO();
		
		// 조회수 1회 증가시키기(중복방지 처리 - 세션사용 : board+고유번호 값을 객체배열에 담음)
		HttpSession session = request.getSession();
		ArrayList<String> contentIdx = (ArrayList<String>) session.getAttribute("sContentIdx");
		
		if(contentIdx ==null) {
			contentIdx = new ArrayList<String>();
		}

		String imsiContentIdx = "board" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			dao.setReadNumUpdate(idx);
			contentIdx.add(imsiContentIdx);
		}
		session.setAttribute("sContentIdx", contentIdx);
		
		// 현재 선택된 게시글(idx)의 전체 내용물 가져오기
		BoardVO vo = dao.getBoardContent(idx);
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("flag", flag);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
		// 이전글과 다음글 처리
		BoardVO preVo = dao.getPreNextSearch(idx,"preVo");
		BoardVO nextVo = dao.getPreNextSearch(idx,"nextVo");
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
		
		// 현재 부모글에 있는 댓글 가져오기
		ArrayList<BoardReplyVO> replyVos = dao.getBoardReply(idx);
		request.setAttribute("replyVos", replyVos);
	}

}
