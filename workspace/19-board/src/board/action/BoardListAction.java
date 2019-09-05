package board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardListAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	    //데이터처리
		int pg = 1;
		if(request.getParameter("pg") !=null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		BoardDAO boardDAO = new BoardDAO();
		List<BoardBean> list = new ArrayList<BoardBean>();
		int endNum = pg * 10;
		int startNum = endNum -9;
		list = boardDAO.boardList(startNum, endNum);
		
		int totalA = boardDAO.selectListCount(); //총 글갯수
		int totalP = (totalA + 9)/10;         //총 페이지 수 
		
		int startPage = (pg-1)/3*3 + 1;
		int endPage = startPage + 2;
		if(endPage > totalP) endPage = totalP;
		
		//데이터공유 
		//int su = (int)request.getAttribute("su");
		 //request.setAttribute("su", su);
		 System.out.println("startPage = " + startPage);
		 request.setAttribute("list", list);
		 request.setAttribute("totalP", totalP);
		 request.setAttribute("endPage", endPage);
		 request.setAttribute("starPage", startPage);
		// request.setAttribute("endNum", endNum);
		// request.setAttribute("startNum", startNum);
		 request.setAttribute("pg", pg);
		//request.setAttribute("su", su);
		
		//공유된데이터처리파일
		return "/board/boardList.jsp";
	}
      
}
