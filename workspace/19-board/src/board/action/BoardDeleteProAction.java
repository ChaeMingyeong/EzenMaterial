package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;

public class BoardDeleteProAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_pass = request.getParameter("board_pass");
		int pg = Integer.parseInt(request.getParameter("board_num"));
		
		String forward = null;
		BoardDAO boardDAO = new BoardDAO();
		int su = 0;
		boolean chkPass = boardDAO.chkPass(board_num, board_pass);

		if(chkPass==true) {
			 su = boardDAO.boardDelete(board_num);
		}
		
		
		if (su >0) { //삭제성공


			forward = "boardList.do?pg=" + pg;

		} else { //삭제실패 

			forward = "boardDetail.do?pg=" +pg +"&board_num=" + board_num;
		}

		// 상세보기 , 리스트
		return forward;
	}

}
