package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.controller.Action;

public class LogoutAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		
		session.invalidate();	// 무효화, 전부 삭제
		//세션은 페이지가 이동되도 유지되기 때문에 request 로 공유함 
		request.setAttribute("req_page", "/member/logout.jsp" );
		return "index.jsp";
	}

}
