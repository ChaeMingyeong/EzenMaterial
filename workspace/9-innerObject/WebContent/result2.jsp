<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    //데이터처리
    String str_x =request.getParameter("x");
    String str_y =request.getParameter("y");
    
    int x = 0;
    int y = 0;
    
    //입력값 있는지 검사
    if(!str_x.equals("")&&!str_y.equals("")){
        x = Integer.parseInt(str_x);  //입력받은 값이 있을 때 x와 y에 클라이언트에서부터 전달받은 데이터가 채워짐
        y = Integer.parseInt(str_y);
    } 
    
    //입력값이 숫자만으로 구성되었는 지 검사 
    // => 정규표현식으로 검사 
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <p><%= x %> +  <%= y %> = <%= x+y %></p>
    <p><%= x %> -  <%= y %> = <%= x-y %></p>
    <p><%= x %> *  <%= y %> = <%= x*y %></p>
    <p><%= x %> /  <%= y %> = <%= (double)x/y %>
    
    <br>
       클라이언트 IP = <%= request.getRemoteAddr() %><br>
       요청정보 길이 = <%= request.getContentLength() %><br>
       요청정보 인코딩 = <%= request.getCharacterEncoding() %><br>
       요청정보 컨텐트 타입 = <%= request.getContentType() %><br>
       요청정보 프로토콜 = <%= request.getProtocol() %><br>
       요청정보 전송방식 = <%= request.getMethod() %><br>
       요청 URI = <%= request.getRequestURI() %> <br>
       요청 URL = <%= request.getRequestURL() %> <br>    
       컨텍스트 경로 = <%= request.getContextPath() %><br>
       서버이름 = <%= request.getServerName() %><br>
       서버포트 = <%= request.getServerPort() %><br>
   <hr>
   <h3>헤더정보</h3> 
  <%
    Enumeration header = request.getHeaderNames(); //클라이언트에 있는 정보들을 서버(아파치,톰캣)쪽에서 활용 
    while(header.hasMoreElements()){               
    	String headerName = (String) header.nextElement();
    	String headerValue = request.getHeader(headerName);
    
  %> 
    <%= headerName %> : <%= headerValue %> <br>
  <%
  }
  %>  
</body>
</html>