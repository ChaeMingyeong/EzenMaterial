package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.controller.Action;

public class BoardModifyFailAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//데이터처리
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int err_no = Integer.parseInt(request.getParameter("err_no"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		//데이터 공유
		request.setAttribute("board_num", board_num);
		request.setAttribute("err_no", err_no);
		request.setAttribute("pg", pg);
		request.setAttribute("req_page", "/board/boardModifyFail.jsp");
		//view 처리파일 선택 
		return "index.jsp";
	}

}
