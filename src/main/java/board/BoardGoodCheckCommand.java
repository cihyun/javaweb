package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardGoodCheckCommand implements BoardInterface {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));

        BoardDAO dao = new BoardDAO();

        // 좋아요수 1회 증가시키기(좋아요수 중복방지처리 - 세션사용 : "'boardGood'+고유번호" 값을 객체배열(ArrayList)에 추가시킨다.)
        String sw = "0"; // 처음 0으로 셋팅하고, 처음 좋아요 버튼을 누르면 '1'을 돌려준다., 이미 '좋아요'를 한번 눌렀으면 '0'으로 sw값을 보내준다.
        HttpSession session = request.getSession();
        ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
        if (goodIdx == null) {
            goodIdx = new ArrayList<String>();
        }
        String imsiGoodIdx = "boardGood" + idx;
        if (!goodIdx.contains(imsiGoodIdx)) {
            dao.setGoodUpdate(idx);
            goodIdx.add(imsiGoodIdx);
            sw = "1";    // 처음으로 좋아요 버튼을 클릭하였기에 '1'을 반환
        } else {
            dao.setGoodPlusMinus(idx, -1);  // 이미 좋아요를 누른 경우 좋아요를 해제하기 위해 -1 값을 전달하여 좋아요 수를 감소시킴
            goodIdx.remove(imsiGoodIdx);
            sw = "0";    // 좋아요 해제 후 '0'을 반환
        }
        session.setAttribute("sGoodIdx", goodIdx);

        // 현재 게시글의 전체 내용 보기
        BoardVO vo = dao.getBoardContent(idx);

        request.setAttribute("vo", vo);
        response.getWriter().write(sw);
	}

}
