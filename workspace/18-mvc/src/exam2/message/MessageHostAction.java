package exam2.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 데이터 처리 클래스의 역할
// 1.데이터 처리
// 2.데이터 공유
// 3.처리된 결과를 보여줄 jsp 파일 선택 
public class MessageHostAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        request.setAttribute("result", "고길동 입니다.");
		return "messageView.jsp";  //다시 MessageController에 돌려줌 
		// MessageController1에 있는  view = action.process(request, response) 부분 
		
	}
    
}
