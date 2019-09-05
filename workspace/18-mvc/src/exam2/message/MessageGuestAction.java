package exam2.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MessageGuestAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {	
		//데이터 처리 코드가 들어갈 부분(현재는 없음)
		
		//데이터공유부분
		request.setAttribute("result", "홍길동입니다");
		
		//데이터를 보여줄 jsp 파일 
		return "messageView.jsp";
	}
      
}
