package exam2.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MessageNullAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("result", "전달된 내용이 없습니다."); //다음 jsp파일이 뜰 때까지 계속 데이터 유지 
		return "messageView.jsp";  // 이 결과를 보여줄 jsp 파일 리턴 
	}
      
}
