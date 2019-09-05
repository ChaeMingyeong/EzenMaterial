package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.controller.Action;

public class BoardWriteFormAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    //데이터 처리
		//데이터 공유
		request.setAttribute("req_page", "/board/boardWriteForm.jsp");  
	
		//view 처리 파일 선택
		return "index.jsp";
	}

}
