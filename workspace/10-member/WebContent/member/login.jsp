<%@page import="javax.servlet.http.Cookie"%>

<%@page import="java.net.URLEncoder"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   
   MemberDAO memberDAO = new MemberDAO();
    String name = memberDAO.login(id, pwd);
     if(name !=null)   { 
    	/* 페이지 이동
    	   get 방식으로 이동하기 때문에 이름과 id가 주소창에 오픈된다. 보안에 취약
    	      쿠키나 세션으로 보내야함(다음 장에서). 
    	*/
       //response.sendRedirect("loginOk.jsp?name=" + 
    	//자바영역에서 데이터이동할 때는 2바이트에서 3바이트로 바꾸려면(한글안깨지게)
    	//URLEncoder.encode(name, "utf-8") + "&id=" + id);  
    	/* 데이터 공유 1 : 쿠키이용 */
    /*	Cookie cookie1 = new  Cookie("memName", URLEncoder.encode(name,"UTF-8"));
    	cookie1.setMaxAge(120); //120초 설정 
    	
    	Cookie cookie2 = new  Cookie("memId", id);
    	cookie2.setMaxAge(120); //120초 설정 
    	response.addCookie(cookie1);
    	response.addCookie(cookie2); 
    */
    	/* 데이터 공유 2 : 세션 이용 */
    	session.setAttribute("memName", name);
    	session.setAttribute("memId", id); //세션은 내장객체를 사용하기 때문에 코드가 간단 
    
    	response.sendRedirect("loginOk.jsp");
    } else {
       response.sendRedirect("loginFail.jsp");
   } 


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      
      
</body>
</html>