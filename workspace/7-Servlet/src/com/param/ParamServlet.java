package com.param;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ParamServlet() {
        super();
        
    }

                              //3. 넘어온 데이터를 리퀘스트에 담아서 데이터처리)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 데이터 처리 : request 객체 사용 
		// post 방식으로 넘어올 때 한글 처리 
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		System.out.println("name = " + name);
		System.out.println("age = " + age);
		//html문서 만들기  : response 객체  
		response.setContentType("text/html; charset =UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet</title>");
		out.println("</head>");
		
		out.println("<body>");
		out.println("<p>");
		out.println(name + "님의 나이는" + age + "살이므로, " );
		if(age >=20) {
			out.println("성인입니다. ");
		}else {
			out.println("청소년입니다. ");
		}
		out.println("</p>");
		out.println("</body>");
		out.println("</html>");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
