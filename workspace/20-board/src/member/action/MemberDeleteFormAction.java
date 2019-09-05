package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.controller.Action;

public class MemberDeleteFormAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //데이터처리
		//데이터공유
		//view 처리 파일 선택
		request.setAttribute("req_page", "member/deleteForm.jsp");
		return "index.jsp";
	}

}
