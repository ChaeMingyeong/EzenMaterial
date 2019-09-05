package exam2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam2.message.Action;
import exam2.message.MessageGuestAction;
import exam2.message.MessageHostAction;
import exam2.message.MessageMismatchAction;
import exam2.message.MessageNullAction;


@WebServlet("/MessageController1")
public class MessageController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MessageController1() {
        super();
      
    }

	//1.웹브라우저의 요청받기 (get, post 방식) 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		process(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String message =null;
		  String view = null;
		  
		  //2. 요청 정보 확인 
		  message = request.getParameter("message"); //아직까진 null
		
		  //3.요청 작업처리 
		  //4.요청 처리 결과를 request 객체에 저장  
		  Action action = null; 
		  
		  if(message == null) { //데이터 처리를 클래스로 더 세분화시킴
			  action = new MessageNullAction(); //자식클래스함수호출(다양한 형태의 자식클래스를 부모하나로 제어)
			                                    
		  }else if(message.equals("host")) {
			  action = new MessageHostAction();
		  }else if(message.equals("guest")) {
			  action = new MessageGuestAction();
		  }else {
			  action = new MessageMismatchAction();
		  }
		  if(action!=null) {
			  try {
			//(html에서 사용할)데이터처리, (html에서 사용할 데이터)공유걸기, (html) 파일이름 만들기 
				view = action.process(request, response); 				
			} catch (Throwable e) {
				e.printStackTrace();
			}
		  }
		  // 5.응답을 위한 view를 선택하고, forward 처리 
		  RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		  dispatcher.forward(request, response);
	}
}
