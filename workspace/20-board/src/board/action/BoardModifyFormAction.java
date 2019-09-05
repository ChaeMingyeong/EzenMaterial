package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.controller.Action;
import board.dao.BoardDAO;
import boardbean.BoardBean;

public class BoardModifyFormAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		BoardBean boardBean = new BoardBean();
		BoardDAO boardDAO = new BoardDAO();
		boardBean =  boardDAO.viewBoard(board_num);
		
		  request.setAttribute("boardBean", boardBean); //HTML , 자바 
		  request.setAttribute("pg", pg);
		  request.setAttribute("req_page", "/board/boardModify.jsp");
		return "index.jsp";
	}

}
