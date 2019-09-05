<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //String name = request.getParameter("name"); //get방식 
   //String name = (String) session.getAttribute("name"); //session 이용
   String name = (String) request.getAttribute("name");  //request 이용
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>이름: <%= name %></p>
<p>현재 페이지는 forwardResult.jsp 입니다.</p>

</body>
</html>