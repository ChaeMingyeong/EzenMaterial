package score.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import score.controller.Action;
import score.dao.BoardDAO;
import scorebean.BoardBean;

public class ScoreListAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
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
		
		
		 System.out.println("startPage = " + startPage);
		 request.setAttribute("list", list);
		 request.setAttribute("totalP", totalP);
		 request.setAttribute("endPage", endPage);
		 request.setAttribute("starPage", startPage);
		
		 request.setAttribute("pg", pg);
		 request.setAttribute("req_page", "score/scoreList.jsp");

		
		//공유된데이터처리파일
		return "index.jsp";
		
	}

}
