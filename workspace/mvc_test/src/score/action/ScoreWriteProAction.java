package score.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import score.controller.Action;
import score.dao.BoardDAO;
import scorebean.BoardBean;

public class ScoreWriteProAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   
		request.setCharacterEncoding("UTF-8");
		String forward = null;
	    int hak = Integer.parseInt(request.getParameter("hak"));		
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		int his = Integer.parseInt(request.getParameter("his"));
		int tot = kor + eng + mat + his;
		double avg = (double)tot/4; 
	    BoardDAO boardDAO = new BoardDAO();
	    BoardBean boardBean = new BoardBean();
	    boardBean.setHak(hak);
	    boardBean.setName(name);
	    boardBean.setKor(kor);
	    boardBean.setEng(eng);
	    boardBean.setMat(mat);
	    boardBean.setHis(his);
	    boardBean.setTot(tot);
	    boardBean.setAvg(avg);
	    
	    int su = boardDAO.insertBoard(boardBean);
		if(su==0) {
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = "scoreList.do?su=" + su;
		}
		
		return forward;
	}
	
}
