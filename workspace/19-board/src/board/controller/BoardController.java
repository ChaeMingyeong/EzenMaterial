package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.action.Action;
import board.action.BoardDeleteProAction;
import board.action.BoardDetailAction;
import board.action.BoardListAction;
import board.action.BoardModifyFormAction;
import board.action.BoardModifyProAction;
import board.action.BoardReplyFormAction;
import board.action.BoardReplyProAction;
import board.action.BoardWriteProAction;


@WebServlet("*.do") //끝에 .do인 파일만 반응하게끔  
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BoardController() {
        super();
     
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
        request.setCharacterEncoding("UTF-8");	
        //1. 요청정보확인
        String command = request.getServletPath();
        System.out.println("command = " + command);
        /** 데이터 처리 */
        //2. 요청작업처리
        //=> 데이터 처리 클래스 선택
        //=> 데이터 처리
        //=> view 처리 파일 선택 
        //String message = null;
        String forward = null; //view 처리용 jsp 파일 이름 저장 
        Action action = null; //데이터 처리 클래스 저장                              
       
       
        
       // message = Integer.parseInt((String) request.getAttribute("su")); 
        //System.out.println("message = " + message);
        
        if(command.equals("/boardWriteForm.do")) {
        	forward = "/board/boardWriteForm.jsp";
        }else if(command.equals("/boardWritePro.do")) {
        
        	action = new BoardWriteProAction();
        	// forward = "/board/boardList.jsp";
        }else if(command.equals("/boardList.do")) {
        	action = new BoardListAction();
        	
        }else if(command.equals("/boardDetail.do")) {
        	action = new BoardDetailAction();
        } else if(command.equals("/boardDeleteForm.do")) {
        	forward = "/board/board_delete.jsp";
        }else if(command.equals("/boardDeletePro.do")) {
        	System.out.println("pg = " + request.getParameter("pg"));
        	System.out.println("board_pass = " + request.getParameter("board_pass"));
        	System.out.println("board_num = " + request.getParameter("board_num"));
        	action = new BoardDeleteProAction();
        }else if(command.equals("/boardModifyForm.do")) {
        	action = new BoardModifyFormAction();	
        }else if(command.equals("/boardModifyPro.do")) {
        	action = new BoardModifyProAction();
        }else if(command.equals("/boardReflyForm.do")) {
            action = new BoardReplyFormAction();
            System.out.println("pg = " + request.getParameter("pg"));
            System.out.println("board_num = " + request.getParameter("board_num"));
        }else if(command.equals("/boardReplyPro.do")) {
        	action = new BoardReplyProAction();
        	System.out.println("pg = " + request.getParameter("pg"));
        	System.out.println("board_num = " + request.getParameter("board_num"));
        }
        
        //데이터 처리가 필요하면 *.do, 아니라면.jsp
      
      
      
       if(action !=null) {
      	 try {
				forward = action.process(request, response);
			} catch (Throwable e) {
				
				e.printStackTrace();
			}
        
      }
           
        
        /** view 처리(HTML 작업)*/
        if(forward!=null) {
        	RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
        	dispatcher.forward(request, response);
        }
	}

}
