package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HelloServlet() {
        super();
       
    }
    
    
   // 톰캣서버가 처음 시작될 때, web.xml에 등록된 서블릿클래스를 실행하는데,  
   // 제일 먼저 호출되는 함수 
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("init() 함수 호출");
	}



	// 톰캣서버가 종료될 때 또는 서블릿이 수정되어 새로이 저장되면,
	// 서블릿이 종료될 때 호출되는 함수. 
	@Override
	public void destroy() {
		super.destroy();
		System.out.println("destroy()함수 호출");
	}

    // 클라이언트에게 요청이 올 때마다 호출,  전송방식이 get 방식일때  
	// request : 요청정보가 저장된 객체
	// response : 응답처리를 담당하는 객체
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 함수 호출");
		/**데이터 처리 : request 객체 사용*/ 
		/**HTML 문서 만들기  : response 객체 사용*/ 
		//이후의 문자열을 HTML로 인식해라 (content = "text.html" ~~~ meta ="~~~) 
		response.setContentType("text/html; charset =UTF-8"); //response 는 html문서만들기 
	    PrintWriter out = response.getWriter(); //response가 갖고있는 printwriter을 통해서 문서 html 작성 
	    out.println("<html>");  
		out.println("<head>");
		out.println("<title>Servlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<p>Hello Servlet</p>");
	    out.println("<p>안녕 서블릿!!</p>");
	    out.println("</body>");
		out.println("</html>");  //아파치서버가 톰캣서버의 것들을 받아서 가지고 있다가 브라우저로 보냄 //html문서를 데이터처리한 결과를 담아서 보내줌 
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	// 클라이언트에게 요청이 올 때마다 호출, 전송방식이 post 방식일때   (post방식이면 post에 왔다가 get으로 다시 전달됨 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
