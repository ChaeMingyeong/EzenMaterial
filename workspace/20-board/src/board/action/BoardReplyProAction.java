package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.controller.Action;
import board.dao.BoardDAO;
import boardbean.BoardBean;

public class BoardReplyProAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		
		BoardBean boardBean = null;
		int board_re_ref = Integer.parseInt(request.getParameter("board_re_ref"));
		int board_re_lev = Integer.parseInt(request.getParameter("board_re_lev"));
		int board_re_seq = Integer.parseInt(request.getParameter("board_re_seq"));
	
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_subject = request.getParameter("board_subject");
		String board_content = request.getParameter("board_content");
        
	    int board_num = Integer.parseInt(request.getParameter("board_num"));
	    
	  
        boardBean = new BoardBean();
		boardBean.setBoard_name(board_name);
		boardBean.setBoard_pass(board_pass);
		boardBean.setBoard_subject(board_subject);
		boardBean.setBoard_content(board_content);		
		boardBean.setBoard_num(board_num);
		boardBean.setBoard_re_ref(board_re_ref);
		boardBean.setBoard_re_lev(board_re_lev);
		boardBean.setBoard_re_seq(board_re_seq);
		
		BoardDAO boardDao = new BoardDAO();
		int insertCount = boardDao.insertReplyArticle(boardBean);
		String forward =null;
		if(insertCount == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답글저장'");
			out.println("history.back();");
			out.println("<script>");
		}else {
			forward ="boardList.do?pg=" +pg;
		}
		return forward;
		
	}

}
