package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyFormAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		BoardDAO boardDAO = new BoardDAO();
		BoardBean boardBean = new BoardBean();
		
		
		boardBean = boardDAO.viewBoard(board_num);
		
		request.setAttribute("boardBean", boardBean);
		request.setAttribute("pg", pg);
		String forward = "/board/board_modify.jsp";
		return forward;
	}

}
