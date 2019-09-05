package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.controller.Action;
import board.dao.BoardDAO;
import boardbean.BoardBean;

public class BoardDetailAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		int pg = Integer.parseInt(request.getParameter("pg")); 
		//int board_num = (int) request.getAttribute("board_num");
		int board_num = Integer.parseInt(request.getParameter("board_num"));	
		
		System.out.println("board_num = " + board_num);
		System.out.println("pg = " + pg);
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.updateReadCount(board_num);
		BoardBean bean = boardDAO.viewBoard(board_num);
		
		System.out.println(board_num);
		System.out.println(pg);     
		request.setAttribute("bean", bean);
		request.setAttribute("pg", pg);
		request.setAttribute("req_page", "board/boardView.jsp");
		
		return "index.jsp";
	}

}
