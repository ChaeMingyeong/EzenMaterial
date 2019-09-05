<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   //String name = request.getParameter("name"); //get방식  
     
   //String name = (String)session.getAttribute("name"); //session 이용 ->return값이 object이기 때문에 형변환필수 
  
   String name = (String)request.getAttribute("name"); //request 이용 (꺼내올때)
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>현재 페이지는 sendResult.jsp 입니다.</p>
<p>이름: <%= name %></p>

</body>
</html>