package exam3.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class MessageAction implements Action {
     public String process(HttpServletRequest request, HttpServletResponse response) {
    	 request.setAttribute("message", "명령어를 요청 파라미터로 전달");
    	 return "/exam3/messageView.jsp";
     }
}
