package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardReplyFormAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//원글에 대한 정보가 넘어옴 
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		
		BoardDAO boardDAO = new BoardDAO();
		BoardBean boardBean = new BoardBean();
		
		//원글에 대한 정보 얻기 (원글에 대한 ref, lev, seq 라는 정보들)
		boardBean = boardDAO.viewBoard(board_num);
		request.setAttribute("boardBean", boardBean);
		request.setAttribute("pg", pg);
	  
		
		return "/board/board_reply.jsp";
	}

}
