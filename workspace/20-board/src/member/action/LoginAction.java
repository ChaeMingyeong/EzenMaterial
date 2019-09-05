package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import board.controller.Action;
import member.dao.MemberDAO;

public class LoginAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
        
		MemberDAO memberDAO = new MemberDAO();
		String name = memberDAO.login(id, pwd);	
		HttpSession session = request.getSession();  
		if(name != null) { 	
			/* 페이지 이동
				get 방식으로 이동하기 때문에 이름과 id가 주소창에 오픈된다. 보안에 취약
				그래서 쿠키나 세션으로 보내야 함(다음 장에서 할 것임).
			*/
			//response.sendRedirect("loginOk.jsp?name="
			//		+ URLEncoder.encode(name, "utf-8") + "&id=" + id);
			
			/* 데이터 공유 1 : 쿠키 이용 */
	/*		Cookie cookie1 = new Cookie("memName", 
					URLEncoder.encode(name, "UTF-8"));
			cookie1.setMaxAge(120);		// 120초 설정
			Cookie cookie2 = new Cookie("memId", id);
			cookie2.setMaxAge(120);		// 120초 설정
			
			response.addCookie(cookie1);
			response.addCookie(cookie2);
	*/		
			/* 데이터 공유 2 : 세션 이용 */
			//request와 responese 는 서블릿에서 전달받고 있지만 세션은 전달받고 있지 않기 때문에 
			//자바클래스(독립된개체기 때문에)서는 세션을 가져와야함 
			//이러면 jsp에서 sessionScope으로 사용가능 
			
			session.setAttribute("memName", name);
			session.setAttribute("memId", id);
			request.setAttribute("req_page", "/member/loginOk.jsp");
			
		} else { 
			//session.setAttribute("req_page", "/member/loginForm.jsp");
			request.setAttribute("req_page", "/member/loginFail.jsp");
			
		} 
		return "index.jsp";
	}

}
