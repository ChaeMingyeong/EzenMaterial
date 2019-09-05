package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;

import board.controller.Action;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import sun.rmi.server.Dispatcher;

public class MemberModifyFormReadyAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = memberDAO.selectOne(id);
		request.setAttribute("memberDTO", memberDTO);
		request.setAttribute("req_page", "/member/modifyForm.jsp");
		
		
		return "index.jsp";
	}

}
