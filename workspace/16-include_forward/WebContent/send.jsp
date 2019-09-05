<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String name = "hong";
   //페이지 이동                
   //response.sendRedirect("sendResult.jsp?name=" + name); //get방식 
   
   response.sendRedirect("sendResult.jsp?"); //session 이용 
   // session.setAttribute("name", name);
       
   request.setAttribute("name", name);  //request 이용 
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>현재 페이지는 send.jsp 입니다. </p>
</body>
</html>